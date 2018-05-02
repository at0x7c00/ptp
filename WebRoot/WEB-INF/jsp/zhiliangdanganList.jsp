<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>质量档案 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
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
		</style>
  	</head>
  
  <body class="dangan">
 		 <%@include file="/WEB-INF/jsp/frontend/common/dangan-logo.jsp" %>
 		<div class="dangan-big-banner mask"  style="margin-top:70px;">
 			<div class="container" style="border:1px solid transparent;">
 			
 			
	  		<div class="main-content" style="margin-top:150px;">
	  		
		  			<div class="module-group blue" style="margin-top:0px;min-height:600px;">
		  			
		  				<div style="float:left;width:320px;min-height:430px;background: rgba(0,0,0,0.7);">
				 			<div style="position:relative;text-align:center;padding:20px;" class="qa-search-div">
				 				<input name="key" placeholder="输入关键字进行搜索" style="height:20px;width:250px;font-size:14px;line-height:20px;padding:5px;" id="keySearch"/>
				 			</div>
				 			
				 			
				 			<div class="module-category">
			  					<div class="category-content">
				  					<a href="${basePath}zhiliangdanganList.do#content" class="${empty category ?'active':''}">全部&nbsp;<i class="fa fa-angle-double-right"></i></a>
			  						<c:forEach items="${categoryList }" var="c">
				  						<a href="${basePath}zhiliangdanganList.do?categoryKey=${c.manageKey}#content" class="${category.manageKey eq c.manageKey ? 'active':'' }">${c.name}&nbsp;<i class="fa fa-angle-double-right"></i></a>
			  						</c:forEach>
			  					</div>
			  				</div>
				 			
		  				</div>
		  				
		  				
		  			
			  			
			  			<div class="dangan-content" style="width:770px;padding:0px 0px 0px 20px;border:0px solid red;display:inline-block;float:right;">
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
				  				 	<jsp:param value="zhiliangdanganList.do" name="url"/>
				  				 	<jsp:param value="categoryKey=${category.manageKey}" name="params"/>
				  				 </jsp:include>
				  		</div>
			  			
		  			</div>
			  		
		  		</div>
		  		
	  		</div>
		</div>
  		
	  	<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
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
 				
 				$("#zhiliangdanganList").addClass("active");
 		}); 
 		
 		</script>
  </body>
</html>
