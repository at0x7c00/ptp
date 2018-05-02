<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
			<!-- 子级类目 children:one to many prop tab start -->
				<div class="tab-pane fade tab-form" id="children" 
				data-formurl="${basePath}category/tabAddForm.do"
				data-initdata="${nfn:serialKyes(tempBean.children,'manageKey')}"
				data-trtarget="children"
				>
					<div class="tab-form-menu">
						<a href="javascript:void(0);" class="btn btn-primary add-btn"><i class="fa fa-plus"></i> <spring:message code="base.function.add"></spring:message></a>
			    	<a href="javascript:void(0);"  class="btn btn-danger delete-btn"><i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"></spring:message></a>
					</div>
					<input type="hidden" name="childrenTrCount" value="0"/>
					<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
						<table id="dt_basic" class="table table-striped table-bordered table-hover tab-form-table"
							   data-trindex="${fn:length(tempBean.children) - 1}"
							   >
							<thead>
								<tr>
									<th align="center" width="16px">
											<label class="checkbox">
												<input type="checkbox" name="checkbox" class="smart-form-checkall" data-groupname="childrenChk">
											<i></i></label>
									</th>
									<%@include file="/WEB-INF/jsp/category/tab-add-list-head.jsp" %>
								</tr>
							</thead>
							<tbody>
								<%--
								<c:forEach items="${tempBean.children}" var="tmpTmpBean" varStatus="s">
										<c:set var="propName" value="childrenList"/>
										<c:set var="trIndex" value="${s.index}"/>
									<tr>
										<%@include file="/WEB-INF/jsp/category/tab-update-form.jsp" %>
									</tr>
								</c:forEach>
								--%>
							</tbody>
						</table>
					</div>
				</div>
			<!-- 子级类目 children:!-- one to many prop tab end -->