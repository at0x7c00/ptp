<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en-us">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title> 漂浮窗代码-${systemTitle} </title>
		<%@include file="/WEB-INF/jsp/frontend/common/resource.jsp" %>
		
		<script src="${basePath}js/jscolor/jscolor.js"></script>
		<script src="${basePath}js/clipboard.min.js"></script>
		<script src="${basePath}js/toastr/toastr.min.js"></script>
		<link rel="stylesheet" href="${basePath}js/toastr/toastr.min.css">
  	</head>
   <style type="text/css">
	ul.module-content>li{
		padding-bottom: 0px;
		border-bottom:0px;
	}
	.footer{
		position: fixed;
		bottom:0px;
	}
	select,input {
		width:100%;
		height:24px;
		font-size:14px;
	}
	select {
		width:100%;
		height:32px;
		font-size:14px;
	}
	table tr td{
		padding:2px;
	}
	table tr td:first-child{
		font-size:14px;
		width:100px;
		background: #eee;
		text-align:right;
	}
	table tr td:last-child{
		font-size:14px;
		width:250px;
	}
	a.button {
	    font-size: 16px;
	    background: #5cb85c;
	    border-radius: 10px;
	    color: #fff;
	    text-decoration: none;
	    padding: 10px;
	    border: 1px solid #5cb85c;
	    margin: 5px;
	    font-weight: 300;
	    letter-spacing: 1px;
	    display: inline-block;
	    width: 100px;
	    cursor:pointer;
	    text-align:center;
	}
	</style>
  <body>
  		<div class="header small" style="background: #efefef;">
  			<div style="width:1250px;margin:auto;line-height:30px;font-size:16px;">
  				获取漂浮窗代码
  			</div>
  		</div>
  		<div class="container" style="margin-top:100px;min-height:800px;">
	  		<form action="#" id="form">
  				<table border="0">
  					<tr>
  						<td>显示方式:</td>
  						<td>
  							<select name="display">
  								<option value="right">靠右</option>
  								<option value="left">靠左</option>
  								<option value="both">两边</option>
  							</select>
  						</td>
  					</tr>
  					<tr>
  						<td>宽度:</td>
  						<td><input type="text" name="width" value="170"/></td>
  					</tr>
  					<tr>
  						<td>高度:</td>
  						<td><input type="text" name="height" value="250"/></td>
  					</tr>
  					<tr>
  						<td>距离顶部距离:</td>
  						<td><input type="text" name="top" value="150"/></td>
  					</tr>
  					<tr>
  						<td>关闭按钮:</td>
  						<td>
  						<select name="enable">
  								<option value="enable">启用</option>
  								<option value="disable">禁用</option>
  							</select>
  						</td>
  					</tr>
  					<input type="hidden" name="bg" class="jscolor" value="FFFFFF"/>
  				</table>
  				
  				</form>
  				<div style="padding:10px 0px;">
	  				<textarea rows="10" cols="60" style="width:100%;" id="output"></textarea>
  				</div>
	  			<a class="button" id="copyBtn" data-clipboard-target="#output">复制代码</a>
	  			
	  			<hr/>
	  			说明：
	  			复制该代码粘贴到网站页面的<b>页尾</b>。
  		</div>
 		<%@include file="/WEB-INF/jsp/frontend/common/js.jsp" %>
 		<script type="text/javascript">
 		$(function(){
 			loadFloatDialog();
 			var clipboard = new Clipboard('#copyBtn');
 			toastr.options = {
 					  "closeButton": false,
 					  "debug": false,
 					  "newestOnTop": false,
 					  "progressBar": false,
 					  "positionClass": "toast-top-center",
 					  "preventDuplicates": false,
 					  "onclick": null,
 					  "showDuration": "300",
 					  "hideDuration": "1000",
 					  "timeOut": "5000",
 					  "extendedTimeOut": "1000",
 					  "showEasing": "swing",
 					  "hideEasing": "linear",
 					  "showMethod": "fadeIn",
 					  "hideMethod": "fadeOut"
 					}
 			clipboard.on('success', function(e) {
 				toastr.success("复制成功！")
 			});

 			clipboard.on('error', function(e) {
 			    alert("复制失败，请直接从文本框中选中复制")
 			});
 			
 			$("#form select,#form input").change(loadFloatDialog);
 		});
 		function loadFloatDialog(){
 			var params = "?key=${tempBean.manageKey}";
 			$("#form select,#form input").each(function(){
 				var _this = $(this);
 				params += "&" + _this.attr("name") + "=" + _this.val();
 			});
 			var url = '${basePath}api/code/js.do' +params;
 			var html = '<script  type="text/javascript" src="' + url+ '" id="zwcode_script"><' + '/script>';
 			$("#output").val(html);
 			if($("#zwcode_script").length>0){
 				$("#zwcode_script").remove();
 				$("#zwcode_stylesheet").remove();
 			}
	 		$(document.body).append(html);
 		}
 		</script>
  </body>
</html>
