package me.huqiao.smallcms.trace.entity.propertyeditor;
import java.beans.PropertyEditorSupport;

import me.huqiao.smallcms.trace.entity.RegisterApply;
import me.huqiao.smallcms.trace.service.IRegisterApplyService;
/**
 * 注册申请编辑器
 * @author NOVOTS
 * @version Version 1.0
 */
public class RegisterApplyEditor extends PropertyEditorSupport{
    public IRegisterApplyService registerApplyService;
    public RegisterApplyEditor(IRegisterApplyService registerApplyService){
        this.registerApplyService = registerApplyService;
    }
    public String getAsText(){
        RegisterApply registerApply = (RegisterApply)getValue();
        if(registerApply==null){
            return "";
        }
        return String.valueOf(registerApply.getId());
    }
    public void setAsText(String key)throws IllegalArgumentException {
        RegisterApply registerApply = null;
registerApply = registerApplyService.getEntityByProperty(RegisterApply.class,"manageKey",key);
if(registerApply==null){
            Integer integerId = null;
            try {integerId = Integer.parseInt(key);} catch (Exception e) {}
            registerApply = registerApplyService.getById(RegisterApply.class,integerId);
}
if(key!=null && !key.trim().equals("") && registerApply==null){
registerApply=new RegisterApply();
}
        setValue(registerApply);
    }
}