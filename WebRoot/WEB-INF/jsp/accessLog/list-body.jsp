<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td>${tempBean.id}</td>
		<td>
		${tempBean.ip}
		</td>
		<td>
		${tempBean.page}
		</td>
		<td>
		${tempBean.userID}
		</td>
			<td><fmt:formatDate value="${tempBean.accessTime}" pattern="${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}"/></td>
		<td>
		${tempBean.sessionID}
		</td>
		<td>
		<a href="${basePath}product/detail.do?uuid=${tempBean.productId}" target="dialogTodo" title="查看产品">
			${tempBean.productId }
		</a>
		</td>