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
										<input name="${propName}[${trIndex}].name"
											id="${propName}[${trIndex}].name"
											class="textInput required"
											 value="<c:out value="${tempBean.name}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].brand"
											id="${propName}[${trIndex}].brand"
											class="textInput "
											 value="<c:out value="${tempBean.brand}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].category.id" name="${propName}[${trIndex}].category.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${categoryList}" var="category" >
												<option value="${category.id}" ${tempBean.category.id eq category.id ? 'selected' : ''}><c:out value="${category.name}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].picture.id" name="${propName}[${trIndex}].picture.id" class="required comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${commonFileList}" var="commonFile" >
												<option value="${commonFile.id}" ${tempBean.picture.id eq commonFile.id ? 'selected' : ''}><c:out value="${commonFile.manageKey}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].description"
											id="${propName}[${trIndex}].description"
											class="textInput required"
											 value="<c:out value="${tempBean.description}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].spec"
											id="${propName}[${trIndex}].spec"
											class="textInput "
											 value="<c:out value="${tempBean.spec}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].qrCode.id" name="${propName}[${trIndex}].qrCode.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${commonFileList}" var="commonFile" >
												<option value="${commonFile.id}" ${tempBean.qrCode.id eq commonFile.id ? 'selected' : ''}><c:out value="${commonFile.manageKey}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].productAddr"
											id="${propName}[${trIndex}].productAddr"
											class="textInput required"
											 value="<c:out value="${tempBean.productAddr}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].trace"
											id="${propName}[${trIndex}].trace"
											class="textInput required"
											 value="<c:out value="${tempBean.trace}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
								<i class="icon-append fa fa-calendar"></i>
								<input name="${propName}[${trIndex}].deadline" id="${propName}[${trIndex}].deadline" onclick="WdatePicker({dateFmt:'${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}'});"
								value="<fmt:formatDate pattern='${applicationScope.EN_YEAR_MONTH_DAY_HOUR_MIN_SEC}' value='${tempBean.deadline}'/>" class="date_required required textInput valid"/>
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].batchNum"
											id="${propName}[${trIndex}].batchNum"
											class="textInput required"
											 value="<c:out value="${tempBean.batchNum}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].standard"
											id="${propName}[${trIndex}].standard"
											class="textInput "
											 value="<c:out value="${tempBean.standard}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="input">
										<input name="${propName}[${trIndex}].tel"
											id="${propName}[${trIndex}].tel"
											class="textInput required"
											 value="<c:out value="${tempBean.tel}"/>"
											maxlength="255" />
								</label>
				</td>
				<td>
								<label class="select">
								<select id="${propName}[${trIndex}].status" name="${propName}[${trIndex}].status" cssClass="required comboxed">
								<option value=""><spring:message code="base.common.selectone"/></option>
									<c:forEach items="${productStatusMap}" var="entry" >
										<option value="${entry.key}" ${tempBean.status eq entry.key ? 'selected' : ''}><c:out value="${entry.value}"/></option>
									</c:forEach>
								</select><i></i>
								</label>
				</td>
				<td>
										<label class="select">
										<select id="${propName}[${trIndex}].creator.id" name="${propName}[${trIndex}].creator.id" class=" comboxed">
											<option value=""><spring:message code="base.common.selectone"/></option>
											<c:forEach items="${userList}" var="user" >
												<option value="${user.id}" ${tempBean.creator.id eq user.id ? 'selected' : ''}><c:out value="${user.manageKey}"/></option>
											</c:forEach>
										</select><i></i>
										</label>
				</td>