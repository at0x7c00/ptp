function ZoomPic ()
{
	this.initialize.apply(this, arguments)	
}
var _width = 1200.0;
var _height = 410.0;
var size_mapping = {
        a:{ width: 272, height: 259, top: 60, left: 146, zIndex: 1 },
        b:{ width: 305, height: 290, top: 40, left: 295, zIndex: 2 },
        c:{ width: 362, height: 345, top: 20, left: 480, zIndex: 3 },
        d:{ width: 305, height: 290, top: 40, left: 760, zIndex: 2 },
        e:{ width: 272, height: 259, top: 60, left: 910, zIndex: 1 }
}
function getAllSizeSetting(w,h){
	var a = _a('a',w,h,1);
	var b = _a('b',w,h,2);
	var c = _a('c',w,h,3);
	var d = _a('d',w,h,2);
	var e = _a('e',w,h,1);
	return [a,b,c,d,e];
}
function _a(name,w,h,zIndex){
	var width = parseInt(((size_mapping[name].width*1.0) / _width) * w);
	var left;
	if(name=='a'){
		left = 0 + 25;
	}else if(name == 'b'){
		left = w / 6;
	}else if(name == 'c'){
		left = (w - width)/2; 
	}else if(name == 'd'){
		left = w - width - (w / 6);
	}else{
		left = w - width - 45;
	}
	console.log(name +":" + left)
	return {
		width:width,
		height:parseInt(((size_mapping[name].height*1.0) / _height) * h),
		top:parseInt(((size_mapping[name].top*1.0) / _height) * h),
		left:left,
		zIndex:zIndex
		};
}
ZoomPic.prototype = 
{
	initialize : function (id)
	{
		var _this = this;
		this.wrap = typeof id === "string" ? document.getElementById(id) : id;
		this.oUl = this.wrap.getElementsByTagName("ul")[0];
		this.aLi = this.wrap.getElementsByTagName("li");
		this.prev = this.wrap.getElementsByTagName("pre")[0];
		this.next = this.wrap.getElementsByTagName("pre")[1];
		this.timer = null;
		this.aSort = [];
		this.iCenter = 2;
		this._doPrev = function () {return _this.doPrev.apply(_this)};
		this._doNext = function () {return _this.doNext.apply(_this)};
		var w = $(window).width() - 100;
		//if(w>_width){
			w = _width;
		//}
		this.options = getAllSizeSetting(w,parseInt(_height/_width * w));
			/*[
           
            { width: 305, height: 198, top: 60, left: 66, zIndex: 1 },
            { width: 272, height: 235, top: 40, left: 145, zIndex: 2 },
            
            { width: 420, height: 260, top: 20, left: 280, zIndex: 3 },
            
            { width: 272, height: 235, top: 40, left: 560, zIndex: 2 },
            { width: 305, height: 198, top: 60, left: 600, zIndex: 1 }
		];*/
		for (var i = 0; i < this.aLi.length; i++) this.aSort[i] = this.aLi[i];
		this.aSort.unshift(this.aSort.pop());
		this.setUp();
		this.addEvent(this.prev, "click", this._doPrev);
		this.addEvent(this.next, "click", this._doNext);
		this.doImgClick();		
		this.timer = setInterval(function ()
		{
			_this.doNext()	
		}, 3000);		
		this.wrap.onmouseover = function ()
		{
			clearInterval(_this.timer)	
		};
		this.wrap.onmouseout = function ()
		{
			_this.timer = setInterval(function ()
			{
				_this.doNext()	
			}, 3000);	
		}
	},
	doPrev : function ()
	{
		this.aSort.unshift(this.aSort.pop());
		this.setUp()
	},
	doNext : function ()
	{
		this.aSort.push(this.aSort.shift());
		this.setUp()
	},
	doImgClick : function ()
	{
		var _this = this;
		for (var i = 0; i < this.aSort.length; i++)
		{
			this.aSort[i].onclick = function ()
			{
				if (this.index > _this.iCenter)
				{
					for (var i = 0; i < this.index - _this.iCenter; i++) _this.aSort.push(_this.aSort.shift());
					_this.setUp()
				}
				else if(this.index < _this.iCenter)
				{
					for (var i = 0; i < _this.iCenter - this.index; i++) _this.aSort.unshift(_this.aSort.pop());
					_this.setUp()
				}
			}
		}
	},
	setUp : function ()
	{
		var _this = this;
		var i = 0;
		for (i = 0; i < this.aSort.length; i++) this.oUl.appendChild(this.aSort[i]);
		for (i = 0; i < this.aSort.length; i++)
		{
			this.aSort[i].index = i;
			if (i < 5)
			{
				this.css(this.aSort[i], "display", "block");
				this.doMove(this.aSort[i], this.options[i], function ()
				{
					_this.doMove(_this.aSort[_this.iCenter].getElementsByTagName("img")[0], {opacity:100}, function ()
					{
						_this.doMove(_this.aSort[_this.iCenter].getElementsByTagName("img")[0], {opacity:100}, function ()
						{
							_this.aSort[_this.iCenter].onmouseover = function ()
							{
								_this.doMove(this.getElementsByTagName("div")[0], {bottom:0})
							};
							_this.aSort[_this.iCenter].onmouseout = function ()
							{
								_this.doMove(this.getElementsByTagName("div")[0], {bottom:-100})
							}
						})
					})
				});
			}
			else
			{
				this.css(this.aSort[i], "display", "none");
				this.css(this.aSort[i], "width", 0);
				this.css(this.aSort[i], "height", 0);
				this.css(this.aSort[i], "top", 37);
				this.css(this.aSort[i], "left", this.oUl.offsetWidth / 2)
			}
			if (i < this.iCenter || i > this.iCenter)
			{
				this.css(this.aSort[i].getElementsByTagName("img")[0], "opacity", 100)
				this.aSort[i].onmouseover = function ()
				{
					_this.doMove(this.getElementsByTagName("img")[0], {opacity:100})	
				};
				this.aSort[i].onmouseout = function ()
				{
					_this.doMove(this.getElementsByTagName("img")[0], {opacity:100})
				};
				this.aSort[i].onmouseout();
			}
			else
			{
				this.aSort[i].onmouseover = this.aSort[i].onmouseout = null
			}
		}		
	},
	addEvent : function (oElement, sEventType, fnHandler)
	{
		return oElement.addEventListener ? oElement.addEventListener(sEventType, fnHandler, false) : oElement.attachEvent("on" + sEventType, fnHandler)
	},
	css : function (oElement, attr, value)
	{
		if (arguments.length == 2)
		{
			return oElement.currentStyle ? oElement.currentStyle[attr] : getComputedStyle(oElement, null)[attr]
		}
		else if (arguments.length == 3)
		{
			switch (attr)
			{
				case "width":
				case "height":
				case "top":
				case "left":
				case "bottom":
					oElement.style[attr] = value + "px";
					break;
				case "opacity" :
					oElement.style.filter = "alpha(opacity=" + value + ")";
					oElement.style.opacity = value / 100;
					break;
				default :
					oElement.style[attr] = value;
					break
			}	
		}
	},
	doMove : function (oElement, oAttr, fnCallBack)
	{
		var _this = this;
		if(oElement.timer){
			clearInterval(oElement.timer);
		}
		oElement.timer = setInterval(function ()
		{
			var bStop = true;
			for (var property in oAttr)
			{
				var iCur = parseFloat(_this.css(oElement, property));
				property == "opacity" && (iCur = parseInt(iCur.toFixed(2) * 100));
				var iSpeed = (oAttr[property] - iCur) / 5;
				iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
				
				if (iCur != oAttr[property])
				{
					bStop = false;
					_this.css(oElement, property, iCur + iSpeed)
				}
			}
			if (bStop)
			{
				clearInterval(oElement.timer);
				fnCallBack && fnCallBack.apply(_this, arguments)	
			}
		}, 30)
	}
};
window.onload = function ()
{
	var w = $(window).width() - 100;
	//if(w>_width){
		w = _width;
	//}
	var h = parseInt(_height/_width * w);
	
	$("#Index_Box UL").css("width",w);
	$("#Index_Box UL").css("height",h);
	
	$("#Index_Box").css("width",w);
	$("#Index_Box").css("height",h);
	
	var t = parseInt(180.0/_height * h)-50;
	if(t<0){
		t = 20;
	}
	$("#Index_Box .next").css("top",t)
	$("#Index_Box .prev").css("top",t)
	//$("#Index_Box .prev").css("left",-5)
	
	new ZoomPic("Index_Box");
};

/*代码整理：www.97zzw.com  -  97站长素材网*/