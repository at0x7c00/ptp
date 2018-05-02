<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<tr>
<td>${tempBean.id }</td>
<td>
<a href="${basePath}filee/viewPic.do?manageKey=${tempBean.manageKey}" target="_blank">
${tempBean.name}
</a>
</td>
<td>${tempBean.extensionName }</td>
<td>
<fmt:formatDate value="${tempBean.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>