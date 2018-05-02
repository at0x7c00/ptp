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
								<input name="${propName}[${trIndex}].orderNum"
									id="${propName}[${trIndex}].orderNum" type="text"
									   value="<c:out value="${tempBean.orderNum}"/>"
									class="textInput  digits" />
									</label>
				</td>
				<td>
								<label class="select">
								<select id="${propName}[${trIndex}].status" name="${propName}[${trIndex}].status" cssClass=" comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<c:forEach items="${yesNoMap}" var="entry" >
										<option value="${entry.key}" ${tempBean.status eq entry.key ? 'selected' : ''}><c:out value="${entry.value}"/></option>
									</c:forEach>
								</select><i></i>
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].remark"
											id="${propName}[${trIndex}].remark"
											class="textInput "
											 value="<c:out value="${tempBean.remark}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].parent.id" name="${propName}[${trIndex}].parent.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${categoryList}" var="category" >
												<option value="${category.id}" ${tempBean.parent.id eq category.id ? 'selected' : ''}><c:out value="${category.name}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].name"
											id="${propName}[${trIndex}].name"
											class="textInput required"
											 value="<c:out value="${tempBean.name}"/>"
											maxlength="255" />
								</label>
				</td>