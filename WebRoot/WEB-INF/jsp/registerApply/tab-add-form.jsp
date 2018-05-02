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
										<input name="${propName}[${trIndex}].lawPerson"
											id="${propName}[${trIndex}].lawPerson"
											class="textInput "
											 value="<c:out value="${tempBean.lawPerson}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].address"
											id="${propName}[${trIndex}].address"
											class="textInput "
											 value="<c:out value="${tempBean.address}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].contact"
											id="${propName}[${trIndex}].contact"
											class="textInput "
											 value="<c:out value="${tempBean.contact}"/>"
											maxlength="255" />
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
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].telq"
											id="${propName}[${trIndex}].telq"
											class="textInput "
											 value="<c:out value="${tempBean.telq}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].email"
											id="${propName}[${trIndex}].email"
											class="textInput "
											 value="<c:out value="${tempBean.email}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].license.id" name="${propName}[${trIndex}].license.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${commonFileList}" var="commonFile" >
												<option value="${commonFile.id}" ${tempBean.license.id eq commonFile.id ? 'selected' : ''}><c:out value="${commonFile.manageKey}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].lawPersonIDCard.id" name="${propName}[${trIndex}].lawPersonIDCard.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${commonFileList}" var="commonFile" >
												<option value="${commonFile.id}" ${tempBean.lawPersonIDCard.id eq commonFile.id ? 'selected' : ''}><c:out value="${commonFile.manageKey}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
								<label class="select">
								<select id="${propName}[${trIndex}].status" name="${propName}[${trIndex}].status" cssClass=" comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<c:forEach items="${registerApplyStatusMap}" var="entry" >
										<option value="${entry.key}" ${tempBean.status eq entry.key ? 'selected' : ''}><c:out value="${entry.value}"/></option>
									</c:forEach>
								</select><i></i>
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].dealRemak"
											id="${propName}[${trIndex}].dealRemak"
											class="textInput "
											 value="<c:out value="${tempBean.dealRemak}"/>"
											maxlength="255" />
								</label>
				</td>