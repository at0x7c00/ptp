<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<?xml version='1.0' encoding='UTF-8'?>
<contentsRotator>
<c:forEach items="${tempBean.productDisplay}" var="file" varStatus="s">
<item order='${s.count}' category='E' type='image' title='${file.fileNameOnly}' image='${basePath}filee/viewPic.do?manageKey=${file.manageKey}' source='http://www.baidu.com' target='_blank' />
</c:forEach> 
</contentsRotator>