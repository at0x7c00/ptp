<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<c:if test="${not historyView}">
	<li>
		<a href="#licenses" data-toggle="tab" <c:if test="${checkResult['license'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.license"/></a>
	</li>
		</c:if>
		<c:if test="${not historyView}">
	<li>
		<a href="#lawPersonIDCards" data-toggle="tab" <c:if test="${checkResult['lawPersonIDCard'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPersonIDCard"/></a>
	</li>
		</c:if>
		<c:if test="${not historyView}">
	<li>
		<a href="#otherQualifications" data-toggle="tab" <c:if test="${checkResult['otherQualifications'].changed}">style="color:red;" </c:if>><spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.otherQualifications"/></a>
	</li>
		</c:if>