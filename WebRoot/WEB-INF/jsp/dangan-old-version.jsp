<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>${qa.title} - 质量档案 - ${systemTitle}</title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource-old-version.jsp" %>
		<%--
		<link rel="stylesheet" type="text/css" media="screen" href="${basePath}js/3d-gallery/css/style.css">
		 --%>
		<link rel="stylesheet" type="text/css" media="screen" href="${basePath}resource/frontend/theme/default/css/detail.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${basePath}js/zoom-pic/css/style.css">
		
		<link href="http://vjs.zencdn.net/5.8.8/video-js.css" rel="stylesheet">

		 <!-- If you'd like to support IE8 -->
		 <script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
		 
		 <script src="${basePath}js/zoom-pic/js/ZoomPic.js" type="text/javascript"></script>
		 
		 
		<link rel="stylesheet" href="${basePath}photoswipe/photoswipe.css"> 
		<link rel="stylesheet" href="${basePath}photoswipe/default-skin/default-skin.css"> 
		<script src="${basePath}photoswipe/photoswipe.min.js"></script> 
		<script src="${basePath}photoswipe/photoswipe-ui-default.min.js"></script> 
		
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
		p{
		font-size:14px;
		text-align:left;
		line-height:20px;
		text-indent: 2em;
		}
		.subfeature{
			width:205px;
			height:275px;
		}
		.stepcarousel{
			height:290px;
		}
		.scrollbut{
			display: none;
		}
		.stepcarousel .panel{
			margin:20px;
			width:205px;
		}
		.search-btn,.search-box{
			display:none;
		}
		 </style>
		 
		 
  	</head>
  
  <body style="width:1280px;margin:0px auto;">
  		<%--
  		<div class="dangan-detail-line"></div>
  		 --%>
  		<div class="dangan-detail-banner">
  		</div>
  		<div class="dangan-devider"></div>
  		<div class="smark"></div>
  		<div class="container-x">
	  
  			<div class="qute" style="margin-top:5px;">
  				<div style="text-align:center;" class="image-devider a">
  				</div>
	  			<div class="dangan-detail-content">
	  			
	  					<div class="dangan-cover">
	  			
	  						<c:if test="${not empty qa.detailCover }">
		  						<c:choose>
		  							<c:when test="${qa.detailCover.video }">
				  							<div style="width:434px;height:330px;float:right;">
						  						<video id="my-video" class="video-js" controls preload="auto" width="430" height="330"
											  poster="${basePath}filee/viewPic.do?manageKey=${qa.detailCover.manageKey}" data-setup="{}">
											    <source src="${basePath}filee/downloadFile.do?key=${qa.detailCover.manageKey}" type='video/mp4'>
											    <p class="vjs-no-js">
											      To view this video please enable JavaScript, and consider upgrading to a web browser that
											      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
											    </p>
											  </video>
				  							</div>
		  							</c:when>
		  							<c:otherwise>
				  						<img alt="" src="${basePath}filee/viewPic.do?manageKey=${qa.detailCover.manageKey}" class="title-img">
		  							</c:otherwise>
		  						</c:choose>
	  						</c:if>
	  						</div>
	  						
	  						<div class="dangan-content">
	  							<h1 style="font-size:24px;font-weight:bold;color:black;text-align: center;margin:40px 0px 20px 0px;">
	  							<n:shorthand length="30" content="${qa.title}"></n:shorthand> 
	  							</h1>
	  							<div style="font-size:18px;text-indent: 2em;line-height:1.5em;height: 280px;overflow: auto;">
	  							<n:html value="${qa.content}"/> 
	  							</div>
	  						</div>
	  			</div>
	  			<div class="abc">
	  				
	  			</div>
  			</div>
  			<div class="qute">
  				<div class="dangan-devider" style="margin-bottom:34px;"></div>
  				<div class="image-devider b">
  				</div>
  				
  				 <div class="gallery-box">
						<div id="Index_Box"">
						  <pre class="prev">&nbsp;</pre>
						  <pre class="next">&nbsp;</pre>
						  <ul style="padding-left:0px;">
							<c:forEach items="${qa.productDisplay}" var="file" varStatus="s">
						    <li><a href="javascript:void(0);"><img src="${basePath}filee/viewPic.do?manageKey=${file.manageKey }"></a>
						    <p>
						    	<span class="t">${file.fileNameOnly }</span>
						    	<span class="c">
						    	${qa.productDescArray[s.index]}
						    	</span>
						    </p>
						    </li>
						    </c:forEach>
						  </ul>
						</div>
				  </div>
				 
  			</div>
  			<div class="qute" style="">
  					<div class="dangan-devider"></div>
  					<div class="image-devider c">
  					</div>
  					
  					<div style="margin:20px;margin-top:20px;text-aling:center;background: #e7e4d5;">
  					
  					
  					 <div id="colee_left" style="margin:0px 20px;overflow:hidden;">
		<table>
                    <tbody><tr>
                        <td id="colee_left1">
                            <table cellpadding="15px;">
                                <tbody><tr>
                                   <c:forEach items="${qa.gloryDisplay}" var="p">
                                    <td>
                                    <img src="${basePath}filee/viewPic.do?manageKey=${p.manageKey}" 
								alt="butterflies-are-gross" class="post-image" width="205" height="275" />
                                    </td>
                                    </c:forEach>
                                </tr>
                            </tbody></table>
                        </td>
                        <td id="colee_left2">
                            <table cellpadding="5px;">
                                <tbody><tr>
                                <c:forEach items="${qa.gloryDisplay}" var="p">
                                    <td>
                                    <img src="${basePath}filee/viewPic.do?manageKey=${p.manageKey}" 
								alt="butterflies-are-gross" class="post-image" width="205" height="275" />
                                    </td>
                                    </c:forEach>
                                </tr>
                            </tbody></table>
                        </td>
                    </tr>
                </tbody></table>
               </div> 
  					
  					<%-- <div id="mygallery" class="stepcarousel">
					<div class="belt" id="displaycssbelt">
						<c:forEach items="${qa.gloryDisplay}" var="p">
							<div class="panel">
								<div class="subfeature"><a href="javascript:void(0);">
								<img src="${basePath}filee/viewPic.do?manageKey=${p.manageKey}" 
								alt="butterflies-are-gross" class="post-image" width="205" height="275" />
								</a>
								
									<div class="subfeature-txt"><h2><a href="javascript:void(0);">Butterflies are Gross</a></h2></div>
								
								</div>
							</div>	
						</c:forEach>
					</div>
					</div> --%>
  					
  					
  					</div>
  					
  					
  			</div>
  		</div>
  		<div></div>
  		<div class="detail-footer" style="width:100%;margin:auto auto;">
  			<div class="line" style="margin:0px auto;margin-top:50px;"></div>
  			<div style="text-align:center;margin-top:50px;font-size:24px;">
  			<%--${basePath}resource/frontend/theme/default/css/img/new/code.png --%>
  				<img alt="" src="${basePath }filee/viewPic.do?manageKey=${qa.codeKey}"/>
  				<div style="padding:15px 0px 10px 0px;">
  				联系方式：${qa.phoneNumber}
  				</div>
  				<div  style="padding:5px 0px 50px 0px;">
  				地址：${qa.address}
  				</div>
  			</div>
  			<%--
  			<div style="margin:0px auto;text-align:center;color:#663333;font-weight:bold;font-size:20px;padding:20px 0px 30px 0px;">
  				<span>品质·信誉·未来</span>
  			</div>
  			 --%>
  		</div>
  		
  		<%@include file="/WEB-INF/jsp/frontend/common/footer-oldversion.jsp" %>
  		
  		<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

    <!-- Background of PhotoSwipe. 
         It's a separate element as animating opacity is faster than rgba(). -->
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">

        <!-- Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="关闭"></button>
<%--
                <button class="pswp__button pswp__button--share" title="Share"></button>
 --%>

                <button class="pswp__button pswp__button--fs" title="全屏"></button>

                <button class="pswp__button pswp__button--zoom" title="缩放"></button>

                <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                <!-- element will get class pswp__preloader--active when preloader is running -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                      <div class="pswp__preloader__cut">
                        <div class="pswp__preloader__donut"></div>
                      </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div> 
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="上一张">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="下一张">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div>
  </body>
  	  
  	  <script src="http://vjs.zencdn.net/5.8.8/video.js"></script>
  	   <script>
		    var speed = 30//速度数值越大速度越慢
		    var colee_left2 = document.getElementById("colee_left2");
		    var colee_left1 = document.getElementById("colee_left1");
		    var colee_left = document.getElementById("colee_left");
		    colee_left2.innerHTML = colee_left1.innerHTML;
		    var cWidth = $(window).width() - 20;
		    if(cWidth>1280){
		    	cWidth = 1280;
		    }
		    //$("#colee_left").css("width",cWidth);
		    function Marquee3() {
		        if (colee_left2.offsetWidth - colee_left.scrollLeft <= 0)//offsetWidth 是对象的可见宽度
		            colee_left.scrollLeft -= colee_left1.offsetWidth//scrollWidth 是对象的实际内容的宽，不包边线宽度
		        else {
		            colee_left.scrollLeft++
		        }
		    }
		    var MyMar3 = setInterval(Marquee3, speed)
		    colee_left.onmouseover = function () {
		        clearInterval(MyMar3)
		    }
		    colee_left.onmouseout = function () {
		        MyMar3 = setInterval(Marquee3, speed)
		    }
		    
		   $(function(){
			   
			   $(".post-image").click(function(){
					
					var pswpElement = document.querySelectorAll('.pswp')[0];

					var thisSrc = $(this).attr("src");
					var index = 0;
					
					var images = [];
					$(".post-image").each(function(i){
						var _this = $(this);
						images.push(_this);
						var src = _this.attr("src");
						if(src==thisSrc){
							index = i;
						}
					});
					
					addImageToItemArray(images,null,function(items){
						
						var options = {
						    index: index ,
						    bgOpacity:0.7
						};

						var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
						gallery.init();
						
					});
					
				});
			   
		   });
		   
		   function addImageToItemArray(images,items,callback){
				if(!items){
					items = [];
				}
				if(images.length==0){
					callback(items);
					return;
				}
				var image = $(images[0]);
				var src = image.attr("src");
				$("<img>").attr("src",src).load(function(){
					//console.log("image loaded:width=" + this.width+",height=" + this.height)
					items.push({
				        src: src,
				        w: this.width,
				        h: this.height
				    });
					images.shift();
					addImageToItemArray(images,items,callback);
				});
				
			}
		</script>
</html>