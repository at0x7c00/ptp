<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td>${tempBean.id}</td>
		<td>
		<a href="${basePath}registerApply/detail.do?manageKey=${tempBean.manageKey}" target="dialogTodo" title="查看申请">
			${tempBean.name}
		</a>
		</td>
		<td>
		${tempBean.lawPerson}
		</td>
		<td>
		${tempBean.contact}
		</td>
		<td>
		${tempBean.telq}
		</td>
		<td>
		${tempBean.email}
		</td>
		<td>
		<a href="${basePath}filee/viewPic.do?manageKey=${tempBean.license.manageKey}" target="_blank">
		查看
		</a>
		</td>
		<td>
		<a href="${basePath}filee/viewPic.do?manageKey=${tempBean.lawPersonIDCard.manageKey}" target="_blank">
		查看
		</a>
		</td>
		<td>
		<span style="color:${tempBean.status eq 'UnDeal'?'gray':(tempBean.status eq 'Failed'?'red':'green')};">
		${registerApplyStatusMap[tempBean.status]}
		</span>
		</td>
		<td>
		<c:if test="${tempBean.status eq 'UnDeal'}">
		<a href="${basePath}registerApply/approve.do?manageKey=${tempBean.manageKey}" target="dialogTodo" title="申请审核">
			审核
		</a>
		</c:if>
		
		
		
		</td>