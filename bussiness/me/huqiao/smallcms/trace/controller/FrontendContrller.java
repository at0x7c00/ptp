package me.huqiao.smallcms.trace.controller;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.huqiao.smallcms.common.entity.CommonFile;
import me.huqiao.smallcms.common.entity.enumtype.UseStatus;
import me.huqiao.smallcms.common.entity.propertyeditor.CommonFileEditor;
import me.huqiao.smallcms.common.service.ICommonFileService;
import me.huqiao.smallcms.servlet.VerifyImageServlet;
import me.huqiao.smallcms.sms.service.ISMSService;
import me.huqiao.smallcms.sms.service.impl.SMSServiceImpl;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.sys.service.IFunctionPointService;
import me.huqiao.smallcms.sys.service.IUserService;
import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.trace.entity.enumtype.RegisterApplyStatus;
import me.huqiao.smallcms.trace.entity.propertyeditor.RegisterApplyEditor;
import me.huqiao.smallcms.trace.service.IOperateLogService;
import me.huqiao.smallcms.trace.service.IRegisterApplyService;
import me.huqiao.smallcms.util.CommonUtil;
import me.huqiao.smallcms.util.Constants;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.StringUtil;
import me.huqiao.smallcms.util.web.JsonResult;
import me.huqiao.smallcms.util.web.LoginInfo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class FrontendContrller{

	@Resource
	private ISMSService smsService;
	@Resource
	private IOperateLogService operateLogService;
	@Resource
	private IUserService userService;
    @Resource
    private IFunctionPointService functionPointService;
    @Resource
    private IRegisterApplyService applyService;
    @Resource
    private ICommonFileService fileService;

    
	@Value("${sm.limit.per.ip}")
	private Integer ipLimitOfDay;
	
	@RequestMapping("/loginUI")
	public String loginUI(){
		
		return "userLoginUI";
	}
	
    @InitBinder
	public void initPropEditor(WebDataBinder binder){
         binder.registerCustomEditor(RegisterApply.class,new RegisterApplyEditor(applyService));
         binder.registerCustomEditor(CommonFile.class,new CommonFileEditor(fileService));
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!response.isCommitted()){
			if (isLogined()) {
				return "adminIndex";
			}
			return "redirect:/loginUI.do";
    	}
    	return null;
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerUI(){
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult register(@ModelAttribute RegisterApply registerApply,
			HttpServletRequest request,
			@RequestParam("vcode")String vcode,
			@RequestParam("ckCode")String ckCode,
			@RequestParam("license")String license,
			@RequestParam("lawPersonID")String lawPersonID,
			@RequestParam(value = "otherQualifi",required = false)String[] otherQualifi
			){
		String ip = request.getRemoteHost();
		try{
			//数据完整性
			JsonResult formValidate = registerApply.baseDataValidate();
			if(!formValidate.isOK()){
				operateLogService.addLog("WARN",ip,"Register:" + registerApply.getUsername(),GetCodeMsgs.FORM_DATA_INVALID);
				return JsonResult.error(formValidate.getMessage());
			}
			//验证码
			if(!pageVerifyCodeValidate(vcode,request)){
				operateLogService.addLog("WARN",ip,"Register:" + registerApply.getUsername(),GetCodeMsgs.INVALID_VCODE);
				return JsonResult.error(GetCodeMsgs.INVALID_VCODE);
			}
			//动态码
			String smsCode = (String)request.getSession().getAttribute("SMS_CODE");
			if(StringUtil.isEmpty(smsCode) || !smsCode.equals(ckCode) || !operateLogService.hasCodeCreated(registerApply.getMobileNumber(),SECONDS_OF_FIVE_MINUTE,ckCode)){
				operateLogService.addLog("WARN",ip,"Register:"+registerApply.getUsername(),GetCodeMsgs.TIME_TOO_LONG);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_LONG);
			}
			
			//用户名
			User user = userService.getById(User.class, registerApply.getUsername());
			if(user!=null){
				operateLogService.addLog("WARN",ip,"Register:"+registerApply.getUsername(),GetCodeMsgs.USER_EXISTED);
				return JsonResult.error(GetCodeMsgs.USER_EXISTED);
			}
			
			//营业执照
			CommonFile licenseFile = fileService.getEntityByProperty(CommonFile.class, "manageKey",license);
			if(licenseFile==null){
				operateLogService.addLog("WARN",ip,"Register:" + registerApply.getUsername(),GetCodeMsgs.FORM_DATA_INVALID+":No license file");
				return JsonResult.error("请上传营业执照");
			}else{
				licenseFile.setInuse(UseStatus.InUse);
				fileService.update(licenseFile);
				registerApply.setLicense(licenseFile);
			}
			
			//法人身份证
			CommonFile lawpersonIDFile = fileService.getEntityByProperty(CommonFile.class, "manageKey",lawPersonID);
			if(lawpersonIDFile==null){
				operateLogService.addLog("WARN",ip,"Register:" + registerApply.getUsername(),GetCodeMsgs.FORM_DATA_INVALID+":No lawpersonID file");
				return JsonResult.error("请上传营业执照");
			}else{
				lawpersonIDFile.setInuse(UseStatus.InUse);
				fileService.update(lawpersonIDFile);
				registerApply.setLawPersonIDCard(lawpersonIDFile);
			}
			
			//其他资质
			if(otherQualifi!=null){
				Set<CommonFile> files = new HashSet<CommonFile>();
				for(String other : otherQualifi){
					CommonFile otherFile = fileService.getEntityByProperty(CommonFile.class, "manageKey",other);
					if(otherFile!=null){
						files.add(otherFile);
					}
				}
				registerApply.setOtherQualifications(files);
			}
			
			registerApply.setStatus(RegisterApplyStatus.UnDeal);
			registerApply.setManageKey(Md5Util.getManageKey());
			applyService.add(registerApply);
			clearRandomCode(request.getSession());
			return JsonResult.success(registerApply.getManageKey());
			
		}catch(Exception e){
			operateLogService.addLog("WARN",ip,"Register:"+registerApply.getUsername(),GetCodeMsgs.SERVER_ERROR + ":" + e.getMessage());
			e.printStackTrace();
			return JsonResult.error("Server-error");
		}
	}
	
	@RequestMapping(value = "/regDetail",method = RequestMethod.GET)
	public void registerSuccess(@RequestParam("key")String code,HttpServletRequest request){
		RegisterApply apply = applyService.getEntityByProperty(RegisterApply.class, "manageKey", code);
		request.setAttribute("apply", apply);
	}
	
	@RequestMapping(value = "/iforget",method = RequestMethod.GET)
	public void iforgetUI(){
	}
	
	@RequestMapping(value = "/resetPwd",method = RequestMethod.POST)
	@ResponseBody
	public JsonResult resetPwd(@RequestParam("token")String token,@RequestParam("pwd")String pwd,HttpServletRequest request){
		
		String ip = request.getRemoteHost();
		try{
			String username = (String)request.getSession().getAttribute(token);
			if(StringUtil.isEmpty(username)){
				operateLogService.addLog("WARN",ip,"ResetPwd:"+token,GetCodeMsgs.ILLEGAL_ACCESS);
				return JsonResult.error(GetCodeMsgs.ILLEGAL_ACCESS);
			}
			
			User user = userService.getById(User.class, username);
			if(user==null){
				operateLogService.addLog("WARN",ip,"ResetPwd:" + username,GetCodeMsgs.USER_NOT_FOUND);
				return JsonResult.error(GetCodeMsgs.USER_NOT_FOUND);
			}
			if(!StringUtil.passwordValidate(pwd,new StringBuffer(),"title")){
				operateLogService.addLog("WARN",ip,"ResetPwd:" + username,GetCodeMsgs.FORM_DATA_INVALID);
				return JsonResult.error(GetCodeMsgs.FORM_DATA_INVALID);
			}
			user.setPassword(Md5Util.getMD5Code(pwd));
			userService.update(user);
			request.getSession().removeAttribute(token);
			
			prepareFunctionPoint(request.getSession(),user);
			request.getSession().setAttribute("____logintype", "customer");
			return JsonResult.success("OK");
			
		}catch(Exception e){
			operateLogService.addLog("WARN",ip,"ResetPwd:"+token,GetCodeMsgs.SERVER_ERROR + ":" + e.getMessage());
			e.printStackTrace();
			return JsonResult.error("Server-error");
		}
	}
	
	@RequestMapping(value = "/query/{uuid}")
	public String query(@PathVariable(value = "uuid")String uuid){
		
		return "query";
	}
	
	@RequestMapping(value = "/ulogin")
	@ResponseBody
	public JsonResult login(@RequestParam(value = "username")String username,
			@RequestParam(value = "password")String password,
			@RequestParam(value = "ckCode")String ckCode,
			@RequestParam(value = "vcode")String vcode,
			HttpServletRequest request){
		
		String ip = request.getRemoteHost();
		try{
			//验证码
			if(!pageVerifyCodeValidate(vcode,request)){
				operateLogService.addLog("WARN",ip,"Login:" + username,GetCodeMsgs.INVALID_VCODE);
				return JsonResult.error(GetCodeMsgs.INVALID_VCODE);
			}
			//账户
			User user = userService.findByUsernameOfPhonenumber(username,username);
			if(user==null){
				operateLogService.addLog("WARN",ip,"Login:" + username,GetCodeMsgs.USER_NOT_FOUND);
				return JsonResult.error(GetCodeMsgs.USER_NOT_FOUND);
			}
			
			//动态码
			String smsCode = (String)request.getSession().getAttribute("SMS_CODE");
			if(StringUtil.isEmpty(smsCode) || !smsCode.equals(ckCode) || !operateLogService.hasCodeCreated(user.getPhone(),SECONDS_OF_FIVE_MINUTE,smsCode)){
				operateLogService.addLog("WARN",ip,"Login:"+username,GetCodeMsgs.TIME_TOO_LONG);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_LONG);
			}
			
			//密码
			if(!Md5Util.getMD5Code(password).equals(user.getPassword())){
				operateLogService.addLog("WARN",ip,"Login:"+user.getUsername(),GetCodeMsgs.INVALID_PWD);
				return JsonResult.error(GetCodeMsgs.INVALID_PWD);
			}
			prepareFunctionPoint(request.getSession(),user);
			request.getSession().setAttribute("____logintype", "customer");
			return JsonResult.success("OK");
		}catch(Exception e){
			operateLogService.addLog("WARN",ip,"Login:"+username,GetCodeMsgs.SERVER_ERROR + ":" + e.getMessage());
			e.printStackTrace();
			return JsonResult.error("Server-error");
		}
	}
	
	public static void main(String[] args) {
		System.out.println(Md5Util.getMD5Code("@WSX1qaz"));
	}
	
    private void prepareFunctionPoint(HttpSession session,User user){
	   	 clearRandomCode(session);
	   	 LoginInfo loginInfo = new LoginInfo(user,functionPointService.getFunctionPointsByUser(user));
	   	 session.setAttribute(Constants.LOGIN_INFO_IN_SESSION, loginInfo);
	   	 session.setAttribute("___currentUser", user);
   }
    
    /**
     * 清除随机码
     * @param session HttpSession对象
     */
    private void clearRandomCode(HttpSession session){
    	session.setAttribute(Constants.RANOM_CODE_FOR_LOGIN,null);
    	session.setAttribute(VerifyImageServlet.SIMPLE_CAPCHA_SESSION_KEY,null);
    	session.setAttribute("SMS_CODE",null);
    }
	
	
	final static Long SECONDS_OF_ONE_MINUTE = 60l;
	final static Long SECONDS_OF_FIVE_MINUTE = SECONDS_OF_ONE_MINUTE * 5;
	
	@RequestMapping(value = "/code",produces={"application/json"})
	@ResponseBody
	public JsonResult getCode(@RequestParam(value = "for")String forWhat,
			@RequestParam(value = "number",required = false)String number,
			@RequestParam(value = "username",required = false)String username,
			@RequestParam(value = "vcode",required = false)String vcode,
			HttpServletRequest request){
		JsonResult sendResult = null;
		try{
			//获取Code的验证
			String ip = request.getRemoteHost();
			if(!pageVerifyCodeValidate(vcode,request)){
				operateLogService.addLog("WARN",ip,"getCode:"+number+"," + username,GetCodeMsgs.INVALID_VCODE);
				return JsonResult.error(GetCodeMsgs.INVALID_VCODE);
			}
			//为登录和密码找回查询用户信息
			User user = null;
			if("login".equals(forWhat) || "forget".equals(forWhat)){
				user = userService.findByUsernameOfPhonenumber(username,number);
				if(user==null){
					operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.USER_NOT_FOUND);
					return JsonResult.error(GetCodeMsgs.USER_NOT_FOUND);
				}
				number = user.getPhone();
			}
			if(operateLogService.hasCodeCreated(number,SECONDS_OF_ONE_MINUTE)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.TIME_TOO_SHORT);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_SHORT);
			}
			if(!operateLogService.ipValidate(number,ipLimitOfDay)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.IP_TOO_FREQUENT);
				return JsonResult.error(GetCodeMsgs.IP_TOO_FREQUENT);
			}
			
			if("register".equals(forWhat)){
				sendResult = smsService.sendRegisterCheckCode(number);
			}else if("login".equals(forWhat)){
				sendResult = smsService.sendLoginCheckCode(number);
			}else if("forget".equals(forWhat)){
				sendResult = smsService.sendForgetCheckCode(number);
			}else{
				operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.ILLEGAL_ACCESS);
				return JsonResult.error(GetCodeMsgs.ILLEGAL_ACCESS);
			}
			if(sendResult.isOK()){
				operateLogService.addLog("INFO",ip,"getCode:"+number,sendResult.getMessage());
				request.getSession().setAttribute("SMS_CODE", sendResult.getMessage());
				return JsonResult.success(CommonUtil.replaceMobileNumberToStarts(number));
			}else if(sendResult.getMessage().equals("isv.MOBILE_NUMBER_ILLEGAL")){
				operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.WRONG_NUMBER);
				return JsonResult.error(GetCodeMsgs.WRONG_NUMBER);
			}else{
				operateLogService.addLog("ERROR",ip,"getCode:" + number,sendResult.getMessage() + ":" + SMSServiceImpl.Errors.get(sendResult.getMessage()));
				return JsonResult.error(GetCodeMsgs.SERVER_ERROR);
			}
		}catch(Exception e){
			e.printStackTrace();
			return JsonResult.error("Exception");
		}
	}
	
	@RequestMapping(value = "/usernameValidate",produces={"application/json"})
	@ResponseBody
	private JsonResult usernameValidate(@RequestParam("username")String username){
		try{
			User user = userService.getById(User.class, username);
			if(user!=null){
				return JsonResult.success("NO");
			}else{
				return JsonResult.success("OK");
			}
		}catch(Exception e){
			return JsonResult.error(e.getMessage());
		}
	}
	
	@RequestMapping(value = "/token",produces={"application/json"})
	@ResponseBody
	public JsonResult getToken(HttpServletRequest request,
			@RequestParam(value = "username",required = false)String username,
			@RequestParam(value = "ckCode",required = false)String ckCode,
			@RequestParam(value = "vcode",required = false)String vcode){
		try{
			//获取Code的验证
			String ip = request.getRemoteHost();
			if(!pageVerifyCodeValidate(vcode,request)){
				operateLogService.addLog("WARN",ip,"getToken:" + username,GetCodeMsgs.INVALID_VCODE);
				return JsonResult.error(GetCodeMsgs.INVALID_VCODE);
			}
			//为登录和密码找回查询用户信息
			User user = null;
			user = userService.findByUsernameOfPhonenumber(username,username);
			if(user==null){
				operateLogService.addLog("WARN",ip,"getToken:"+username,GetCodeMsgs.USER_NOT_FOUND);
				return JsonResult.error(GetCodeMsgs.USER_NOT_FOUND);
			}
			String number = user.getPhone();
			
			String smsCode = (String)request.getSession().getAttribute("SMS_CODE");
			if(StringUtil.isEmpty(smsCode) || !smsCode.equals(ckCode) || !operateLogService.hasCodeCreated(number,SECONDS_OF_FIVE_MINUTE,smsCode)){
				operateLogService.addLog("WARN",ip,"Register:"+number,GetCodeMsgs.TIME_TOO_LONG);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_LONG);
			}
			if(!operateLogService.ipValidate(number,ipLimitOfDay)){
				operateLogService.addLog("WARN",ip,"getToken:"+number,GetCodeMsgs.IP_TOO_FREQUENT);
				return JsonResult.error(GetCodeMsgs.IP_TOO_FREQUENT);
			}
			String token = Md5Util.getManageKey();
			request.getSession().setAttribute(token, user.getUsername());
			return JsonResult.success(token);
		}catch(Exception e){
			e.printStackTrace();
			return JsonResult.error("Exception");
		}
	}
	
    private boolean pageVerifyCodeValidate(String vcode,HttpServletRequest request) {
    	String vcodeInSession = (String)request.getSession().getAttribute(VerifyImageServlet.SIMPLE_CAPCHA_SESSION_KEY);
		return StringUtil.isNotEmpty(vcodeInSession) && vcodeInSession.toLowerCase().equals(vcode.toLowerCase());
	}

	/**
     * 判断是否登录
     * @return boolean 是否登陆
     */
    protected boolean isLogined(){
    	return getSession().getAttribute(Constants.LOGIN_INFO_IN_SESSION)!=null;
    }
    
	
    /**
     * 获取当前登录用户
     * @return User 当前用户对象
     */
    protected User getCurrentUser(){
    	LoginInfo loginInfo = (LoginInfo)getSession().getAttribute(Constants.LOGIN_INFO_IN_SESSION);
    	return loginInfo==null?null:loginInfo.getUser();
    }
	
    /**
     * 获取request
     * @return HttpServletRequest HttpServletRequest对象
     */
    protected HttpServletRequest getRequset(){
    	ServletRequestAttributes att = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return att.getRequest();
    }
    /**
     * 获取Session 
     * @return HttpSession HttpSession对象
     */
    protected HttpSession getSession(){
    	return this.getRequset().getSession();
    }
    
    
}
