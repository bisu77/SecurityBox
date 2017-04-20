<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/web/resources/css/bootstrap.css">

<script src = "http://code.jquery.com/jquery-2.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">


$(document).ready(function(){
	$("#open").mouseover(function(){
		$("#open").attr("src","/web/resources/img/iconbox_open.png");
	}).mouseleave(function(){
		$("#open").attr("src","/web/resources/img/iconbox_close.png");
	});
});
</script> 

	<center>
	<h1 class="box-title"><font color="#3D3D3D"><a href="open_door_alert">O P E N</font></h1>
	<img src="/web/resources/img/iconbox_close.png" id="open"/></a>
	<br><br>
	<h5 class="box-title"><font color="#3D3D3D">이미지를 클릭하시면 SecurityBox가 열립니다.</font></h1></center>
</body>
</html>