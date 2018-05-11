<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>注册状态-${systemTitle}</title>
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
	<%@include file="/WEB-INF/jsp/frontend/header.jsp" %>
	
	<div class="wrapper form"  style="padding-bottom:30px;">
	
		<div class="sys-title">
		</div>
		
		<form action="">
			<div style="text-align: center;letter-spacing: 2px;">
			<h1>注册成功</h1>
			</div>
		<div style="width:730px;margin:auto;padding-top:30px;" class="view-page">
		
		
			<div class="form-input">
				<span class="form-input-title">公司名称：</span>
				<span>${apply.name}</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">公司法人：</span>
				<span>${apply.lawPerson}</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">公司地址：</span>
				<span>${apply.address}</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">联系人：</span>
				<span>${apply.contact}</span>
				
				<span class="form-input-title" style="float:none;margin-left:150px;">联系电话：</span>
				<span>${apply.telq}</span>
			</div>
			
			
			<div class="form-input">
				<span class="form-input-title">E-mail：</span>
				<span>${apply.email}</span>
			</div>
			
			<div class="form-input view">
				<span class="form-input-title">营业执照：</span>
				<div class="atta-div">
					<img src="${basePath}filee/viewPic.do?manageKey=${apply.license.manageKey}" class="attachement-image" onclick="imageView('${apply.license.manageKey}')">
				</div>
			</div>
			
			<div class="form-input view">
				<span class="form-input-title">法人身份证：</span>
				<div class="atta-div">
					<img src="${basePath}filee/viewPic.do?manageKey=${apply.lawPersonIDCard.manageKey}" class="attachement-image" onclick="imageView('${apply.lawPersonIDCard.manageKey}')">
				</div>
			</div>
			
			<div class="form-input view">
				<span class="form-input-title"><em class="required">&nbsp;</em>其他资质：</span>
				<div style="width:606px;display: inline-block;">
				<c:forEach items="${apply.otherQualifications }" var="q">
				<div class="atta-div">
					<img src="${basePath}filee/viewPic.do?manageKey=${q.manageKey}" class="attachement-image" onclick="imageView('${q.manageKey}')">
				</div>
				</c:forEach>
				</div>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">用户名：</span>
				<span>${apply.username}</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">密码：</span>
				<span>******</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">手机号：</span>
				<span>${apply.mobileNumber}</span>
			</div>
			<div class="form-input">
				<span class="form-input-title">状态：</span>
				<span>
				<b>${apply.status.description}</b>
				</span>
			</div>
			
			<div class="form-input">
				<span class="form-input-title">处理备注：</span>
				<p>
				<b>${apply.dealRemak}</b>
				</p>
			</div>
			
		</div>
		</form>
	
	</div>
	
	<%@include file="/WEB-INF/jsp/frontend/footer.jsp" %>
	</div>
   <script type="text/javascript">
    $(function(){
    	$("#submiter").click(function(){
    		

    		$("form .form-input>input").trigger("blur");
    		
    		var invalids = $("form .form-input>input.invalid").length;
    		if(invalids>0){
    			toastr["info"]("数据有误，请正确填写!");
    			return;
    		}
    		
    		if(!$("input[name=license]")[0] || $("input[name=license]").val().isEmpty()){
    			toastr['warning']("请上传营业执照");
    			return;
    		}
    		if(!$("input[name=lawPersonID]")[0] || $("input[name=lawPersonID]").val().isEmpty()){
    			toastr['warning']("请上传法人身份证");
    			return;
    		}
    		
    		$.ajax({
    			method:"post",
    			url:basePath + "register.do",
    			data:$("form").first().serializeArray(),
    			success:function(d){
    				if(d.statusCode!='200'){
    					var msg = getCodeMsgs[d.message];
    					if(!msg){
    						msg = d.message;
    					}
    					toastr["warning"](msg);
	    				$("img.vcode").trigger("click");
    				}else{
    					toastr["info"]("注册成功!");
    					window.setTimeout(function(){
	    					window.location.href = basePath + "registerSuccess.do?key=" + d.message;
    					},2000);
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