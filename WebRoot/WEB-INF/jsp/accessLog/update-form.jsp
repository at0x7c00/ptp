<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.ip"/>:
										<form:input path="ip"
											id="accessLog.ip"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.page"/>:
										<form:input path="page"
											id="accessLog.page"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.userID"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="userID"
											id="accessLog.userID"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.accessTime"/>:
								<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input name="accessTime" id="accessLog.accessTime" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}' value='${tempBean.accessTime}'/>" class="date_not_required textInput valid"/>
								</label>
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.AccessLog.sessionID"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="sessionID"
											id="accessLog.sessionID"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>