<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<c:if test="${not historyView}">
	<li>
		<a href="#pictures" data-toggle="tab" <c:if test="${checkResult['picture'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.Product.picture"/></a>
	</li>
		</c:if>
		<c:if test="${not historyView}">
	<li>
		<a href="#checkPictures" data-toggle="tab" <c:if test="${checkResult['checkPictures'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.Product.checkPictures"/></a>
	</li>
		</c:if>
		<c:if test="${not historyView}">
	<li>
		<a href="#otherQualifications" data-toggle="tab" <c:if test="${checkResult['otherQualifications'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.Product.otherQualifications"/></a>
	</li>
		</c:if>