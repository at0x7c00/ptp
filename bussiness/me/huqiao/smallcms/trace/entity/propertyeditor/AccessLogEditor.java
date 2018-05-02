package me.huqiao.smallcms.trace.entity.propertyeditor;
import java.beans.PropertyEditorSupport;

import me.huqiao.smallcms.trace.entity.AccessLog;
import me.huqiao.smallcms.trace.service.IAccessLogService;
/**
 * 访问日志编辑器
 * @author NOVOTS
 * @version Version 1.0
 */
public class AccessLogEditor extends PropertyEditorSupport{
    public IAccessLogService accessLogService;
    public AccessLogEditor(IAccessLogService accessLogService){
        this.accessLogService = accessLogService;
    }
    public String getAsText(){
        AccessLog accessLog = (AccessLog)getValue();
        if(accessLog==null){
            return "";
        }
        return String.valueOf(accessLog.getId());
    }
    public void setAsText(String key)throws IllegalArgumentException {
        AccessLog accessLog = null;
accessLog = accessLogService.getEntityByProperty(AccessLog.class,"manageKey",key);
if(accessLog==null){
            Integer integerId = null;
            try {integerId = Integer.parseInt(key);} catch (Exception e) {}
            accessLog = accessLogService.getById(AccessLog.class,integerId);
}
if(key!=null && !key.trim().equals("") && accessLog==null){
accessLog=new AccessLog();
}
        setValue(accessLog);
    }
}