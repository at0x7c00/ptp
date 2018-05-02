<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
	<td>
		<label class="checkbox">
			<input type="checkbox" name="${trTarget}Chk" value="${trIndex}"/>
			<i></i></label>
		<input type="hidden" name="rowGuard${trIndex}" value="1"/>
	</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].ip"
											id="${propName}[${trIndex}].ip"
											class="textInput "
											 value="<c:out value="${tempBean.ip}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].page"
											id="${propName}[${trIndex}].page"
											class="textInput "
											 value="<c:out value="${tempBean.page}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].userID"
											id="${propName}[${trIndex}].userID"
											class="textInput required"
											 value="<c:out value="${tempBean.userID}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input name="${propName}[${trIndex}].accessTime" id="${propName}[${trIndex}].accessTime" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}' value='${tempBean.accessTime}'/>" class="date_not_required textInput valid"/>
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].sessionID"
											id="${propName}[${trIndex}].sessionID"
											class="textInput required"
											 value="<c:out value="${tempBean.sessionID}"/>"
											maxlength="255" />
								</label>
				</td>