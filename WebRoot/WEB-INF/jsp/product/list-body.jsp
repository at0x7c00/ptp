<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td>${tempBean.id}</td>
		<td>
		${tempBean.name}
		</td>
		<td>
		${tempBean.brand}
		</td>
			<td>${tempBean.category.name}</td>
		<%-- <td>
		${tempBean.spec}
		</td> --%>
		<%-- <td>
		${tempBean.productAddr}
		</td> --%>
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
		${productStatusMap[tempBean.status]}
		</td>
			<td>${tempBean.creator.chineseName}</td>
			
			<td>
			<c:choose>
				<c:when test="${not empty tempBean.qrCode}">
					<a href="${basePath}filee/downloadFile.do?key=${tempBean.qrCode.manageKey}" target="_blank">
					下载
					</a>
				</c:when>
				<c:otherwise>
				无
				</c:otherwise>
			</c:choose>
			</td>