<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
				<td>
									${tempBean.lawPerson}
				</td>
				<td>
									${tempBean.address}
				</td>
				<td>
									${tempBean.contact}
				</td>
				<td>
									${tempBean.name}
				</td>
				<td>
									${tempBean.telq}
				</td>
				<td>
									${tempBean.email}
				</td>
				<td>
									${tempBean.license.manageKey}
				</td>
				<td>
									${tempBean.lawPersonIDCard.manageKey}
				</td>
				<td>
									${registerApplyStatusMap[tempBean.status]}
				</td>
				<td>
									${tempBean.dealRemak}
				</td>