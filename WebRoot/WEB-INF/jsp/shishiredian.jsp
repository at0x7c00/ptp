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
		  			<div class="module full-page" style="min-height:420px;">
		  				<div class="module-title">
		  					时事热点
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<ul class="module-content">
		  					<%@include file="/WEB-INF/jsp/frontend/common/pageContent.jsp" %>
		  				</ul>
		  				
		  				 <jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="shishiredian.do" name="url"/>
		  				 </jsp:include>
		  				
		  			</div>
		  			
		  			
	  			</div>
	  			
	  		</div>
	  		
  		</div>
		  		<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
  </body>
</html>
