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
 		<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu-dangan.jsp" %>
  		<div class="container">
 			
	  		<div class="main-content" style="">
	  		
	  			<div class="module-group blue">
	  			<a name="content"></a>
	  				<div>
	  					<h1 class="page-title" style="text-align:left;">${p.title }
	  					
	  					<span style="float:right;font-size:14px;color:#333;">
	  					<fmt:formatDate value="${p.updateTime}" pattern="yyyy-MM-dd"/> 来源：质量档案  编辑：${p.creator.chineseName }
	  					</span>
	  					</h1>
	  					
	  					<n:html value="${p.content}"></n:html>
	  					
	  				</div>
	  				
	  			</div>
	  			
		  		
		  		
	  		</div>
	  		
  		</div>
	  	<%@include file="/WEB-INF/jsp/frontend/common/footer.jsp" %>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
 		<script type="text/javascript">
 		var imgContainerWidth = 0;
 		var brandInter = null;
 		var brandDirection = "left";
 		$(function(){
 			var imgSize = $(".img-container img").size();
 			var imgTotalWidth = (imgSize/2) * 240;
 			imgContainerWidth = $(".brand-table").width();
 			while(imgContainerWidth<imgTotalWidth){
 				imgContainerWidth += imgContainerWidth;
 			}
 			$(".img-container").css("width",imgContainerWidth+"px");
 			
 			
 			$(".brand-table-wrap .ctr.prev").click(function(){
 				brandDirection = "left";
 				stopBrandInter();
 				doBrandSwitch();
 				startBrandInter();
 			});
 			
 			$(".brand-table-wrap .ctr.next").click(function(){
 				brandDirection = "right";
 				stopBrandInter();
 				doBrandSwitch();
 				startBrandInter();
 			});
 			
 			startBrandInter();
 			
 			$(".img-container img").each(function(){
 				$(this).click(function(){
 					var key = $(this).data("key");
 					if(key){
	 					window.open("${basePath}dangan.do?id=" + key);
 					}
 				});
 			});
 			
 		});
 		
 		function stopBrandInter(){
 			if(brandInter){
				window.clearInterval(brandInter);
			}
 		}
 		
 		function startBrandInter(){
 			brandInter = window.setInterval(function(){
 				doBrandSwitch();
 			}, 4000);
 		}
 		
 		function doBrandSwitch(){
 			var left = $(".img-container").css("left");
			var step = $(".brand-table").width();
			if(left.indexOf("px")>0){
				left = parseInt(left.substring(0,left.length - 2));
			}
			if(brandDirection == 'left'){
				left -= step;
				if(left + imgContainerWidth<=0){//已经到最右边了
					left = 0;
				}
			}else{
				left += step;
				if(left > 0){//已经到最左边了
					left = $(".brand-table").width()-imgContainerWidth;
				}
			}
			
			$(".img-container").animate({left:left + "px"});
 		}
 		/* $(function(){
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
 		}); */
 		</script>
  </body>
</html>
