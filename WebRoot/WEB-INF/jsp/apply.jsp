<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<form action="#" id="apply-form">
<table width="100%" cellpadding="5px">
				<tr>
					<td colspan="2">
					在线提交申请服务,请填写如下信息,“<font style="color:red">*</font>”处为必填信息。信息及资质内容仅限于资格审查不做其他用途。
					</td>
				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>公司名称</td>
 					<td>
 						<input name="name" style="width:80%;" class="required"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>公司地址</td>
 					<td>
 						<input name="address" class="required" id="address" type="hidden"/>
						<select id="p" class="required iselect" name="p">
						<option value="">省辖区</option>
						</select>
						<select id="s" class="required iselect" name="s">
						<option value="">市辖区</option>
						</select>			
						<select id="c" class="required iselect" name="c">
						<option value="">城区</option>
						</select>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>联&nbsp;&nbsp;系&nbsp;人</td>
 					<td>
 						<input name="contact" class="required"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>联系方式</td>
 					<td>
 						<input name="tel" class="required"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>注册资金</td>
 					<td>
 						<input name="registMoney" class="required number"/>&nbsp;万元
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>所属行业</td>
 					<td>
 						<input name="industry" class="required"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;品牌字号</td>
 					<td>
 						<input name="bandNum" />
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;备注</td>
 					<td>
 						<input name="remark" style="width:80%;"/>
 					</td>
 				</tr>
 				<tr>
 					<td width="100px" style="text-align: right"><span class="dialog-required">*</span>验证码</td>
 					<td>
 						<input name="verifyCode" class="required"/> <img src="" width="150" height="32" id="verifyCodeImage" style="cursor: pointer;" title="点击切换图片"/>
 					</td>
 				</tr>
 			</table>
</form>