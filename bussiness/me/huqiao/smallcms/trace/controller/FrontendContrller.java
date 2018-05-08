package me.huqiao.smallcms.trace.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.huqiao.smallcms.sms.service.ISMSService;
import me.huqiao.smallcms.sms.service.impl.SMSServiceImpl;
import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.trace.service.IOperateLogService;
import me.huqiao.smallcms.util.Constants;
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
	
	
	final static Long SECONDS_OF_ONE_MINUTE = 60l;
	
	@RequestMapping(value = "/code")
	@ResponseBody
	public JsonResult getCode(@RequestParam(value = "for")String forWhat,
			@RequestParam(value = "number")String number,
			HttpServletRequest request){
		
		JsonResult sendResult = null;
		try{
			String ip = request.getRemoteHost();
			if(!operateLogService.timeValidate(number,SECONDS_OF_ONE_MINUTE)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,"Time-too-short");
			}
			if(!operateLogService.ipValidate(number,ipLimitOfDay)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,"IP-too-frequent");
			}
			if(!pageVerifyCodeValidate(request)){
				operateLogService.addLog("WARN",ip,"getCode:"+number,"Wrong number");
			}
			
			if("register".equals(forWhat)){
				sendResult = smsService.sendRegisterCheckCode(number);
			}else if("login".equals(forWhat)){
				sendResult = smsService.sendLoginCheckCode(number);
			}else if("forget".equals(forWhat)){
				sendResult = smsService.sendForgetCheckCode(number);
			}else{
				return JsonResult.error("Illegal Access");
			}
			if(sendResult.isOK()){
				operateLogService.addLog("INFO",ip,"getCode:"+number,",code:"+sendResult.getMessage());
				return JsonResult.success("OK");
			}else if(sendResult.getMessage().equals("isv.MOBILE_NUMBER_ILLEGAL")){
				operateLogService.addLog("WARN",ip,"getCode:"+number,"Wrong number");
				return JsonResult.error("Wrong-Number");
			}else{
				operateLogService.addLog("ERROR",ip,"getCode:" + number,sendResult.getMessage() + ":" + SMSServiceImpl.Errors.get(sendResult.getMessage()));
				return JsonResult.error("Server-Error");
			}
		}catch(Exception e){
			return JsonResult.error("Exception");
		}
	}
	
    private boolean pageVerifyCodeValidate(HttpServletRequest request) {
		return true;
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
