<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>新闻动态 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
		<link rel="stylesheet" type="text/css" media="screen"  href="${basePath}resource/frontend/theme/default/css/new/column.css?_t=${_random}">
  	</head>
  
  <body>
		<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu.jsp" %> 
  		<div class="container">
	  		<div class="main-content">
	  			<div class="module-group">
		  			<div class="module left lg" style="min-height:420px;width:750px;">
		  				<div class="module-title">
		  				新闻动态<a name="content"></a>
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<ul class="module-content">
		  					<%@include file="/WEB-INF/jsp/frontend/common/pageContent.jsp" %>
		  				</ul>
		  				
		  				 <jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="zhengcedongtai.do" name="url"/>
		  				 </jsp:include>
		  				
		  			</div>
		  			
		  			<div class="module right blue" style="width:450px;">
		  			
		  					<%@include file="/WEB-INF/jsp/frontend/common/calendar.jsp"%>
		  			
		  			</div>
		  			<%-- <div class="module right blue">
		  				<div class="module-title">
		  					<img alt="" src="${basePath}resource/frontend/theme/default/css/img/zhiliangredian-left.png">
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}zhiliangredian.do"></a>
		  				</div>
		  				<ul class="module-content">
		  					<c:forEach items="${zhiliangredianList}" var="chapter">
		  						<%@include file="/WEB-INF/jsp/frontend/common/left-panel-list.jsp" %>
		  					</c:forEach>
		  				</ul>
		  			</div>
		  			
		  			
		  			<div class="module right blue" style="margin-top:25px;">
		  				<div class="module-title">
		  					<img alt="" src="${basePath}resource/frontend/theme/default/css/img/hangye-left.png">
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}hangyezixun.do"></a>
		  				</div>
		  				<ul class="module-content">
		  					<c:forEach items="${hangyezixunList}" var="chapter"> 
		  						<%@include file="/WEB-INF/jsp/frontend/common/left-panel-list.jsp" %>
		  					</c:forEach>
		  				</ul>
		  			</div> --%>
	  			</div>
		  		
		  		
	  		</div>
	  		
  		</div>
  		<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
  </body>
</html>
