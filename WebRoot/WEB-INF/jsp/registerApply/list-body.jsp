<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td>${tempBean.id}</td>
		<td>
		${tempBean.name}
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
		${registerApplyStatusMap[tempBean.status]}
		</td>
		<td>
		${tempBean.dealRemak}
		</td>