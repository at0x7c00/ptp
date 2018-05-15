<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td>${tempBean.id}</td>
		<td>
		<a href="${basePath}product/${my ? 'myDetail':'detail' }.do?manageKey=${tempBean.manageKey}" target="dialogTodo" title="查看商品">
			${tempBean.name}
		</a>
		</td>
		<td>${tempBean.category.fullName}</td>
		<td>
		${tempBean.brand}
		</td>
		<td>
		${tempBean.trace}
		</td>
			<td><fmt:formatDate value="${tempBean.deadline}" pattern="${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}"/></td>
		<td>
		${tempBean.batchNum}
		</td>
		<%-- <td>
		${tempBean.standard}
		</td> --%>
		<%-- <td>
		${tempBean.tel}
		</td> --%>
		<td>
		<span class="badge ${tempBean.statusStyle }" style="padding:3px 7px;">
			${tempBean.status.description}
		</span>
		</td>
		<c:if test="${not my }">
			<td>${tempBean.creator.chineseName}</td>
		</c:if>
			
			<td>
			<c:choose>
				<c:when test="${not empty tempBean.qrCode and (tempBean.canDown or tempBean.canUp)}">
					<a href="${basePath}filee/downloadFile.do?key=${tempBean.qrCode.manageKey}" target="_blank">
					下载
					</a>
				</c:when>
				<c:otherwise>
				无
				</c:otherwise>
			</c:choose>
			</td>
			
			<td>
			<c:if test="${my }">
				<n:pv url="product/myUpdate.do">
					<c:if test="${tempBean.canUpdate}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}"  
							rel="manageKeys" target="dialogTodo" title="<spring:message code="funcs.Product.update"></spring:message>"> 
							<spring:message code="base.function.update"/></a>
					</c:if>
					<c:if test="${tempBean.canSubmit}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}&submit=yes"  
							rel="manageKeys" target="ajaxTodo" method="post" title="<spring:message code="funcs.Product.update"></spring:message>" confirm="确认要提交审核吗？"> 
							提交审核
						</a>
					</c:if>
					<c:if test="${tempBean.canCancel}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}&cancel=yes"  
							rel="manageKeys" target="ajaxTodo" method="post" title="<spring:message code="funcs.Product.update"></spring:message>" confirm="确认要取消审核吗？"> 
							取消审核
						</a>
					</c:if>
					<c:if test="${tempBean.canDown}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}&down=yes"  
							rel="manageKeys" target="ajaxTodo" method="post" title="<spring:message code="funcs.Product.update"></spring:message>" confirm="确认要下架该商品吗？"> 
							下架
						</a>
					</c:if>
					<c:if test="${tempBean.canUp}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}&up=yes"  
							rel="manageKeys" target="ajaxTodo" method="post" title="<spring:message code="funcs.Product.update"></spring:message>" confirm="确认要上架该商品吗？"> 
							上架
						</a>
					</c:if>
					<c:if test="${tempBean.canDownAndEdit}">
						<span class="spilder">|</span><a href="${basePath}product/myUpdate.do?manageKey=${tempBean.manageKey}&downAndEdit=yes"  
							rel="manageKeys" target="ajaxTodo" method="post" title="<spring:message code="funcs.Product.update"></spring:message>" confirm="下架之后可以修改信息，但需要重新提交审批，确认继续吗？"> 
							修改重新提交
						</a>
					</c:if>
				</n:pv>
			</c:if>
			
			<c:if test="${not my }">
				<c:if test="${tempBean.canApprove}">
				<n:pv url="product/approve.do">
					<a href="${basePath}product/approve.do?manageKey=${tempBean.manageKey}"  
							rel="manageKeys" target="dialogTodo" title="<spring:message code="funcs.Product.update"></spring:message>"> 
						审核
					</a>
				</n:pv>
				</c:if>
			</c:if>
			</td>