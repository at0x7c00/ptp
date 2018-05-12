<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<th  data-sortfield="id" class="${nfn:sortClass(pageBean,'id')}"><spring:message code="base.function.table.head.no"/></th>
			<th align="center" data-sortfield="name" class="${nfn:sortClass(pageBean,'name')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.name"/>
		</th>
			<th align="center" data-sortfield="category" class="${nfn:sortClass(pageBean,'category')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.category"/>
		</th>
			<th align="center" data-sortfield="brand" class="${nfn:sortClass(pageBean,'brand')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.brand"/>
		</th>
		<%-- <th align="center" data-sortfield="spec" class="${nfn:sortClass(pageBean,'spec')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.spec"/>
		</th> --%>
		<%-- <th align="center" data-sortfield="productAddr" class="${nfn:sortClass(pageBean,'productAddr')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.productAddr"/>
		</th> --%>
			<th align="center" data-sortfield="trace" class="${nfn:sortClass(pageBean,'trace')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.trace"/>
		</th>
			<th align="center" data-sortfield="deadline" class="${nfn:sortClass(pageBean,'deadline')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.deadline"/>
		</th>
			<th align="center" data-sortfield="batchNum" class="${nfn:sortClass(pageBean,'batchNum')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.batchNum"/>
		</th>
		<%-- <th align="center" data-sortfield="standard" class="${nfn:sortClass(pageBean,'standard')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.standard"/>
		</th>
			<th align="center" data-sortfield="tel" class="${nfn:sortClass(pageBean,'tel')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.tel"/>
		</th>
		 --%>
			<th align="center" data-sortfield="status" class="${nfn:sortClass(pageBean,'status')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.status"/>
		</th>
		<c:if test="${not my }">
		<th align="center" data-sortfield="creator" class="${nfn:sortClass(pageBean,'creator')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.creator"/>
		</th>
		</c:if>
		<th align="center" data-sortfield="qrCode" class="${nfn:sortClass(pageBean,'qrCode')}">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.qrCode"/>
		</th>
		<th>操作</th>