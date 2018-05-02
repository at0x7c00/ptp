<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
			<div class="tab-pane fade" id="licenses">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="licenseSelectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="licenseSelectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="licenseSelectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="licenseKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.license.manageKey }"
						 >
					</div>
				</div>
			<div class="tab-pane fade" id="lawPersonIDCards">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="lawPersonIDCardSelectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="lawPersonIDCardSelectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="lawPersonIDCardSelectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="lawPersonIDCardKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.lawPersonIDCard.manageKey }"
						 >
					</div>
				</div>
			<!-- 其他资质 otherQualifications:one to many prop tab start -->
				<div class="tab-pane fade tab-form" id="otherQualifications" 
				data-formurl="${basePath}commonFile/tabAddForm.do"
				data-initdata="${nfn:serialKyes(tempBean.otherQualifications,'manageKey')}"
				data-trtarget="otherQualifications"
				>
					<div class="tab-form-menu">
						<a href="javascript:void(0);" class="btn btn-primary add-btn"><i class="fa fa-plus"></i> <spring:message code="base.function.add"></spring:message></a>
			    	<a href="javascript:void(0);"  class="btn btn-danger delete-btn"><i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"></spring:message></a>
					</div>
					<input type="hidden" name="otherQualificationsTrCount" value="0"/>
					<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
						<table id="dt_basic" class="table table-striped table-bordered table-hover tab-form-table"
							   data-trindex="${fn:length(tempBean.otherQualifications) - 1}"
							   >
							<thead>
								<tr>
									<th align="center" width="16px">
											<label class="checkbox">
												<input type="checkbox" name="checkbox" class="smart-form-checkall" data-groupname="otherQualificationsChk">
											<i></i></label>
									</th>
									<%@include file="/WEB-INF/jsp/filee/tab-add-list-head.jsp" %>
								</tr>
							</thead>
							<tbody>
								<%--
								<c:forEach items="${tempBean.otherQualifications}" var="tmpTmpBean" varStatus="s">
										<c:set var="propName" value="otherQualificationsList"/>
										<c:set var="trIndex" value="${s.index}"/>
									<tr>
										<%@include file="/WEB-INF/jsp/filee/tab-update-form.jsp" %>
									</tr>
								</c:forEach>
								--%>
							</tbody>
						</table>
					</div>
				</div>
			<!-- 其他资质 otherQualifications:!-- one to many prop tab end -->