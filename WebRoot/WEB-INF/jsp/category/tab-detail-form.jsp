<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
				<td>
									${tempBean.orderNum}
				</td>
				<td>
									${yesNoMap[tempBean.status]}
				</td>
				<td>
									${tempBean.remark}
				</td>
				<td>
									${tempBean.parent.name}
				</td>
				<td>
									${tempBean.name}
				</td>