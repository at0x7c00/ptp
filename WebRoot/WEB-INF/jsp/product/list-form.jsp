<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="name"
											id="product.name"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.name')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="brand"
											id="product.brand"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.brand')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<label class="select">
										<form:select id="category" path="category" cssClass=" comboxed">
										<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.category"/>-</option>
											<c:forEach items="${categoryList }" var="cate">
												<option value="${cate.manageKey}" ${tempBean.parent.manageKey eq cate.manageKey ? 'selected':'' }><n:html value="${cate.name}"/></option>
											</c:forEach>
										</form:select>
										<i></i>
										</label>
				</label>
				</section>
					
					<section class="col col-2">
						<label class="input"> 
										<form:input path="description"
											id="product.description" size="12"
											 placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.description')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="spec"
											id="product.spec"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.spec')}"/>
				</label>
				</section>
					
					<section class="col col-2">
						<label class="input"> 
										<form:input path="productAddr"
											id="product.productAddr"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.productAddr')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="trace"
											id="product.trace"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.trace')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
								<i class="icon-append fa fa-calendar"></i>
								<input name="deadlineStart" id="product.deadline" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY}' value='${product.deadlineStart}'/>" class="date_not_required textInput valid"  size="12"
									   placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.deadline')}(${nfn:i18nMessage(reqCtx,'base.common.form.start')})"
									   />
			</label>
				</section>
					<section class="col col-2">
					<label class="input"> 
								<i class="icon-append fa fa-calendar"></i>
								<input name="deadlineEnd" id="product.deadline" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY}' value='${product.deadlineEnd}'/>" class="date_not_required textInput valid"  size="12"
									   placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.deadline')}(${nfn:i18nMessage(reqCtx,'base.common.form.end')})"
									   />
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="batchNum"
											id="product.batchNum"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.batchNum')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="standard"
											id="product.standard"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.standard')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="tel"
											id="product.tel"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.tel')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
								<label class="select">
								<form:select id="status" path="status" cssClass="comboxed">
								<option value="">-${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Product.status')}-</option>
									<form:options  items="${productStatusMap}"/>
								</form:select>
								<i></i>
								</label>
				</label>
				</section>
				<c:if test="${not my }">
					<section class="col col-2">
						<label class="input"> 
										<label class="select">
										<form:select id="creator" path="creator" cssClass=" comboxed">
										<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.Product.creator"/>-</option>
											<form:options  items="${userList}" itemValue="username" itemLabel="username"/>
										</form:select>
										<i></i>
										</label>
				</label>
				</section>
				</c:if>