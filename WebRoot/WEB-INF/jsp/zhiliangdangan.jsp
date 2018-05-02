<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<title>质量档案 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
		<link href="http://vjs.zencdn.net/5.8.8/video-js.css" rel="stylesheet">
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
		
		<style type="text/css">
		 .video-js .vjs-big-play-button {
		    font-size: 3em;
		    line-height: 1.5em;
		    height: 1.5em;
		    width: 3em;
		    display: block;
		    position: absolute;
		    top:80%;
		    bottom: 10px;
		    left: 10px;
		    padding: 0;
		    cursor: pointer;
		    opacity: 1;
		    border: 0.06666em solid #fff;
		    background-color: #2B333F;
		    background-color: rgba(43, 51, 63, 0.7);
		    -webkit-border-radius: 0.3em;
		    -moz-border-radius: 0.3em;
		    border-radius: 0.3em;
		    -webkit-transition: all 0.4s;
		    -moz-transition: all 0.4s;
		    -o-transition: all 0.4s;
		    transition: all 0.4s;
		}
		div.page-info-content p{
			line-height: 2em;
			letter-spacing: 2px;
			text-indent: 35px;
		}
		.img-container .img-group{
			width:1040px;
			float:left;
			display:inline-block;
			height:480px;
		}
		 </style>
  	</head>
  
  <body class="dangan">
 		<%@include file="/WEB-INF/jsp/frontend/common/logo-and-menu-dangan.jsp" %>
  		<div class="container">
 			
	  		<div class="main-content" style="">
	  		
	  			<div class="module-group blue" style="margin-top:0px;">
	  			
	  			
	  				<a name="project"></a>
	  				<div>
	  					<h1 class="page-title">项目简介<small>Project introduction</small>
	  					</h1>
	  					<div class="project-info">
	  						
	  							<c:if test="${not empty projectInfo.cover }">
	  							<c:choose>
		  							<c:when test="${projectInfo.cover.video }">
				  							<div style="width:455px;height:305px;float:right;">
						  						<video id="my-video" class="video-js" controls preload="auto" width="455" height="305"
											  poster="${basePath}filee/viewPic.do?manageKey=${projectInfo.cover.manageKey}" data-setup="{}">
											    <source src="${basePath}filee/downloadFile.do?key=${projectInfo.cover.manageKey}" type='video/mp4'>
											    <p class="vjs-no-js">
											      To view this video please enable JavaScript, and consider upgrading to a web browser that
											      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
											    </p>
											  </video>
				  							</div>
		  							</c:when>
		  							<c:otherwise>
				  						<img alt="" src="${basePath}filee/viewPic.do?manageKey=${projectInfo.cover.manageKey}" style="width:455px;height:305px;" class="title-img">
		  							</c:otherwise>
		  						</c:choose>
	  							</c:if>
	  						
	  					</div>
	  					<div style="display:inline-block;width:740px;float:right;padding:0px 20px;" class="page-info-content">
	  					<p style="text-indent: 2em;">
	  					<n:html value="${projectInfo.content }"></n:html>
						</p>
	  					</div>
	  				</div>
	  				
	  				<div>
	  					<h1 class="page-title">质量强企<small>Quality company</small><a name="qy"></a></h1>
	  					
	  					<div>
	  						<div class="lunbo" style="width:455px;height:360px;display:inline-block;" id="lunbo1">
								<ul class="lb-imgs">
									<c:forEach items="${zhiliangqiangqiList}" var="chapter">
							        <li>
							        <a href="${basePath}chapterDetail.do?k=${chapter.manageKey}#content" target="_blank">
							        	<img data-u="image" src="${basePath}filee/viewPic.do?manageKey=${chapter.cover.manageKey}" title="${chapter.title}" data-url="${basePath}chapterDetail.do?k=${chapter.manageKey}"/>
							        </a>
							        </li>
							        </c:forEach>
								</ul>
								<ul class="lb-remarks">
										<c:forEach items="${zhiliangqiangqiList}" var="chapter">
											<li data-url="${basePath}chapterDetail.do?k=${chapter.manageKey}#content">
												<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}#content" target="_blank">
													${chapter.title}
												</a>
											</li>
										</c:forEach>
								</ul>
								<div class="controller prev"><i class="fa fa-angle-left"></i></div>
								<div class="controller next"><i class="fa fa-angle-right"></i></div>
								
								<div class="pointer">
								<c:forEach items="${zhiliangqiangqiList}" var="chapter">
								<div ><i class="fa fa-circle"></i></div>
								</c:forEach>
								</div>
								
							</div>
							
							<ul class="module-content" style="width:720px;display: inline-block;float:right;margin-top:0px;padding-top:0px;">
		  					<c:forEach items="${zhiliangqiangqiList}" var="chapter">
			  					<li style="list-style-type: disc;color:black; border-bottom: 0px;">
			  					<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}#content"  target="_blank" title="${chapter.title}"><n:shorthand length="33" content="${chapter.title}"></n:shorthand> </a>
			  					</li>
		  					</c:forEach>
		  				</ul>
							
	  					</div>
	  					
	  				</div>
	  				
	  				<div>
	  					<h1 class="page-title">质量档案<small>Quality archives</small><a name="qa"></a></h1>
	  					
	  					
	  					<div>
		  					<div class="brand-table-wrap" style="position: relative;">
		  						<div class="brand-table">
		  							<div class="img-container" style="width:${bWidth}px">
			  							<div class="img-group">
					  					<c:forEach items="${page.list}" var="b" varStatus="s">
					  						<div class="img-wrap">
					  						<img src="${basePath}filee/viewPic.do?manageKey=${b.cover.manageKey}" 
					  						title="${b.title }" data-key="${b.id}" />
					  						<div><n:shorthand length="10" content="${b.title}"></n:shorthand> </div>
					  						</div>
					  						<c:if test="${s.count % 8 ==0}"></div></c:if>
					  						<c:if test="${s.count % 8 ==0 and (not s.last)}"><div class="img-group"></c:if>
					  					</c:forEach>
					  					<c:if test="${fn:length(page.list) % 8 !=0 }">
					  						</div>
					  					</c:if>
		  							</div>
		  							
		  						</div>
	  							<div class="ctr prev"></div>
	  							<div class="ctr next"></div>
		  					</div>
	  					</div>
	  					
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
 		var imgTotalWidth = 0;
 		$(function(){
 			var imgSize = $(".img-container img").size();
 			imgContainerWidth = $(".brand-table").width();//1040
 			
 			imgTotalWidth = parseInt((imgSize/8)) * imgContainerWidth + (imgSize%8==0 ? 0 : 1040);
 			$(".img-container").css("width",imgTotalWidth+"px");
 			
 			
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
				if(left + imgTotalWidth<=0){//已经到最右边了
					left = 0;
				}
			}else{
				left += step;
				if(left > 0){//已经到最左边了
					left = $(".brand-table").width()-imgTotalWidth;
				}
			}
			
			$(".img-container").animate({left:left + "px"});
 		}
 		
 		</script>
  </body>
</html>
