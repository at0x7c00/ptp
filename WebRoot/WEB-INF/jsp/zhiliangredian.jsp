<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>质量新闻 - ${systemTitle}</title>
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
		  					质量新闻
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<ul class="module-content">
		  					<%@include file="/WEB-INF/jsp/frontend/common/pageContent.jsp" %>
		  				</ul>
		  				
		  				 <jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="zhiliangredian.do" name="url"/>
		  				 </jsp:include>
		  				
		  			</div>
		  			
		  			<div class="module right blue" style="width:450px;">
		  				<%@include file="/WEB-INF/jsp/frontend/common/calendar.jsp"%>
		  			</div>
		  			
		  			
	  			</div>
	  			
	  		</div>
	  		
  		</div>
		  		<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
  </body>
</html>
