<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
 contentType="text/css; charset=UTF-8"%>

<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="n" uri="novots"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nfn" uri="novots-functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
.zwcode-wrapper{
	position:fixed;
	top:${top}px;
	width:${width}px;
	height:${height}px;
	padding:5px;
	background:transparent;
}

.zwcode-wrapper.right{
	right:0px;
}
.zwcode-wrapper.left{
	left:0px;
}

<c:if test="${display ne 'both' }">
.zwcode-wrapper.${display eq 'right'?'left':'right'}{
	display:none;
}
</c:if>

.zwcode-wrapper img{
	max-width:100%;
}

.zwcode-wrapper .link-wrap{
	text-align:center;
	height:30px;
	padding:10px;
}
.zwcode-wrapper .link-wrap>a{
	background:#204690;
	border:1px solid #204690;
	padding:5px;
	border-radius:5px;
	color:#fff;
	width:50%;
	display:inline-block;
	font-size:12px;
	text-decoration:none;
}
<c:if test="${enable eq 'disable' }">
.close-btn-wrap{
	display:none;
}
</c:if>
.close-btn-wrap{
	height:18px;
}
.close-btn-wrap img{
	float:right;
	cursor:pointer;
}