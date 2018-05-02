<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['ip'].changed}">title= "${checkResult['ip'].info}";</c:if>
						   >
			<span class="${checkResult['ip'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.ip"/>:
									<c:out value="${tempBean.ip}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['page'].changed}">title= "${checkResult['page'].info}";</c:if>
						   >
			<span class="${checkResult['page'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.page"/>:
									<c:out value="${tempBean.page}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['userID'].changed}">title= "${checkResult['userID'].info}";</c:if>
						   >
			<span class="${checkResult['userID'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.userID"/>:
									<c:out value="${tempBean.userID}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['accessTime'].changed}">title= "${checkResult['accessTime'].info}";</c:if>
						   >
			<span class="${checkResult['accessTime'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.accessTime"/>:
									<fmt:formatDate value="${tempBean.accessTime}" pattern="${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['sessionID'].changed}">title= "${checkResult['sessionID'].info}";</c:if>
						   >
			<span class="${checkResult['sessionID'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.sessionID"/>:
									<c:out value="${tempBean.sessionID}"/>
			</span>
		</label>
	</section>