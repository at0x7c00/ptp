<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title> ${systemTitle}-首页 </title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
  	</head>
   <style type="text/css">
	ul.module-content>li{
		padding-bottom: 0px;
		border-bottom:0px;
	}
	.img-container .img-group{
		width:1035px;
		float:left;
		display:inline-block;
		height:200px;
	}
	</style>
  <body>
		<%@include file="/WEB-INF/jsp/frontend/common/header.jsp" %>
  		<div class="container">
	  		
	  		<div class="main-content" style="margin-top:80px;">
	  			<div class="module-group"  style="min-height:430px;">
		  			<div class="module left" style="width:485px;">
		  				<div class="module-title">
		  					新闻动态
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}zhengcedongtai.do"></a>
		  				</div>
		  				<div class="module-content" style="padding-left:5px;">
		  					<div class="lunbo" style="width:480px;height:360px;" id="lunbo1">
								<ul class="lb-imgs">
									<c:forEach items="${zhengcedongtaiList}" var="chapter">
							        <li>
							        <a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank">
							        	<img data-u="image" src="${basePath}filee/viewPic.do?manageKey=${chapter.middleCoverFirst.manageKey}" title="${chapter.title}" alt="" data-url="${basePath}chapterDetail.do?k=${chapter.manageKey}"/>
							        </a>
							        </li>
							        </c:forEach>
								</ul>
								<ul class="lb-remarks">
										<c:forEach items="${zhengcedongtaiList}" var="chapter">
											<li data-url="${basePath}chapterDetail.do?k=${chapter.manageKey}">
												<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank">
													<n:shorthand length="50" content="${chapter.title}"></n:shorthand>
												</a>
											</li>
										</c:forEach>
								</ul>
								<div class="controller prev"><i class="fa fa-angle-left"></i></div>
								<div class="controller next"><i class="fa fa-angle-right"></i></div>
								
								<div class="pointer">
								<c:forEach items="${zhengcedongtaiList}" var="chapter">
								<div ><i class="fa fa-circle"></i></div>
								</c:forEach>
								</div>
								
							</div>
		  				</div>
		  			</div>
		  			
		  			<div class="module right" style="width:735px;min-height:430px;">
		  				<div class="module-title">
		  					时事热点
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}shishiredian.do"></a>
		  				</div>
		  				<ul class="module-content">
		  					<c:forEach items="${shishiredianList}" var="chapter">
			  					<li>
			  					<%--
			  					<font class="title-prefix">■</font>
			  					 --%>
			  					<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}"><n:shorthand length="25" content="${chapter.title}"></n:shorthand> </a>
			  					<span style="float:right;">
			  						<fmt:formatDate value="${chapter.createTime}" pattern="yyyy/MM/dd"/>
			  					</span>
			  					</li>
		  					</c:forEach>
		  				</ul>
		  			</div>
	  			</div>
	  			
	  			
	  			<div class="module-group" style="min-height:243px;margin-top:20px;">
		  			<div class="module full-page">
		  				<div class="module-title">
		  					质量档案
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}zhiliangdangan.do"></a>
		  				</div>
		  				
		  				<div class="module-content" style="padding-left:5px;padding-right:5px;padding-bottom:10px;position:relative;" >
		  				
		  				
		  				<span id="btn-left" class="btn btn-left"></span>
		  				<span id="btn-right" class="btn btn-right"></span>
		  					<div class="index-dangan-banner">
		  						<a href="${basePath}zhiliangdangan.do" target="_blank" title="质量档案入口">
			  						<div class="dangan-banner-mask">
			  						</div>
		  						</a>
		  					</div>
						  <div id="image-flow">
						    <ul id="image-flow-ul">
						      <c:forEach items="${qualityArchiveList }" var="qa">
						      	<li>
						      	<a href="${basePath}dangan.do?id=${qa.id}" target="_blank" title="${qa.title}">
						      	<img src="${basePath}js/jquery-lazyload/img/grey.gif"
				  						data-original="${basePath}filee/viewPic.do?manageKey=${qa.cover.manageKey}">
						      	</a>
						      	<a href="${basePath}dangan.do?id=${qa.id}" target="_blank" title="${qa.title}" class="remark">
								<span>
								<n:shorthand length="6" content="${qa.title}"></n:shorthand>
								</span>					
								<p>
								<n:html value="${qa.contentText}" length="23"/> 
								</p>
								</a>
						      	</li>
						      </c:forEach>
						    </ul>
						  </div>
		  				</div>
		  				
		  			</div>
		  		</div>
	  			
	  			
	  			<div class="module-group"  style="min-height:400px;margin-top:10px;margin-bottom:0px;padding-bottom:0px;">
	  			
		  			<div class="module left" style="min-height:400px;">
			  				<div class="module-title">
			  					质量新闻
			  				</div>
			  				<div class="module-header">
			  					<a class="more" href="${basePath}zhiliangredian.do"></a>
			  				</div>
			  				<ul class="module-content">
			  					<c:forEach items="${zhiliangredianList}" var="chapter">
				  					<li>
				  					<%--
				  					<font class="title-prefix">■</font>
				  					 --%>
				  					<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}"><n:shorthand length="20" content="${chapter.title}"></n:shorthand> </a>
				  					<span style="float:right;">
				  						<fmt:formatDate value="${chapter.createTime}" pattern="yyyy/MM/dd"/>
				  					</span>
				  					</li>
			  					</c:forEach>
			  				</ul>
			  			</div>
		  			
		  			<div class="module right" style="min-height:400px;">
		  				<div class="module-title">
		  					质量曝光
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}zhiliangbaoguang.do"></a>
		  				</div>
		  				<ul class="module-content">
		  					<c:forEach items="${qualityExposureList}" var="chapter">
			  					<li>
			  					<%--
			  					<font class="title-prefix">■</font>
			  					 --%>
			  					<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}"><n:shorthand length="20" content="${chapter.title}"></n:shorthand> </a>
			  					<span style="float:right;">
			  						<fmt:formatDate value="${chapter.createTime}" pattern="yyyy/MM/dd"/>
			  					</span>
			  					</li>
		  					</c:forEach>
		  				</ul>
		  			</div>
	  			</div>
	  			
	  			
	  			<div style="clear:both;"></div>
	  			
	  			<div class="module-group" style="margin-top:15px;">
		  			<div class="module full-page">
		  				<div class="module-title">
		  					行业资讯
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}huiyuanfengcai.do"></a>
		  				</div>
		  				<div style="margin-top:25px;margin-left:5px;margin-right:5px;">	
		  					<table width="100%" border="0" class="x-table" cellspacing="0"  cellpadding="0">
		  						<tr>
		  							<td width="415px" style="text-align:center;">
		  								<div class="table-column">
			  								<a href="${basePath}chapterDetail.do?k=${hangyezixunTop.manageKey}" target="_blank" title="${hangyezixunTop.title }">
					  								<img alt="" style="width:415px;height:325px;" src="${basePath}js/jquery-lazyload/img/grey.gif" data-original="${basePath}filee/viewPic.do?manageKey=${hangyezixunTop.middleCoverFirst.manageKey}" alt="${hangyezixunTop.title }">
			  								</a>
		  								</div>
		  							</td>
		  							<td width="175px">
		  								<div class="table-column" style="width:175px;background:#cbcbcb;">
		  									<h1>
		  									<a href="${basePath}chapterDetail.do?k=${hangyezixunTop.manageKey}" target="_blank" title="${hangyezixunTop.title }">
		  									<n:shorthand length="10" content=" ${hangyezixunTop.title}"></n:shorthand>
		  									</a>
		  									</h1>
			  								<p>
			  									<n:html value="${hangyezixunTop.contentText }" length="110"/>
			  								</p>
		  								</div>
		  							</td>
		  							<td width="175px" style="text-align:center;">
		  								<div class="table-column pics" style="padding-left:10px;">
		  								<c:forEach items="${hangyezixunList1 }" var="c" varStatus="s">
		  									<a href="${basePath}chapterDetail.do?k=${c.manageKey}" target="_blank" title="${c.title }">
		  									<img alt="${c.title }" style="width:145px;height:100px;" src="${basePath}js/jquery-lazyload/img/grey.gif" data-original="${basePath}filee/viewPic.do?manageKey=${c.smallCoverFirst.manageKey}">
		  									</a>
		  								</c:forEach>
		  								</div>
		  							</td>
		  							<td width="165px" style="text-align:center;">
		  								<div class="table-column pics">
		  								<c:forEach items="${hangyezixunList2 }" var="c" varStatus="s">
		  									<a href="${basePath}chapterDetail.do?k=${c.manageKey}" target="_blank" title="${c.title }">
		  										<img alt="${c.title }" style="width:145px;height:100px;" src="${basePath}js/jquery-lazyload/img/grey.gif" data-original="${basePath}filee/viewPic.do?manageKey=${c.smallCoverFirst.manageKey}">
		  									</a>
		  								</c:forEach>
		  								</div>
		  							</td>
		  							<td>
		  								<div class="table-column">
		  								<ul class="module-content" style="padding-left:5px;">
						  					<c:forEach items="${hangyezixunList}" var="chapter">
							  					<li style="border-bottom:0px;">
							  					<!-- <font class="title-prefix">■</font> -->
							  					<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}"  target="_blank" title="${chapter.title}"><n:shorthand length="13" content="${chapter.title}"></n:shorthand> </a></li>
						  					</c:forEach>
						  				</ul>
						  				</div>
		  							</td>
		  						</tr>
		  					</table>
		  				</div>
		  			</div>
		  		</div>
	  			
	  			
	  			<div class="module-group" style="margin-top:15px;">
		  			<div class="module full-page">
		  				<div class="module-title">
		  					企业风采
		  				</div>
		  				<div class="module-header">
		  					<a class="more" href="${basePath}huiyuanfengcai.do"></a>
		  				</div>
		  				<div style="margin-top:25px;margin-left:5px;margin-right:5px;">	
		  					<table width="100%" border="0" class="x-table" cellspacing="0"  cellpadding="0">
		  						<tr>
		  							<td width="415px" style="text-align:center;">
		  								<div class="table-column">
			  								<a href="${basePath}chapterDetail.do?k=${qiyefengcaiTop.manageKey}" target="_blank" title="${qiyefengcaiTop.title}">
					  								<img alt="" style="width:415px;height:325px;" src="${basePath}js/jquery-lazyload/img/grey.gif" data-original="${basePath}filee/viewPic.do?manageKey=${qiyefengcaiTop.middleCoverFirst.manageKey}">
			  								</a>
		  								</div>
		  							</td>
		  							<td width="175px">
		  								<div class="table-column" style="width:175px;background:#cbcbcb;">
		  									<h1>
		  									<a href="${basePath}chapterDetail.do?k=${qiyefengcaiTop.manageKey}" target="_blank" title="${qiyefengcaiTop.title}">
		  									<n:shorthand length="10" content="${qiyefengcaiTop.title}"></n:shorthand>
											</a>		  									
		  									</h1>
			  								<p>
			  									<n:html value="${qiyefengcaiTop.contentText }" length="110"/>
			  								</p>
		  								</div>
		  							</td>
		  							<td width="300px" style="text-align:center;padding-left:25px;">
		  								<div class="table-column">
		  									<c:forEach items="${huiyuanfengcaiList1}" var="chapter">
				  								<div class="table-module">
				  									<h2>
				  									<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank" title="${chapter.title }">
				  										<n:shorthand length="16" content="${chapter.title}"/>
				  									</a>
				  									</h2>
				  									<div class="table-module-content">
				  										<div>
				  										<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank" title="${chapter.title }">
				  										<img alt="${chapter.title }" style="width:145px;height:100px;" 
				  										src="${basePath}js/jquery-lazyload/img/grey.gif"
				  										data-original="${basePath}filee/viewPic.do?manageKey=${chapter.smallCoverFirst.manageKey}">
				  										</a>
				  										</div>
				  										<div>
				  										<n:html value="${chapter.contentText }" length="45"/>
				  										</div>
				  									</div>
				  								</div>
		  									</c:forEach>
		  								</div>
		  							</td>
		  							<td width="" style="text-align:center;padding-left:25px;">
		  								<div class="table-column">
			  								<c:forEach items="${huiyuanfengcaiList2}" var="chapter">
				  								<div class="table-module">
				  									<h2>
					  									<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank" title="${chapter.title }">
					  										<n:shorthand length="16" content="${chapter.title}"/>
					  									</a>
				  									</h2>
				  									<div class="table-module-content">
				  										<div>
				  										<a href="${basePath}chapterDetail.do?k=${chapter.manageKey}" target="_blank" title="${chapter.title }">
				  											<img alt="${chapter.title }" 
				  											style="width:145px;height:100px;" 
				  											src="${basePath}js/jquery-lazyload/img/grey.gif" data-original="${basePath}filee/viewPic.do?manageKey=${chapter.smallCoverFirst.manageKey}">
				  										</a>
				  										</div>
				  										<div>
				  										<n:html value="${chapter.contentText }" length="45"/>
				  										</div>
				  									</div>
				  								</div>
		  									</c:forEach>
		  								</div>
		  							</td>
		  						</tr>
		  					</table>
		  				</div>
		  			</div>
		  		</div>
		  		
		  		<div class="module-group"  style="min-height:73px;margin-top:10px;padding-bottom:0px;margin-bottom:0px;">
		  			<div class="module full-page">
		  				<div class="module-title">
		  					品牌展示
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<div class="module-content" style="height:200px;width:1240px;overflow: hidden;">
		  					<div class="brand-table-wrap" style="position: relative;">
		  						<div class="brand-table">
		  							<div class="img-container" style="width:${bWidth}px">
		  								<div class="img-group">
					  					<c:forEach items="${brandList}" var="b" varStatus="s">
					  						<div class="img-wrap">
					  						<img 
					  						src="${basePath}filee/viewPic.do?manageKey=${b.logo.manageKey}" 
					  						title="${b.name }" data-href="${b.url}" /> 
					  						</div>
					  						<c:if test="${s.count % 18 ==0}"></div></c:if>
					  						<c:if test="${s.count % 18 ==0 and (not s.last)}"><div class="img-group"></c:if>
					  						
					  					</c:forEach>
					  					<c:if test="${fn:length(brandList) % 18 !=0 }">
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
		  		
		  		<div class="module-group"  style="min-height:73px;margin-top:10px;">
		  			<div class="module full-page">
		  				<div class="module-title">
		  				友情链接
		  				</div>
		  				<div class="module-header">
		  				</div>
		  				<div class="module-content" style="padding-left:0px;padding-right:0px;">
		  					<c:forEach items="${flinkList}" var="flink">
			  					<a href="${flink.url}" target="_blank" style="font-family:'SourceHanSansCN-Light';font-size:16px;color:#444;">${flink.name}</a>
		  					</c:forEach>
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
 			imgContainerWidth = $(".brand-table").width();//1025
 			
 			imgTotalWidth = parseInt((imgSize/18)) * imgContainerWidth + (imgSize%18==0 ? 0 : 1035);
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
 					var url = $(this).data("href");
 					if(url){
	 					window.open(url);
 					}
 				});
 			});
 			
 			$("#image-flow-ul img").each(function(){
 				var _this = $(this);
 				if(!_this.attr("loaded")){
 					_this.attr("src",_this.data("original"));
 					_this.attr("loaded","yes");
 				}
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
			console.log(brandDirection)
			if(brandDirection == 'left'){
				left -= step;
				console.log(left)
				if(left + imgTotalWidth<=0){//已经到最右边了
					left = 0;
				}
			}else{
				left += step;
				console.log(left)
				if(left > 0){//已经到最左边了
					left = $(".brand-table").width()-imgTotalWidth;
				}
			}
			
			$(".img-container").animate({left:left + "px"});
 		}
 		</script>
  </body>
</html>
