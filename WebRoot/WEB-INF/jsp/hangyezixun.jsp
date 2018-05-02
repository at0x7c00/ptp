<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>行业资讯 - ${systemTitle}</title>
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
		  				行业资讯
		  					<a name="content"></a>
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<ul class="module-content">
		  					<c:if test="${empty page.list }">
								暂无记录
							</c:if>
							<c:forEach items="${page.list}" var="chapter" varStatus="s">
								<li>
								<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}"><n:shorthand length="30" content="${chapter.title}"></n:shorthand> </a>
								</li>
							</c:forEach>
		  				</ul>
		  				
		  				 <jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="hangyezixun.do" name="url"/>
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
