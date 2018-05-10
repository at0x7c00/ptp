package me.huqiao.smallcms.trace.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.huqiao.smallcms.servlet.VerifyImageServlet;
import me.huqiao.smallcms.sms.service.ISMSService;
import me.huqiao.smallcms.sms.service.impl.SMSServiceImpl;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.sys.service.IFunctionPointService;
import me.huqiao.smallcms.sys.service.IUserService;
import me.huqiao.smallcms.trace.service.IOperateLogService;
import me.huqiao.smallcms.util.CommonUtil;
import me.huqiao.smallcms.util.Constants;
import me.huqiao.smallcms.util.Md5Util;
import me.huqiao.smallcms.util.StringUtil;
import me.huqiao.smallcms.util.web.JsonResult;
import me.huqiao.smallcms.util.web.LoginInfo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
	
	@Value("${sm.limit.per.ip}")
	private Integer ipLimitOfDay;
	
	@RequestMapping("/loginUI")
	public String loginUI(){
		
		return "userLoginUI";
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
	public String register(){
		
		return "registerSuccess";
	}
	
	
	@RequestMapping(value = "/iforget",method = RequestMethod.GET)
	public void iforgetUI(){
		
	}
	
	@RequestMapping(value = "/iforget",method = RequestMethod.POST)
	public String iforget(){
		
		return "registerSuccess";
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
			if(operateLogService.timeValidate(user.getPhone(),SECONDS_OF_FIVE_MINUTE)){
				operateLogService.addLog("WARN",ip,"Login:"+username,GetCodeMsgs.TIME_TOO_LONG);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_LONG);
			}
			
			//密码
			if(!Md5Util.getMD5Code(password).equals(user.getPassword())){
				operateLogService.addLog("WARN",ip,"Login:"+user.getUsername(),GetCodeMsgs.INVALID_PWD);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_LONG);
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
			/*if(!operateLogService.timeValidate(number,SECONDS_OF_ONE_MINUTE)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,GetCodeMsgs.TIME_TOO_SHORT);
				return JsonResult.error(GetCodeMsgs.TIME_TOO_SHORT);
			}*/
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
