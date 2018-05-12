<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/product/detail-form.jsp" %>

<section class="col col-12">
		<label class="input">
			审核:
			<font style='color:red' class="required-mark">*</font>
			<label class="select">
			<select id="status" name="status" class="required comboxed">
				<option value="">-请选择-</option>
				<option value="Failed">审核失败</option><option value="Succes">审核成功</option></select><i></i>
			</label>
	</label>
	</section>
	<section class="col col-12">
		<label class="input">
			审核备注:
			<label class="textarea">
			<textarea path="dealRemak"
				id="registerApply.dealRemak" cols="60"
				rows="5"
				class=""
				 placeholder="客户将能看到你的备注内容"></textarea>
			</label>
		</label>
	</section>