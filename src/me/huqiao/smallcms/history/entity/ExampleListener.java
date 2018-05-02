package me.huqiao.smallcms.history.entity;

import me.huqiao.smallcms.util.threadlocal.ThreadLocalUtil;
import me.huqiao.smallcms.util.web.LoginInfo;

import org.hibernate.envers.RevisionListener;

public class ExampleListener implements RevisionListener {
	
    public void newRevision(Object revisionEntity) {
        TestRevisionEntity exampleRevEntity = (TestRevisionEntity) revisionEntity;
        LoginInfo loginInfo = (LoginInfo)ThreadLocalUtil.loginInfoThreadLocal.get();
        if(loginInfo==null){
        	return;
        }
        exampleRevEntity.setUsername(loginInfo.getUser().getUsername());
    }
}