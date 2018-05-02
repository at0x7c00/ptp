<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="lawPerson"
											id="registerApply.lawPerson"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPerson')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="address"
											id="registerApply.address"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.address')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="contact"
											id="registerApply.contact"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.contact')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="name"
											id="registerApply.name"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.name')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="telq"
											id="registerApply.telq"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.telq')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="email"
											id="registerApply.email"
											cssClass="textInput"
											maxlength="255"  size="12" placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.email')}"/>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<label class="select">
										<form:select id="license" path="license" cssClass=" comboxed">
										<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.license"/>-</option>
											<form:options  items="${commonFileList}" itemValue="manageKey" itemLabel="manageKey"/>
										</form:select>
										<i></i>
										</label>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<label class="select">
										<form:select id="lawPersonIDCard" path="lawPersonIDCard" cssClass=" comboxed">
										<option value="">-<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPersonIDCard"/>-</option>
											<form:options  items="${commonFileList}" itemValue="manageKey" itemLabel="manageKey"/>
										</form:select>
										<i></i>
										</label>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
								<label class="select">
								<form:select id="status" path="status" cssClass="comboxed">
								<option value="">-${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.status')}-</option>
									<form:options  items="${registerApplyStatusMap}"/>
								</form:select>
								<i></i>
								</label>
				</label>
				</section>
					<section class="col col-2">
						<label class="input"> 
										<form:input path="dealRemak"
											id="registerApply.dealRemak" size="12"
											 placeholder="${nfn:i18nMessage(reqCtx,'props.me.huqiao.smallcms.trace.entity.RegisterApply.dealRemak')}"/>
				</label>
				</section>