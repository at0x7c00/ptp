$(function(){
	
	var requst = $(".menu-bar").first().data("request");
	$(".menu-bar a").each(function(){
		var _this = $(this);
		var href = _this.attr("href");
		if(href.indexOf("?")>=0){
			href = href.substring(0,href.indexOf("?"));
		}
		if(href.endsWith(requst)){
			_this.addClass("active")
		}
	});
	
	
	$(".module-title").each(function(){
		var _this = $(this);
		var content = _this.html();
		_this.html("<span>" + content + "</span>");
	});
	
	
	$("img").lazyload({effect: "fadeIn"});
	
	$(".module-header a.more").each(function(){
		$(this).html("更多 <i class='fa fa-angle-double-right'></i>");
	});
	$(".module-header").each(function(){
		var $this = $(this);
		$this.appendTo($this.parent().find(".module-title").first());
	});
	
	//**临时 开始
	/**/$(".pic-calendar").each(function(){
		
		var _this = $(this);
		var g = _this.parents(".module-group");
		if(g.length>0){
			g = g.first();
			g.find(".module.right.blue").remove();
			var lg = g.find(".module.left.lg");
			if(lg.length>0){
				lg = lg.first();
				lg.addClass("module-tmp");
				lg.css("width","1000px");
			}
		}
	}); 
	if($(".pic-calendar").length==0){
		var lg = $(".module.left.lg");
		if(lg.length>0){
			lg = lg.first();
			//lg.addClass("module-tmp");
			//lg.css("width","1000px");
			lg.css("display","block");
		}
	}
	//**临时 结束
});



(function($){
	/**
	 * 扩展String方法
	 */
	$.extend(String.prototype, {
		isPositiveInteger:function(){
			return (new RegExp(/^[1-9]\d*$/).test(this));
		},
		isInteger:function(){
			return (new RegExp(/^\d+$/).test(this));
		},
		isNumber: function(value, element) {
			return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
		},
		trim:function(){
			return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
		},
		startsWith:function (pattern){
			return this.indexOf(pattern) === 0;
		},
		endsWith:function(pattern) {
			var d = this.length - pattern.length;
			return d >= 0 && this.lastIndexOf(pattern) === d;
		},
		replaceSuffix:function(index){
			return this.replace(/\[[0-9]+\]/,'['+index+']').replace('#index#',index);
		},
		trans:function(){
			return this.replace(/&lt;/g, '<').replace(/&gt;/g,'>').replace(/&quot;/g, '"');
		},
		encodeTXT: function(){
			return (this).replaceAll('&', '&amp;').replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;");
		},
		replaceAll:function(os, ns){
			return this.replace(new RegExp(os,"gm"),ns);
		},
		replaceTm:function($data){
			if (!$data) return this;
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
				return $data[$1.replace(/[{}]+/g, "")];
			});
		},
		replaceTmById:function(_box,singleparam){
			var $parent = _box || $(document);
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
				var paramName = $1.replace(/[{}]+/g, "");
				var $input = $parent.find("#"+paramName);
				if($input.get(0)){
					//如果按照id查询能直接获取到该input，那就直接用这个值
					return $input.val() ? $input.val() : $1;
				}else{
					//否则按照name来查询
					$input = $parent.find("input[name="+paramName+"]:checkbox:checked");
					 if($input.length==0){
						 return $1;//没找到值
					 }else if((singleparam==paramName && $input.length>1)){//this param must be unique in current page
						 //最多选一个
						 return $1;
					 }else if((singleparam==paramName && $input.length==1)){//ok
						 return $input.val();
					 }else{
						 //选择多个
						 var res = "";
						 $input.each(function(i){
							 res+=(i==0)?$(this).val():"&"+paramName+$(this).val();
						 });
						 return res;
					 }
				}
			});
		},
		isFinishedTm:function(){
			return !(new RegExp("{[A-Za-z_]+[A-Za-z0-9_]*}").test(this)); 
		},
		skipChar:function(ch) {
			if (!this || this.length===0) {return '';}
			if (this.charAt(0)===ch) {return this.substring(1).skipChar(ch);}
			return this;
		},
		isValidPwd:function() {
			return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this)); 
		},
		isValidMail:function(){
			return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim()));
		},
		isSpaces:function() {
			for(var i=0; i<this.length; i+=1) {
				var ch = this.charAt(i);
				if (ch!=' '&& ch!="\n" && ch!="\t" && ch!="\r") {return false;}
			}
			return true;
		},
		isPhone:function() {
			return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(this));
		},
		isUrl:function(){
			return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this));
		},
		isExternalUrl:function(){
			return this.isUrl() && this.indexOf("://"+document.domain) == -1;
		}
	});
})(jQuery);
