<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
					<section class="col col-12">
		<label class="input"
						   <c:if test="${checkResult['name'].changed}">title= "${checkResult['name'].info}";</c:if>
						   >
			<span class="${checkResult['name'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.name"/>:
									<c:out value="${tempBean.name}"/>
			</span>
		</label>
	</section>
		<section class="col col-12">
		<label class="input"
						   <c:if test="${checkResult['address'].changed}">title= "${checkResult['address'].info}";</c:if>
						   >
			<span class="${checkResult['address'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.address"/>:
									<c:out value="${tempBean.address}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['lawPerson'].changed}">title= "${checkResult['lawPerson'].info}";</c:if>
						   >
			<span class="${checkResult['lawPerson'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPerson"/>:
									<c:out value="${tempBean.lawPerson}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['contact'].changed}">title= "${checkResult['contact'].info}";</c:if>
						   >
			<span class="${checkResult['contact'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.contact"/>:
									<c:out value="${tempBean.contact}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['telq'].changed}">title= "${checkResult['telq'].info}";</c:if>
						   >
			<span class="${checkResult['telq'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.telq"/>:
									<c:out value="${tempBean.telq}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input"
						   <c:if test="${checkResult['email'].changed}">title= "${checkResult['email'].info}";</c:if>
						   >
			<span class="${checkResult['email'].changed ? 'change-markup':''}">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.email"/>:
									<c:out value="${tempBean.email}"/>
			</span>
		</label>
	</section>
	<section class="col col-3">
		<label class="input">
			<span class="">
						用户名:<c:out value="${tempBean.username}"/>
			</span>
						<c:choose>
							<c:when test="${usernameOK}">
								<span class="badge bg-color-green" style="padding:3px 7px">可用</span>
							</c:when>
							<c:otherwise>
								<span class="badge bg-color-red" style="padding:3px 7px">重复</span>
							</c:otherwise>
						</c:choose>
		</label>
	</section>
	<section class="col col-3">
		<label class="input">
			<span class="${checkResult['email'].changed ? 'change-markup':''}">
						手机号:<c:out value="${tempBean.mobileNumber}"/>
						
			</span>
			<c:choose>
				<c:when test="${phoneOK}">
					<span class="badge bg-color-green" style="padding:3px 7px">可用</span>
				</c:when>
				<c:otherwise>
					<span class="badge bg-color-red" style="padding:3px 7px">重复</span>
				</c:otherwise>
			</c:choose>
		</label>
	</section>
	<section class="col col-3">
		<label class="input">
			<span>
			申请时间:<fmt:formatDate value="${tempBean.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</span>
		</label>
	</section>
	<section class="col col-12">
		<label class="input">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.status"/>:
			<font style='color:red' class="required-mark">*</font>
					<label class="select">
					<select id="status" name="status" class="required comboxed"><option value="">-请选择-</option>
						<option value="UnDeal" selected="selected">未处理</option><option value="Failed">审核失败</option><option value="Succes">审核成功</option></select><i></i>
					</label>
	</label>
	</section>
	<section class="col col-12">
		<label class="input">
			<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.dealRemak"/>:
							<label class="textarea">
							<form:textarea path="dealRemak"
								id="registerApply.dealRemak" cols="60"
								rows="5"
								cssClass=""
								 />
							</label>
		</label>
	</section>