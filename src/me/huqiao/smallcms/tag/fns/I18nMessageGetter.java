package me.huqiao.smallcms.tag.fns;

import javax.servlet.http.HttpServletRequest;

import me.huqiao.smallcms.i18n.MySessionLocaleRsolver;
import me.huqiao.smallcms.listener.InitApplicationAttributeListener;

import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;

/**
 * 国际化
 * @author NOVOTS
 * @version Version 1.0
 */
public class I18nMessageGetter {

	public static String i18nMessage(HttpServletRequest request,String code){
		WebApplicationContext wac = InitApplicationAttributeListener.wac;
		ResourceBundleMessageSource messageSource  = (ResourceBundleMessageSource)wac.getBean("messageSource");
		MySessionLocaleRsolver localeResolver =(MySessionLocaleRsolver) wac.getBean("localeResolver");
		return messageSource.getMessage(code,null,localeResolver.resolveLocale(request));
	}
}
