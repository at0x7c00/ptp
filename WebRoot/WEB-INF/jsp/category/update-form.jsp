<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.name"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="name"
											id="category.name"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.parent"/>:
										<label class="select">
										<form:select id="parent" path="parent" cssClass=" comboxed">
										<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${categoryList }" var="cate">
												<option value="${cate.manageKey}" ${tempBean.parent.manageKey eq cate.manageKey ? 'selected':'' }><n:html value="${cate.name}"/></option>
											</c:forEach>
										</form:select><i></i>
										</label>
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.status"/>:
						<font style='color:red' class="required-mark">*</font>
								<label class="select">
								<form:select id="status" path="status" cssClass="required comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<form:options  items="${yesNoMap}"/>
								</form:select><i></i>
								</label>
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.orderNum"/>:
								<form:input path="orderNum"
									id="category.orderNum" type="text"
									cssClass="textInput  digits" />
				</label>
				</section>
				<section class="col col-12">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.remark"/>:
										<label class="textarea">
										<form:textarea path="remark"
											id="category.remark" cols="60"
											rows="5"
											cssClass=""
											 />
										</label>
					</label>
				</section>

