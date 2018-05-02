<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<th  data-sortfield="id" width="50px" class="${nfn:sortClass(pageBean,'id')}"><spring:message code="base.function.table.head.no"/></th>
		<th align="center" width="400px" data-sortfield="name" class="${nfn:sortClass(pageBean,'name')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.name"/>
		</th>
		<th align="center" width="50px" data-sortfield="status" class="${nfn:sortClass(pageBean,'status')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.status"/>
		</th>
		<th align="center" width="50px" data-sortfield="orderNum" class="${nfn:sortClass(pageBean,'orderNum')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.orderNum"/>
		</th>
		<th align="center" data-sortfield="remark" class="${nfn:sortClass(pageBean,'remark')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.remark"/>
		</th>