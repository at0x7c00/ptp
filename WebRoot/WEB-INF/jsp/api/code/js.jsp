<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
 contentType="text/javascript; charset=UTF-8"%>

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

var link=document.createElement("link");
var linkRel = document.createAttribute("stylesheet");
link.setAttribute("rel","stylesheet");

var linkHref = document.createAttribute("stylesheet");
link.setAttribute("href","<n:html value="${cssUrl}"/>");
link.setAttribute("id","zwcode_stylesheet");

document.body.appendChild(link);

function createCodeWrap(c){
	var div=document.createElement("div");
	div.setAttribute("class","zwcode-wrapper " + c);
	
	var closeBtn = document.createElement("div");
	closeBtn.setAttribute("class","close-btn-wrap");
	var closeImg=document.createElement("img");
	closeImg.setAttribute("src","${basePath}resource/frontend/theme/default/css/new/img/close.png");
	closeImg.setAttribute("title","关闭");
	closeBtn.appendChild(closeImg);
	
	div.appendChild(closeBtn);
	
	closeBtn.onclick = function(){
		closeBtn.parentNode.remove();
	}
	
	var imgwrap = document.createElement("div");
	imgwrap.setAttribute("class","img-wrap");
	
	var img=document.createElement("img");
	img.setAttribute("src",'${basePath}filee/viewPic.do?manageKey=${tempBean.code.manageKey}');
	
	var imga = document.createElement("a");
	imga.appendChild(img);
	imga.setAttribute("href","<n:html value="${targetUrl}"/>");
	imga.setAttribute("target","_blank");
	
	
	imgwrap.appendChild(imga);
	div.appendChild(imgwrap);
	
	var awrap = document.createElement("div");
	awrap.setAttribute("class","link-wrap");
	var a = document.createElement("a");
	var textNode = document.createTextNode("点击查询");
	a.appendChild(textNode);
	a.setAttribute("href","<n:html value="${targetUrl}"/>");
	a.setAttribute("target","_blank");
	awrap.appendChild(a);
	div.appendChild(awrap);
	document.body.appendChild(div);
}

createCodeWrap('right');
createCodeWrap('left');




