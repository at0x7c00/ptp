<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>密码找回-${systemTitle}</title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" media="screen" href="${basePath}frontend/css/core.css">
		<!-- FAVICONS -->
		<link rel="shortcut icon" href="img/favicon/${ficon}.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/${ficon}.ico" type="image/x-icon">

	</head>
	<body>
	
	<div class="main">
	<%@include file="/WEB-INF/jsp/frontend/header.jsp" %>
	
	<div class="wrapper login">
	
		<div class="sys-title">
		
		</div>
		<form>
		<div class="login-form getcode-form">
			<h1>密码找回</h1>
			<div class="form-input">
				<label class="label user"></label>
				<input type="text" name="username" id="username" placeholder="手机号/用户名" class="blod"/>
			</div>
			
			<div class="form-input">
					<label class="label key"></label>
					<input type="text" name="vcode" placeholder="验证码" id="vcode" class="blod half"/>
					<img alt="验证码" src="${basePath}verifyimage.create?type=small" class="vcode" />
			</div>
				
			
			<div class="form-input">
				<label class="label key"></label>
				<input type="text" name="ckCode" id="ckCode" placeholder="动态码" class="blod half"/>
				<a href="#" class="button blod codegeter" style="width:110px;float:right;" data-type="forget" data-username="#username" data-vcode="#vcode">获取动态码</a>
			</div>
			
			<div class="form-input" style="text-align:center;">
				<a href="javascript:void(0);" class="button blod" style="width:110px;" id="vcodeValidate">下一步</a>
			</div>
		</div>
		
		
		<div class="login-form reset-form" style="display:none;">
			<h1>重置密码</h1>
			<div class="form-input">
				<label class="label lock"></label>
				<input type="password" name="pwd" id="pwd" placeholder="8-30位，必须包含数字、英文字母和特殊字符" class="required pwd blod"/>
				<input type="hidden" name="token" id="token" class="blod"/>
			</div>
			
			<div class="form-input" style="text-align:center;">
				<a href="javascript:void(0);" class="button blod" style="width:110px;" id="resetPwd">提&nbsp;交</a>
			</div>
		</div>
		
		</form>
	
	</div>
	
	<%@include file="/WEB-INF/jsp/frontend/footer.jsp" %>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#vcodeValidate").click(function(){
			var username = $("#username").val();
			var vcode = $("#vcode").val();
			var ckCode = $("#ckCode").val();
			
			if(!username || username.isEmpty()){
				toastr['warning']("请输入用户名!");
				$("#username").focus();
				return;
			}
			
			if(!vcode || vcode.isEmpty()){
				toastr['warning']("请输入验证码!");
				$("#vcode").focus();
				return;
			}
			
			if(!ckCode || ckCode.isEmpty()){
				toastr['warning']("请输入动态码!");
				$("#ckCode").focus();
				return;
			}
			
			$.ajax({
				method:"get",
				url:basePath + "token.do?username=" + username+"&vcode=" + vcode + "&ckCode=" + ckCode,
				success:function(d){
					if(d.statusCode!='200'){
						var msg = getCodeMsgs[d.message];
    					if(!msg){
    						msg = d.message;
    					}
    					toastr["warning"](msg);
	    				$("img.vcode").trigger("click");
					}else{
						$(".reset-form,.getcode-form").toggle();
						$("#token").val(d.message);
					}
				},
				error:function(xhr, ajaxOptions, thrownError){
    				toastr["error"]("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
    			}
			});
			
		});
		
		$("#resetPwd").click(function(){
			var token = $("#token").val();
			if(!token || token.isEmpty()){
				toastr["warning"]("无效的token!");
				$("#reset-form,#getcode-form").toggle();
				return;
			}
			var pwd = $("#pwd").val();
			if(!pwd || pwd.isEmpty()){
				toastr["warning"]("请输入新密码!");
				return;
			}
			if($("#pwd").hasClass("invalid")){
				toastr["warning"]("密码格式有误");
				return;
			}
			
			$.ajax({
				method:"post",
				url:basePath + "resetPwd.do",
				data:{token:token,pwd:pwd},
				success:function(d){
					if(d.statusCode!='200'){
						var msg = getCodeMsgs[d.message];
    					if(!msg){
    						msg = d.message;
    					}
    					toastr["warning"](msg);
					}else{
    					toastr["success"]("密码重置成功，正在跳转...");
    					window.setTimeout(function(){
	    					window.location.href=basePath + "adminIndex.do";
    					},3000);
					}
				},
				error:function(xhr, ajaxOptions, thrownError){
    				toastr["error"]("Http status: " + xhr.status + " " + xhr.statusText + "\najaxOptions: " + ajaxOptions + "\nthrownError:"+thrownError + "\n" +xhr.responseText);
    			}
			});
			
		});
		
	});
	</script>
	</body>
</html>