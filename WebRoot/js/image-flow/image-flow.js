var image_flow_timer = null;
$(function(){
	
	try{
		  var oDiv = document.getElementById('image-flow');
		  var oUl = document.getElementById('image-flow-ul');
		  var speed = 2;//初始化速度
		 
		  oUl.innerHTML += oUl.innerHTML;//图片内容*2-----参考图（2）
		  var oLi= $('li',$(oUl));
		  oUl.style.width = oLi.length*286+'px';//设置ul的宽度使图片可以放下
		  var oBtn1 = document.getElementById('btn-left');
		  var oBtn2 = document.getElementById('btn-right');
		  
	      function move(){
	        if(oUl.offsetLeft<-(oUl.offsetWidth/2)){//向左滚动，当靠左的图4移出边框时
	        	oUl.style.left = 0;
	        }
	 
	        if(oUl.offsetLeft > 0){//向右滚动，当靠右的图1移出边框时
	        	oUl.style.left = -(oUl.offsetWidth/2)+'px';
	        }
	 
	        oUl.style.left = oUl.offsetLeft + speed + 'px';
	      }
		 
	      oBtn1.onclick=function(){
	    	  speed = -20;
	    	  window.setTimeout(function(){
	    		  speed = -2;
	    	  },500);
		  };
		  
		  oBtn2.onclick = function(){
	        speed = 20;
	        window.setTimeout(function(){
	    		  speed = 2;
	    	  },500);
	        
	      }
	 
		  
		  if(image_flow_timer!=null){
			  clearInterval(image_flow_timer);
		  }
		  image_flow_timer = setInterval(move,30);//全局变量 ，保存返回的定时器
	      
	      oDiv.onmouseout = function () {
	    	  if(image_flow_timer!=null){
				  clearInterval(image_flow_timer);
			  }
	    	  image_flow_timer = setInterval(move,30);
	      };
	      oDiv.onmousemove = function () {
	    	  clearInterval(image_flow_timer);//鼠标移入清除定时器
	      };
	}catch(e){
		console.log(e.message)
		if(image_flow_timer!=null){
		   clearInterval(image_flow_timer);
	    }
	}
	
});