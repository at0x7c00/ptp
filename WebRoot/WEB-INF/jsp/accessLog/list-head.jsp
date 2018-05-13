<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<th  data-sortfield="id" class="${nfn:sortClass(pageBean,'id')}"><spring:message code="base.function.table.head.no"/></th>
			<th align="center" data-sortfield="ip" class="${nfn:sortClass(pageBean,'ip')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.ip"/>
		</th>
			<th align="center" data-sortfield="page" class="${nfn:sortClass(pageBean,'page')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.page"/>
		</th>
			<th align="center" data-sortfield="userID" class="${nfn:sortClass(pageBean,'userID')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.userID"/>
		</th>
			<th align="center" data-sortfield="accessTime" class="${nfn:sortClass(pageBean,'accessTime')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.accessTime"/>
		</th>
			<th align="center" data-sortfield="sessionID" class="${nfn:sortClass(pageBean,'sessionID')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.sessionID"/>
		</th>
			<th align="center" data-sortfield="sessionID" class="${nfn:sortClass(pageBean,'sessionID')}">
			产品ID
		</th>