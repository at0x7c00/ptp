<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>商品查询-${systemTitle}</title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" media="screen" href="${basePath}frontend/css/core.css?_t=${_random}">
		<!-- FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/${ficon}.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/${ficon}.ico" type="image/x-icon">

	</head>
	<body>
	
	<div class="main">
	
	<div class="title-all">
	<div class="sys-header">
		<div class="title-logo">
		<img alt="" src="${basePath}frontend/css/img/logo.png">
		</div>
		<div class="line"></div>
	</div>
	<div class="title-text">
		<img src="${basePath}frontend/css/img/title.png">
	</div>
	</div>
	
	<div class="wrapper form query">
	
		<div class="content">
			<div>
				
				<div class="item">
					<div class="item-content">
					<h2 style="text-align:center;color:red;list-style:2px;">您查询的商品不存在或已下架。</h2>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/jsp/frontend/footer.jsp" %>
	<link rel="stylesheet" href="${basePath}photoswipe/photoswipe.css"> 
	<link rel="stylesheet" href="${basePath}photoswipe/default-skin/default-skin.css"> 
	<script src="${basePath}photoswipe/photoswipe.min.js?v=2.0"></script> 
	<script src="${basePath}photoswipe/photoswipe-ui-default.min.js?v=2.0"></script> 
	
	</div>
	
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
	<script type="text/javascript">
	$(function(){
		
		$(".img-wrapper .images").click(function(){
			var kkk = $(this);
			var pswpElement = document.querySelectorAll('.pswp')[0];

			var thisSrc = $(this).attr("src");
			var index = 0;
			
			var images = [];
			$("img",kkk).each(function(i){
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
		
		$(window).resize(function(){
			calcutePadding();
		});
		
		calcutePadding();
		
	});
	
	function calcutePadding(){
		var w = $(window).width();
		if(w>1180){
			$(".wrapper.form.query").css("margin-top","auto");
		}else{
			var p = $(".title-text>img")[0].height + 75;
			$(".wrapper.form.query").css("margin-top",p+"px");
		}
	}
	
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
	</body>
</html>