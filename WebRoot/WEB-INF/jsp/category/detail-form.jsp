<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['orderNum'].changed}">title= "${checkResult['orderNum'].info}";</c:if>
						   >
			<span class="${checkResult['orderNum'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.orderNum"/>:
									<c:out value="${tempBean.orderNum}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['status'].changed}">title= "${checkResult['status'].info}";</c:if>
						   >
			<span class="${checkResult['status'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.status"/>:
								${yesNoMap[tempBean.status]}
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['remark'].changed}">title= "${checkResult['remark'].info}";</c:if>
						   >
			<span class="${checkResult['remark'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.remark"/>:
									<c:out value="${tempBean.remark}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['parent'].changed}">title= "${checkResult['parent'].info}";</c:if>
						   >
			<span class="${checkResult['parent'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.parent"/>:
									${tempBean.parent.name}
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['name'].changed}">title= "${checkResult['name'].info}";</c:if>
						   >
			<span class="${checkResult['name'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.name"/>:
									<c:out value="${tempBean.name}"/>
			</span>
		</label>
	</section>