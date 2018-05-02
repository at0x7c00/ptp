<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<form action="#" id="liuyan-form">
<table width="100%" cellpadding="5px">
 				<tr>
 					<td width="100px" style="text-align: right">姓名<span class="dialog-required">*</span></td>
 					<td>
 						<input name="user" style="width:80%;" class="required"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right">联系方式<span class="dialog-required">*</span></td>
 					<td colspan="2">
 						<input name="phone" style="width:40%;" placeholder="电话" id="liuyanPhone"/> 或
 						<input name="email" style="width:40%;" placeholder="邮箱" id="liuyanMail"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right">留言内容<span class="dialog-required">*</span></td>
 					<td>
 						<textarea name="content" style="width:80%;" class="required" rows="6" id="liuyanContent"></textarea>
 						<div style="text-align:left;font-size:12px;">您还可以输入<span id="wordLimit">300</span>字</div>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right">验证码<span class="dialog-required">*</span></td>
 					<td>
 						<input name="verifyCode" class="required"/> <img src="" width="150" height="32" id="verifyCodeImage2" style="cursor: pointer;" title="点击切换图片"/>
 					</td>
 				</tr>
 			</table>
</form>