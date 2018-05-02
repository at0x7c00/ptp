<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
				<section class="col col-12">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.name"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="name"
											id="product.name"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.brand"/>:
										<form:input path="brand"
											id="product.brand"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-9">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.category"/>:
										<label class="select">
										<form:select id="category" path="category" cssClass=" comboxed">
										<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${categoryList }" var="cate">
												<option value="${cate.manageKey}" ${tempBean.category.manageKey eq cate.manageKey ? 'selected':'' }><n:html value="${cate.name}"/></option>
											</c:forEach>
										</form:select><i></i>
										</label>
				</label>
				</section>
				
				<section class="col col-12">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.description"/>:
							<font style='color:red' class="required-mark">*</font>
										<label class="textarea">
										<form:textarea path="description"
											id="product.description" cols="60"
											rows="5"
											cssClass="required"
											 />
										</label>
					</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.spec"/>:
										<form:input path="spec"
											id="product.spec"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.productAddr"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="productAddr"
											id="product.productAddr"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.trace"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="trace"
											id="product.trace"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.deadline"/>:
							<font style='color:red' class="required-mark">*</font>
								<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input name="deadline" id="product.deadline" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}' value='${tempBean.deadline}'/>" class="date_required required textInput valid"/>
								</label>
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.batchNum"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="batchNum"
											id="product.batchNum"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.standard"/>:
										<form:input path="standard"
											id="product.standard"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.tel"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="tel"
											id="product.tel"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.status"/>:
							<font style='color:red' class="required-mark">*</font>
								<label class="select">
								<form:select id="status" path="status" cssClass="required comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<form:options  items="${productStatusMap}"/>
								</form:select><i></i>
								</label>
				</label>
				</section>
				<c:if test="${not my }">
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.creator"/>:
										<label class="select">
										<form:select id="creator" path="creator" cssClass=" comboxed">
										<option value=""><spring:message code="base.common.selectone"/></option>
											<form:options  items="${userList}" itemValue="username" itemLabel="username"/>
										</form:select><i></i>
										</label>
				</label>
				</section>
				</c:if>