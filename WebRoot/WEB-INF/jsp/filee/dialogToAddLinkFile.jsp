<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-blueLight" id="wid-id-0" data-widget-editbutton="false">
				<div style="border-top:1px solid #ccc;">
					<div class="widget-body">
						<form action="${basePath}filee/add.do?linkFile=yes" class="smart-form linkfile-add-form" 
						data-selectlist="${selectlist}" 
						data-formtargetpanel = "${formTargetPanel }"
						data-maxfilesize = "${maxFilesize }"
						data-acceptedfiles = "${acceptedFiles }"
						method="POST"
						>
							<input type="hidden" name="folderId" value="1" />
							<fieldset>
							<div class="row">
							<section class="col col-12">
								<label class="input">
									文件地址:
									<input name="linkFileUrl"
										id="linkFileUrl"
										class="textInput required"
										maxlength="255" placeholder="输入以http://开头的有效链接地址，以回车确认"/>
							</label>
							</section>
							</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<%@include file="/WEB-INF/jsp/common/pageSetJS.jsp"%>