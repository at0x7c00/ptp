<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>搜索"<n:shorthand length="10" content="${key }"></n:shorthand>"结果- ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
		<style type="text/css">
		body{
			background: none;
		}
		</style>
  	</head>
  
  <body>
		<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu.jsp" %> 
  		<div class="container search-page" style="margin-top:180px;">
	  			<div class="main-content">
	  			<div class="module-group" >
		  			<div class="module left lg" style="min-height:520px;width:1250px;">
		  				<div class="module-title">
		  					搜索结果
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<ul class="module-content">
		  					<c:if test="${empty page.list }">
								没有搜索到任何记录
							</c:if>
							<h4>搜索"<n:shorthand length="10" content="${key }"></n:shorthand>"，共找到${page.totalCount}条记录。</h4>
							<c:forEach items="${page.list}" var="chapter" varStatus="s">
								<li>
									<a href="${basePath}chapterDetail.do?k=${chapter.key}"  target="_blank" title="${chapter.title}" data-key="${key}" class="hilight-able">
						             <n:shorthand length="50" content="${chapter.title}"></n:shorthand> 
									</a>
									<div>
										<c:if test="${not empty chapter.cover }">
										<div class="imgdiv"><img src="${basePath}filee/viewPic.do?manageKey=${chapter.cover.manageKey}"/></div>
										</c:if>
									
										<div class="search-abstract ${not empty chapter.cover ?'':'full' }">
											<p data-key="${key}" class="hilight-able">
											<n:shorthand length="130" content="${chapter.contentText }" ></n:shorthand>
											</p>
											<div class="sub-abstract">
												<span>${chapter.source eq 'chapter' ? '':'质量档案' }</span> 
												<c:if test="${chapter.source eq 'chapter'}">
												<span>${chapter.webPage.name}</span>
												</c:if>
												<span><fmt:formatDate value="${chapter.updateTime }" pattern="yyyy-MM-dd"/></span>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
		  				</ul>
		  				
		  				
							<div class="page-bar">
								<c:choose>
									<c:when test="${page.pageNum>1}">
										<a href="${basePath}search.do?key=${key}&pageNum=${page.pageNum-1}" style="padding-left:15px;padding-right:15px;"><i class="fa fa-angle-left"></i></a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0);" class="no-hover" style="border-color:#ddd;color:#ddd;padding-left:15px;padding-right:15px;"><i class="fa fa-angle-left"></i></a>
									</c:otherwise>
								</c:choose>
								<c:forEach items="${page.pageBarIndex}" var="x"> 
									<a href="${basePath}search.do?key=${key}&pageNum=${x}" class="${x eq page.pageNum ? 'active':'' }">${x}</a>
								</c:forEach>
								
								<c:choose>
									<c:when test="${page.pageNum<page.countPage}">
										<a href="${basePath}search.do?key=${key}&pageNum=${page.pageNum+1}" style="padding-left:15px;padding-right:15px;"><i class="fa fa-angle-right"></i></a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0);" class="no-hover" style="border-color:#ddd;color:#ddd;padding-left:15px;padding-right:15px;"><i class="fa fa-angle-right"></i></a>
									</c:otherwise>
								</c:choose>
							</div>
		  				
		  			</div>
	  			</div>
	  			
	  		</div>
	  		
  		</div>
  		<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
  </body>
</html>
