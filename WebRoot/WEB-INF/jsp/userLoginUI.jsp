<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>用户登录-${systemTitle}</title>
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
	
	<div class="login-wrapper">
	
		<div class="sys-title">
		
		</div>
	
		<div class="login-form">
			<h1>账号密码登录</h1>
			<div class="form-input">
				<label class="label user"></label>
				<input type="text" name="username" placeholder="手机号/用户名" class="blod"/>
			</div>
			
			<div class="form-input">
				<label class="label lock"></label>
				<input type="text" name="password" placeholder="密码" class="blod"/>
			</div>
			
			<div class="form-input">
				<label class="label key"></label>
				<input type="text" name="ckCode" placeholder="动态码" class="blod half"/>
				<a href="#" class="button blod" style="width:110px;float:right;">获取动态码</a>
			</div>
			<div class="form-input">
				<a href="${basePath}regist.do">
				注册账号
				</a>
				
 				<a href="${basePath}iforget.do" style="float:right;">
				忘记密码
				</a>
			</div>
			
			<div class="form-input" style="text-align:center;">
				<a href="#" class="button blod" style="width:110px;">确认登录</a>
			</div>
		</div>
	
	</div>
	
	<%@include file="/WEB-INF/jsp/frontend/footer.jsp" %>
	</div>

	</body>
</html>