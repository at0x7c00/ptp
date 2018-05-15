package me.huqiao.smallcms.sms.service.impl;

import java.util.HashMap;
import java.util.Map;

import me.huqiao.smallcms.sms.service.ISMSService;
import me.huqiao.smallcms.util.CommonUtil;
import me.huqiao.smallcms.util.web.JsonResult;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

@Service
public class SMSServiceImpl implements ISMSService {
	
	static Logger log = Logger.getLogger(SMSServiceImpl.class);
	static boolean test = false;
	
	@Value("${sms.accessKey}")
	private String accessKeyId;//你的accessKeyId,参考本文档步骤2
	@Value("${sms.accessKeySecret}")
	private String accessKeySecret;//你的accessKeySecret，参考本文档步骤2
	
	@Value("${sms.signature}")
	private String signature;
	@Value("${sm.template.register}")
	private String registerTemplate;
	@Value("${sm.template.login}")
	private String loginTemplate;
	@Value("${sm.template.forget}")
	private String forgetTemplate;
	
	public JsonResult sendCheckCode(String phonenum,String template)throws Exception{
		String code = CommonUtil.createCheckCode();
		log.info("create  checkcode :" + code);
		if(test){
			return JsonResult.success(code);
		}
		
		//设置超时时间-可自行调整
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");
		//初始化ascClient需要的几个参数
		final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
		final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
		//替换成你的AK
		
		//初始化ascClient,暂时不支持多region（请勿修改）
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,accessKeySecret);
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		IAcsClient acsClient = new DefaultAcsClient(profile);
		 //组装请求对象
		 SendSmsRequest request = new SendSmsRequest();
		 //使用post提交
		 request.setMethod(MethodType.POST);
		 //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式；发送国际/港澳台消息时，接收号码格式为00+国际区号+号码，如“0085200000000”
		 request.setPhoneNumbers(phonenum);
		 //必填:短信签名-可在短信控制台中找到
		 request.setSignName(signature);
		 //必填:短信模板-可在短信控制台中找到
		 request.setTemplateCode(template);
		 //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
		 //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
		 request.setTemplateParam("{\"code\":\""+code+"\"}");
		 //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
		 //request.setSmsUpExtendCode("90997");
		 //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
		 //request.setOutId("yourOutId");
		//请求失败这里会抛ClientException异常
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
			return JsonResult.success(code);
		}
		return JsonResult.error(sendSmsResponse.getCode());
	}
	
	public static Map<String,String> Errors = new HashMap<String,String>();
	static{
		Errors.put("isp.RAM_PERMISSION_DENY","RAM权限DENY");
		Errors.put("isv.OUT_OF_SERVICE","业务停机");
		Errors.put("isv.PRODUCT_UN_SUBSCRIPT","未开通云通信产品的阿里云客户");
		Errors.put("isv.PRODUCT_UNSUBSCRIBE","产品未开通");
		Errors.put("isv.ACCOUNT_NOT_EXISTS","账户不存在");
		Errors.put("isv.ACCOUNT_ABNORMAL","账户异常");
		Errors.put("isv.SMS_TEMPLATE_ILLEGAL","短信模板不合法");
		Errors.put("isv.SMS_SIGNATURE_ILLEGAL","短信签名不合法");
		Errors.put("isv.INVALID_PARAMETERS","参数异常");
		Errors.put("isp.SYSTEM_ERROR","系统错误");
		Errors.put("isv.MOBILE_NUMBER_ILLEGAL","非法手机号");
		Errors.put("isv.MOBILE_COUNT_OVER_LIMIT","手机号码数量超过限制");
		Errors.put("isv.TEMPLATE_MISSING_PARAMETERS","模板缺少变量");
		Errors.put("isv.BUSINESS_LIMIT_CONTROL","业务限流");
		Errors.put("isv.INVALID_JSON_PARAM","JSON参数不合法，只接受字符串值");
		Errors.put("isv.BLACK_KEY_CONTROL_LIMIT","黑名单管控");
		Errors.put("isv.PARAM_LENGTH_LIMIT","参数超出长度限制");
		Errors.put("isv.PARAM_NOT_SUPPORT_URL","不支持URL");
		Errors.put("isv.AMOUNT_NOT_ENOUGH","账户余额不足");
	}
	@Override
	public JsonResult sendRegisterCheckCode(String phonenumber)throws Exception {
		return sendCheckCode(phonenumber,registerTemplate);
	}
	@Override
	public JsonResult sendLoginCheckCode(String phonenumber) throws Exception {
		return sendCheckCode(phonenumber,loginTemplate);
	}
	@Override
	public JsonResult sendForgetCheckCode(String phonenumber) throws Exception {
		return sendCheckCode(phonenumber,forgetTemplate);
	}
	
	
}
