<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<form:form method="post" action="registerApply/approve.do"
					   class="smart-form required-validate" commandName="registerApply"
				onsubmit="return validateCallback(this, ${targetPanel eq 'dialog' ? 'dialog' :'navTab' }AjaxDone);">
				<input type="hidden" name="targetPanel" value="${targetPanel}"/>
				<input type="hidden" name="manageKey" value="${registerApply.manageKey}"/>
				<ul id="myTab1" class="nav nav-tabs bordered">
					<li class="active"><a href="#baseProperties" data-toggle="tab"><spring:message code="base.common.form.props"/></a></li>
					<%@include file="/WEB-INF/jsp/registerApply/form-tab-title.jsp" %>
				</ul>
				<div id="myTabContent1" class="tab-content">
					<div class="tab-pane fade in active" id="baseProperties">	
						<fieldset>
							<div class="row">
								<%@include file="/WEB-INF/jsp/registerApply/approve-form.jsp" %>
							</div>
						</fieldset>
					</div>
					<%@include file="/WEB-INF/jsp/registerApply/detail-x2many-form.jsp" %>
				</div>
				
				<p class="alert alert-info no-margin">
				<b>说明：</b>
				审核成功之后，系统将自动为该条申请创建用户，并分配“客户”角色（ID=2）。保存到“客户”部门(ID=3)
				</p>
				
				<footer>
					<button type="submit" class="btn btn-primary smart-form-submit-btn">
						<spring:message code="base.common.ok"></spring:message>
					</button>
					<button type="button" class="btn btn-default btn-cancel" data-targetpanel = "${targetPanel}">
						<spring:message code="base.common.cancel"></spring:message>
					</button>
				</footer>
			</form:form>
		</article>
	</div>
</section>
<%@include  file="/WEB-INF/jsp/common/pageSetJS.jsp"%>