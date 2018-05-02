<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		<th align="center" data-sortfield="orderNum" class="${nfn:sortClass(pageBean,'orderNum')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.orderNum"/>
		</th>
		<th align="center" data-sortfield="status" class="${nfn:sortClass(pageBean,'status')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.status"/>
		</th>
		<th align="center" data-sortfield="remark" class="${nfn:sortClass(pageBean,'remark')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.remark"/>
		</th>
		<th align="center" data-sortfield="parent" class="${nfn:sortClass(pageBean,'parent')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.parent"/>
		</th>
		<th align="center" data-sortfield="name" class="${nfn:sortClass(pageBean,'name')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.name"/>
		</th>