<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<td>${tempBean.id}</td>
<td>
<n:html value="${tempBean.name}"/>
</td>
<td>
${tempBean.status.description}
</td>
<td>
${tempBean.orderNum}
</td>
<td>
${tempBean.remark}
</td>