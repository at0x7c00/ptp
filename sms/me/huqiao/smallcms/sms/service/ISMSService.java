package me.huqiao.smallcms.sms.service;

import me.huqiao.smallcms.util.web.JsonResult;

public interface ISMSService {

	public JsonResult sendRegisterCheckCode(String phonenumber)throws Exception;
	public JsonResult sendLoginCheckCode(String phonenumber)throws Exception;
	public JsonResult sendForgetCheckCode(String phonenumber)throws Exception;
	
}
