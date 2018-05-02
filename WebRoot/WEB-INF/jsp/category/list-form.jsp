<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
					<section class="col col-2">
						<label class="input"> 
								<form:input path="orderNum"
									id="category.orderNum" type="text"
									cssClass="textInputdigits" size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Category.orderNum')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
								<label class="select">
								<form:select id="status" path="status" cssClass="comboxed">
								<option value="">-${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Category.status')}-</option>
									<form:options  items="${yesNoMap}"/>
								</form:select>
								<i></i>
								</label>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="remark"
											id="category.remark" size="12"
											 placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Category.remark')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<label class="select">
										<form:select id="parent" path="parent" cssClass=" comboxed">
										<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.Category.parent"/>-</option>
											<form:options  items="${categoryList}" itemValue="manageKey" itemLabel="name"/>
										</form:select>
										<i></i>
										</label>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="name"
											id="category.name"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.Category.name')}"/>
				</label>
				</section>