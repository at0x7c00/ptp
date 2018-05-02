<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>质量档案 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource-old-version.jsp" %>
		<style type="text/css">
		.qa-search-div>span[role=status]{
			position: absolute;
			left:270px;
			padding:5px;
			background: #fff;
			top:2px;
			height:20px;
			line-height:20px;
		}
		.search-btn,.search-box{
			display:none;
		}
		</style>
  	</head>
  
  <body>
  		<div class="container">
  			
  			<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu.jsp" %>
	  		<div style="margin:15px 0px;margin-bottom:0px;">
 				<img alt="" src="${basePath}resource/frontend/theme/default/css/img/zhiliang-banner.png">
 			</div>
 			
 			<div style="position:relative;" class="qa-search-div">
 			<input name="key" placeholder="输入关键字进行搜索" style="height:20px;width:250px;font-size:14px;line-height:20px;padding:5px;" id="keySearch"/>
 			</div>
 			
	  		<div class="main-content" style="margin-top: -30px;">
	  		
	  			<div class="module-group blue">
	  			
	  				
	  				<div class="module-category">
	  					<div class="category-title">
	  						<a name="content"></a>
	  					</div>
	  					<div class="category-content">
	  						<c:forEach items="${categoryList }" var="c">
		  						<a href="${basePath}zhiliangdangan.do?categoryKey=${c.manageKey}#content" class="${category.manageKey eq c.manageKey ? 'active':'' }">${c.name}</a>
	  						</c:forEach>
	  					</div>
	  				</div>
	  			
		  			
		  			<div class="dangan-content">
		  			<c:if test="${empty page.list}">
		  			暂无记录.
		  			</c:if>
		  			<c:forEach items="${page.list}" var="qa">
			  			<div class="dangan-detail">
			  				<div class="dangan-item">
			  					<div class="dangan-pic">
			  						<c:if test="${not empty qa.cover }">
				  						<a href="${basePath}dangan.do?id=${qa.id}" target="_blank">
					  						<img alt="" src="${basePath}filee/viewPic.do?manageKey=${qa.cover.manageKey}"/>
				  						</a>
			  						</c:if>
			  					</div>
			  					<div class="dangan-abstract" length="37">
			  						<a href="${basePath}dangan.do?id=${qa.id}" target="_blank"><n:html length="37" value="${qa.abstractContent}"></n:html>&nbsp;</a>
			  					</div>
			  				</div>
			  			</div>
			  			
		  			</c:forEach>
			  			<jsp:include page="/WEB-INF/jsp/frontend/common/pageBar.jsp">
		  				 	<jsp:param value="${page}" name="page"/>
		  				 	<jsp:param value="zhiliangdangan.do" name="url"/>
		  				 	<jsp:param value="categoryKey=${category.manageKey}" name="params"/>
		  				 </jsp:include>
		  			</div>
		  			
	  			</div>
	  			
		  		
		  		<%@include file="/WEB-INF/jsp/frontend/common/footer-oldversion.jsp" %>
		  		
	  		</div>
	  		
  		</div>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
 		<script type="text/javascript">
 		$(function(){
 				var x = $( "#keySearch" ).autocomplete({
			      source: "${basePath}search.do?target=qa",
			      minLength: 2,
			      select: function( event, ui ) {
			        log( "Selected: " + ui.item.title + " aka " + ui.item.id );
			      }
			    });
 				x.data('ui-autocomplete')._renderItem=function( ul, item ) {
 					
 					var a = $("<a href=\"${basePath}dangan.do?id=" + item.id +"\" target=\"_blank\">"+  item.title +"</a>")
 					
			    	  return $( "<li>" )
			    	    .attr( "data-value", item.id )
			    	    .append(a )
			    	    .appendTo( ul );
			    }
 		});
 		</script>
  </body>
</html>
