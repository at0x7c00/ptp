<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
											 value="<c:out value="${tmpTmpBean.ip}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].page"
											id="${propName}[${trIndex}].page"
											class="textInput "
											 value="<c:out value="${tmpTmpBean.page}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].userID"
											id="${propName}[${trIndex}].userID"
											class="textInput required"
											 value="<c:out value="${tmpTmpBean.userID}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input name="${propName}[${trIndex}].accessTime" id="${propName}[${trIndex}].accessTime" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}' value='${tmpTmpBean.accessTime}'/>" class="date_not_required textInput valid"/>
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].sessionID"
											id="${propName}[${trIndex}].sessionID"
											class="textInput required"
											 value="<c:out value="${tmpTmpBean.sessionID}"/>"
											maxlength="255" />
								</label>
				</td>