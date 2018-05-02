<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
				<c:if test="${not historyView}">
				<!-- 子级类目 children:one to many prop tab start -->
				<div class="tab-pane fade tab-form" id="children" 
				data-formurl="${basePath}category/tabDetailForm.do"
				data-initdata="${nfn:serialKyes(tempBean.children,'manageKey')}"
				data-trtarget="children"
				>
					<input type="hidden" name="childrenTrCount" value="0"/>
					<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
						<table id="dt_basic" class="table table-striped table-bordered table-hover tab-form-table"
							   data-trindex="${fn:length(tempBean.children) - 1}"
							   >
							<thead>
								<tr>
									<%@include file="/WEB-INF/jsp/category/tab-add-list-head.jsp" %>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 子级类目 children:!-- one to many prop tab end -->
				</c:if>