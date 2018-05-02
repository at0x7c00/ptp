var cIndex = 0;
var cInter = null;
var cTotal = 0;
$(function(){
		cTotal = $(".pic-calendar ul.cal-imgs li").size();
		nCalendar();
		startCal();
		
		$(".cal-bar>ul>li").click(function(){
			var index = $(this).data("index");
			startCal();
			activeCal(index);
		});
		
		$(".pic-calendar ul.cal-imgs li>img").click(function(){
			var url = $(this).data("url");
			if(url){
				window.open(url);
			}
		});
		
		$(".lunbo").lunbo();
		
		$(".search-box").keyup(function(e){
			e.preventDefault();
			if(e.keyCode==13){
				doSearch();
				return false;
			}
		});
		$(".search-btn").click(function(){
			doSearch();
		});
		
		$(".hilight-able").each(function(){
			var _this = $(this);
			var key = _this.data("key");
			if(key){
				var content = _this.html();
				content = content.replaceAll(key,"<em>" + key + "</em>");
				_this.html(content);
			}
		});
		
});

function doSearch(){
	var key = $(".search-box").val();
	if(!key){
		return;
	}
	var isSelf = $(".menu-bar").data("request") == 'search.do';
	window.open(basePath + "search.do?key=" + encodeURIComponent(key),isSelf?"_self":"_blank");
}

function stopCal(){
	if(cInter) window.clearInterval(cInter);
}

function startCal(){
	stopCal();
	cInter = window.setInterval(function(){
		nCalendar();
	}, 3000);
}
function nCalendar(){
	 $(".pic-calendar ul.cal-imgs li").removeClass("active");
	 $(".pic-calendar ul.cal-imgs li img").css("top","100%");
	 var activeImg = $(".pic-calendar ul.cal-imgs li:eq("+cIndex+")");
	 activeImg.addClass("active");
	 $(">img",activeImg).animate({top:"0px"});
	 
	 $(".cal-bar>ul>li").removeClass("active");
	 $(".cal-bar>ul>li:eq('"+cIndex+"')").addClass("active");
	 
	 cIndex++;
	 if(cIndex>=cTotal){
		 cIndex = 0;
	 } 
}

function activeCal(index){
	cIndex = index;
	nCalendar();
}

var lbRecords = {};

(function($){
	$.fn.lunbo = function(options){
		return this.each(function(){
			var l = $(this);
			var h = l.data("height");
			$(">ul.lb-imgs",l).css({"height":l.css("height")});
			$(">ul.lb-imgs>li",l).css({"height":l.css("height")});
			
			var currentIndex = 0;
			var container = l;
			var total = $(">ul.lb-imgs>li",container).size();
			
			var id = container.attr("id");
			lbRecords[id] = {currentIndex:currentIndex,container:container,total:total,direction:"right"};
			
			markAsActive(currentIndex);
			var inter = null;
			
			startInter();
			
			$("div.controller.prev",container).click(function(){
				var id = container.attr("id");
				currentIndex = getCurrentIndex(id);
				//console.log("click..." + currentIndex + "," + total)
				doSwitch(false);
				if(inter){
					window.clearInterval(inter);
				}
				startInter();
			});
			
			$("div.controller.next",container).click(function(){
				var id = container.attr("id");
				currentIndex = getCurrentIndex(id);
				//console.log("click..." + currentIndex + "," + total)
				doSwitch(true);
				if(inter){
					window.clearInterval(inter);
				}
				startInter();
			});
			
			function doSwitch(add){
				if(add){
					incrementCurrentIndex(id);
				}else{
					decrementCurrentIndex(id);
				}
				var currentIndex = getCurrentIndex(id);
				markAsActive(currentIndex);
			}
			
			function markAsActive(currentIndex){
				$(">ul.lb-imgs>li",container).removeClass("active");
				$(">ul.lb-imgs>li:eq("+currentIndex+")",container).addClass("active");
				
				$(">ul.lb-remarks>li",container).removeClass("active");
				$(">ul.lb-remarks>li:eq("+currentIndex+")",container).addClass("active");
				
				$(">div.pointer>div",container).removeClass("active");
				$(">div.pointer>div:eq("+currentIndex+")",container).addClass("active");
			}
			
			function startInter(){
				inter = window.setInterval(function(){
					doSwitch(true);
				},3000);
				
			}
			
			function getCurrentIndex(id){
				return lbRecords[id].currentIndex;
			}
			
			function incrementCurrentIndex(id){
				//console.log("incrementCurrentIndex:" + id)
				lb  = lbRecords[id]; 
				lb.currentIndex++;
				if(lb.direction=='left'){
					//lb.currentIndex++;
					lb.direction = "right";
					//console.log("change direction to right")
				}
				if(lb.currentIndex>=lb.total){
					lb.currentIndex = 0;
				}
			}
			
			function decrementCurrentIndex(id){
				lb  = lbRecords[id]; 
				lb.currentIndex--;
				if(lb.direction=='right'){
					//lb.currentIndex--;
					lb.direction = "left";
					//console.log("change direction to left")
				}
				if(lb.currentIndex < 0){
					lb.currentIndex = lb.total - 1;
				}
			}
			
		});
	};
})(jQuery);