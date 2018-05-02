<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<section class="col col-12">
		<label class="input"
						   <c:if test="${checkResult['name'].changed}">title= "${checkResult['name'].info}";</c:if>
						   >
			<span class="${checkResult['name'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.name"/>:
									<c:out value="${tempBean.name}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['brand'].changed}">title= "${checkResult['brand'].info}";</c:if>
						   >
			<span class="${checkResult['brand'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.brand"/>:
									<c:out value="${tempBean.brand}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['category'].changed}">title= "${checkResult['category'].info}";</c:if>
						   >
			<span class="${checkResult['category'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.category"/>:
									${tempBean.category.fullName}
			</span>
		</label>
	</section>
	<section class="col col-12">
		<label class="input"
						   <c:if test="${checkResult['description'].changed}">title= "${checkResult['description'].info}";</c:if>
						   >
			<span class="${checkResult['description'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.description"/>:
									<c:out value="${tempBean.description}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['spec'].changed}">title= "${checkResult['spec'].info}";</c:if>
						   >
			<span class="${checkResult['spec'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.spec"/>:
									<c:out value="${tempBean.spec}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['productAddr'].changed}">title= "${checkResult['productAddr'].info}";</c:if>
						   >
			<span class="${checkResult['productAddr'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.productAddr"/>:
									<c:out value="${tempBean.productAddr}"/>
			</span>
		</label>
	</section>
	<section class="col col-12">
		<label class="input"
						   <c:if test="${checkResult['trace'].changed}">title= "${checkResult['trace'].info}";</c:if>
						   >
			<span class="${checkResult['trace'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.trace"/>:
									<c:out value="${tempBean.trace}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['deadline'].changed}">title= "${checkResult['deadline'].info}";</c:if>
						   >
			<span class="${checkResult['deadline'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.deadline"/>:
									<fmt:formatDate value="${tempBean.deadline}" pattern="${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['batchNum'].changed}">title= "${checkResult['batchNum'].info}";</c:if>
						   >
			<span class="${checkResult['batchNum'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.batchNum"/>:
									<c:out value="${tempBean.batchNum}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['standard'].changed}">title= "${checkResult['standard'].info}";</c:if>
						   >
			<span class="${checkResult['standard'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.standard"/>:
									<c:out value="${tempBean.standard}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['tel'].changed}">title= "${checkResult['tel'].info}";</c:if>
						   >
			<span class="${checkResult['tel'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.tel"/>:
									<c:out value="${tempBean.tel}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['status'].changed}">title= "${checkResult['status'].info}";</c:if>
						   >
			<span class="${checkResult['status'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.status"/>:
								${productStatusMap[tempBean.status]}
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['creator'].changed}">title= "${checkResult['creator'].info}";</c:if>
						   >
			<span class="${checkResult['creator'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.creator"/>:
									${tempBean.creator.chineseName}
			</span>
		</label>
	</section>