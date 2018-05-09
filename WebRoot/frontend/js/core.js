$(function(){
	
	$("img.vcode").attr("title","点击换一个").click(function(){
		var _this = $(this);
		var url = _this.attr("oldsrc");
		if(!url){
			url = _this.attr("src");
			_this.attr("oldsrc",url);
		}
		if(url.indexOf("?")>0){
			url += "&";
		}else{
			url += "?";
		}
		url += "_t=" + new Date().getTime();
		_this.attr("src",url);
	});
	
	$(".codegeter").click(function(){
		var _this = $(this);
		if(_this.hasClass("unuseable")){
			return;
		}
		
		var type = _this.data("type");
		var username = $(_this.data("username")).val()+"";
		var vcode = $(_this.data("vcode")).val()+"";
		if(username.isEmpty()){
			toastr['info']("请输入手机号/用户名!");
			return;
		}
		if(vcode.isEmpty()){
			toastr['info']("请输入验证码!");
			return;
		}
		
		_this.addClass("unuseable");
		$.ajax({
			method:"get",
			url:basePath + "code.do?for=" + type + "&username=" + username + "&vcode=" + vcode,
			success:function(d){
				$("img.vcode").trigger("click");
				if(d.statusCode!='200'){
					toastr["warning"](getCodeMsgs[d.message]);
					_this.removeClass("unuseable");
				}else{
					toastr["info"]("动态码已发送至号码为" + d.message+"的手机");
				}
			},
			error:function(xhr, ajaxOptions, thrownError){
				toastr["error"]("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
				_this.removeClass("unuseable");
			}
		});
	});
	
});

function disableWithTimeLimit(){
	
}

var getCodeMsgs = {};
getCodeMsgs["Time-too-short"   ]="您访问的太频繁了，请稍后再试";
getCodeMsgs["IP-too-frequent"  ]="您的IP访问次数太多，请第二天再试";
getCodeMsgs["Invalid-vcode"    ]="您输入的验证码有误";
getCodeMsgs["User-not-found"   ]="您输入的用户名或手机号不存在";
getCodeMsgs["Illegal-access"   ]="非法访问";
getCodeMsgs["Wrong-number"     ]="您输入的电话号码有误";
getCodeMsgs["Server-error"     ]="服务器异常";
getCodeMsgs["OK"               ]="发送成功!";

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
		isMobileNum:function(){
			return (new RegExp(/^1[3|4|5|6|7|8|9][0-9]{9}$/).test(this));
		},
		isUrl:function(){
			return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this));
		},
		isExternalUrl:function(){
			return this.isUrl() && this.indexOf("://"+document.domain) == -1;
		},
		isEmpty:function(){
			return !this || this.trim()=='';
		}
	});
})(jQuery);
