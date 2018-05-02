package me.huqiao.smallcms.trace.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.huqiao.smallcms.sys.entity.User;
import me.huqiao.smallcms.util.Constants;
import me.huqiao.smallcms.util.web.LoginInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class FrontendContrller{

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
