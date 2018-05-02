<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>企业风采 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
  			<link rel="stylesheet" type="text/css" media="screen"  href="${basePath}resource/frontend/theme/default/css/new/column.css?_t=${_random}">
  	</head>
  
  <body>
		<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu.jsp" %> 
  		<div class="container">
  			
	  		
	  		<div class="main-content">
	  			<div class="module-group">
		  			<div class="module full-page">
		  				<div class="module-title">
		  				企业风采
		  					<a name="content"></a>
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<div class="module-content">
		  					<c:if test="${empty page.list }">
								暂无记录
							</c:if>
							<c:forEach items="${page.list}" var="chapter" varStatus="s">
								
								<div>
								
									<div class="img-div">
										<c:if test="${not empty chapter.cover}">
											<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}">
												<img alt="" src="${basePath}filee/viewPic.do?manageKey=${chapter.middleCoverFirst.manageKey}" style="width:285px;height:170px"/>
											</a>
										</c:if>
									</div>
									
									<div class="page-content">
										<h2>
										<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}">
											<n:shorthand length="30" content="${chapter.title}"></n:shorthand>
										</a>
										</h2>
										<div class="content-detail">
											<n:html value="${chapter.abstractContent}" length="110"></n:html>
										</div>
									</div>
								
									
								</div>
								<div class="huiyuan-devider"></div>
							</c:forEach>
		  				</div>
		  				
		  				 <jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="huiyuanfengcai.do" name="url"/>
		  				 </jsp:include>
		  			</div>
		  			
	  			</div>
		  		
		  		
	  		</div>
	  		
  		</div>
 		<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
  </body>
</html>
