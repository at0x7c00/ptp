<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
			<div class="tab-pane fade" id="pictures">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="pictureSelectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-primary linkfile-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="pictureSelectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-link"></i> 添加链接文件
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="pictureSelectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="pictureSelectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="pictureKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.picture.manageKey }"
						 >
					</div>
					<p class="alert alert-info no-margin">
				<b>说明：</b>
				可上传一张图片，多余的会被忽略
				</p>
				</div>
			<!-- 检验报告 checkPictures:one to many prop tab start -->
				<div class="tab-pane fade" id="checkPictures">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="checkPictureselectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-primary link-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="checkPictureselectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-link"></i> 添加链接文件
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="checkPictureselectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="checkPictureselectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="checkPicturesKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.checkPicturesKeys}"
						 >
					</div>
					<p class="alert alert-info no-margin">
				<b>说明：</b>
				可上传多张图片。
				</p>
				</div>
			<!-- 检验报告 checkPictures:!-- one to many prop tab end -->
			<!-- 其他资质 otherQualifications:one to many prop tab start -->
			
				<div class="tab-pane fade" id="otherQualifications">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="otherQualificationsselectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-primary linkfile-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="otherQualificationsselectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-link"></i> 添加链接文件
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="otherQualificationsselectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="otherQualificationsselectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="otherQualificationsKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.otherQualificationsKeys}"
						 >
					</div>
					<p class="alert alert-info no-margin">
				<b>说明：</b>
				可上传多张图片。
				</p>
				</div>
				
			<!-- 其他资质 otherQualifications:!-- one to many prop tab end -->