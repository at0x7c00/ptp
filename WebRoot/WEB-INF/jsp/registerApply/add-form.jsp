<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPerson"/>:
										<form:input path="lawPerson"
											id="registerApply.lawPerson"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.address"/>:
										<form:input path="address"
											id="registerApply.address"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.contact"/>:
										<form:input path="contact"
											id="registerApply.contact"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.name"/>:
							<font style='color:red' class="required-mark">*</font>
										<form:input path="name"
											id="registerApply.name"
											cssClass="textInput required"
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.telq"/>:
										<form:input path="telq"
											id="registerApply.telq"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.email"/>:
										<form:input path="email"
											id="registerApply.email"
											cssClass="textInput "
											maxlength="255" />
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.license"/>:
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.lawPersonIDCard"/>:
				</label>
				</section>
				<section class="col col-3">
					<label class="input">
						<spring:message code="props.me.huqiao.smallcms.trace.entity.RegisterApply.status"/>:
								<label class="select">
								<form:select id="status" path="status" cssClass=" comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<form:options  items="${registerApplyStatusMap}"/>
								</form:select><i></i>
								</label>
				</label>
				</section>
				<section class="col col-3">
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