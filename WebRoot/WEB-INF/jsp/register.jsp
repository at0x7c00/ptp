<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>用户注册-${systemTitle}</title>
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
		<div style="width:730px;margin:auto;padding-top:30px;">
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>公司名称：</span>
				<input type="text" name="name" class="required blod" maxlength="50"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>公司法人：</span>
				<input type="text" name="lawPerson" class="required blod" maxlength="20"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>公司地址：</span>
				<input type="text" name="address" class="required blod" maxlength="50"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>联系人：</span>
				<input type="text" name="contact" class="required blod half" maxlength="30"/>
				
				<span class="form-input-title"><em class="required">*</em>联系电话：</span>
				<input type="text" name="telq" class="required blod half phone" maxlength="20"/>
			</div>
			
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>E-mail：</span>
				<input type="text" name="email" class="required blod email" maxlength="30"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>营业执照：</span>
				<a  class="btn_addPic" href="javascript:void(0);">
					上传图片
					<input type="file" dname="license" class="filePrew required blod" h5uploaderoption="{fileSizeLimit:'2048KB',folderId:'1'}" accept="image/png, image/jpg, image/jpeg, image/gif, image/bmp"/>
				</a>
			</div>
			<div class="form-input image-wrapper hide"></div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>法人身份证：</span>
				<a  class="btn_addPic" href="javascript:void(0);">
					上传图片
				<input type="file" dname="lawPersonID" class="filePrew required blod" h5uploaderoption="{fileSizeLimit:'2048KB',folderId:'1'}" accept="image/png, image/jpg, image/jpeg, image/gif, image/bmp"/>
				</a>
			</div>
			<div class="form-input image-wrapper hide"></div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">&nbsp;</em>其他资质：</span>
				<a  class="btn_addPic" href="javascript:void(0);">
					上传图片
				<input type="file" dname="otherQualifi" multifile="true" class="filePrew required blod" h5uploaderoption="{fileSizeLimit:'2048KB',folderId:'1'}" accept="image/png, image/jpg, image/jpeg, image/gif, image/bmp"/>
				</a>
			</div>
			<div class="form-input image-wrapper hide"></div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>用户名：</span>
				<input type="text" name="username" class="required blod username" placeholder="4-16位，可包含英文字母，数字，下划线" maxlength="20"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>密码：</span>
				<input type="password" name="password" class="required blod pwd" placeholder="8-30位，必须包含数字、英文字母和特殊字符" maxlength="30"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>手机号：</span>
				<input type="text" name="mobileNumber" id="number" class="required blod mobilenum" maxlength="20"/>
			</div>
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>验证码：</span>
				<input type="text" name="vcode" placeholder="验证码" style="width:350px" id="vcode" class="blod half required"/>
				<img alt="验证码" src="${basePath}verifyimage.create?type=small" class="vcode" style="float:left;margin-left:20px;"/>
			</div>
			
			<div class="form-input">
				<span class="form-input-title"><em class="required">*</em>动态码：</span>
				<input type="text" name="ckCode" placeholder="动态码" style="width:350px" id="ckCode" class="blod half required"/>
				<a href="javascript:void(0);" class="button blod codegeter" style="width:110px;float:left;margin-left:20px;" 
				data-type="register" data-number="#number" data-vcode="#vcode">获取动态码</a>
			</div>
			
			<div class="form-input" style="text-align:center;">
				<a href="javascript:void(0);" class="button blod big" style="width:110px;" id="submiter">提交</a>
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
	    					window.location.href = basePath + "regDetail.do?key=" + d.message;
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