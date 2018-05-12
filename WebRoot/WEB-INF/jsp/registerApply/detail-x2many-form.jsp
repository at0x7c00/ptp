<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
			<div class="tab-pane fade" id="licenses">
				<a href="filee/viewPic.do?manageKey=${tempBean.license.manageKey }" target="_blank">
					<img src="filee/viewPic.do?manageKey=${tempBean.license.manageKey }" class="table-pic-lg hover-able"/>
				</a>
			</div> 	
			<div class="tab-pane fade" id="lawPersonIDCards">
				<a href="filee/viewPic.do?manageKey=${tempBean.lawPersonIDCard.manageKey }" target="_blank">
					<img src="filee/viewPic.do?manageKey=${tempBean.lawPersonIDCard.manageKey }" class="table-pic-lg hover-able"/>
				</a>
			</div> 	
				<!-- 其他资质 otherQualifications:one to many prop tab start -->
				<div class="tab-pane fade tab-form" id="otherQualifications" 
				data-formurl="${basePath}filee/tabDetailForm.do"
				data-initdata="${nfn:serialKyes(tempBean.otherQualifications,'manageKey')}"
				data-trtarget="otherQualifications"
				>
					<input type="hidden" name="otherQualificationsTrCount" value="0"/>
					<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
						<table id="dt_basic" class="table table-striped table-bordered table-hover tab-form-table"
							   data-trindex="${fn:length(tempBean.otherQualifications) - 1}">
							<thead>
								<tr>
									<%@include file="/WEB-INF/jsp/filee/tab-add-list-head.jsp" %>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 其他资质 otherQualifications:!-- one to many prop tab end -->
