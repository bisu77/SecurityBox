<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Plushiness 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20131117

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/web/resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/web/resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->



</head>

<script>
function addCss(obj){
    var aTag = document.getElementById('ul').getElementsByTagName('a');
    for(var i=0, len=aTag.length; i<len; i++){
    	aTag[i].className = "current_page_item";
        if(aTag[i]==obj){ aTag[i].className += "selected"; }        
    }
}
</script>

<% String id=session.getAttribute("ID").toString();%>


<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo" style="height:300px;">
			<span><img src="/web/resources/img/ICONBOX.png"/></span>
			<h1><a href="c_main">Security Box</a></h1>
			<span>Design by All_IN</span><br>
			<br><br>
			<p style="width:300px; margin-left: auto; margin-right: auto; text-align:center;"><font color="white">환영합니다 <%=id %>님&nbsp;&nbsp;&nbsp;</font><a href="main">로그아웃</a></p>
		</div>
		<div id="triangle-up"></div>
	</div>
</div>
<div id="menu-wrapper">
		<div id="menu">
			<ul id="ul">
				<li><a href="regist_page" class="current_page_itemselected" onclick='addCss(this)' target="iframe" >운송장번호등록</a></li>
				<li><a href="show_history" class="current_page_item" onclick='addCss(this)' target="iframe" >배송조회</a></li>
				<li><a href="listPage?page=1" class="current_page_item" onclick='addCss(this)' target="iframe">자유게시판</a></li>
				<li><a href="company_list" class="current_page_item" onclick='addCss(this)' target="iframe" >택배회사바로가기</a></li>
				<li><a href="open_door" class="current_page_item" onclick='addCss(this)' target="iframe" >OPEN</a></li>
			</ul>

		</div>
</div>
<div id="wrapper">	
	<center>
	<iframe src="regist_page" name="iframe" frameborder="0" style="width:1200px; height:700px; padding-top:4em;">	
	</iframe>
	</center>	
</div>
<div id="stamp" class="container" style="height:10px;">
	<div class="hexagon"><span><img src="/web/resources/img/iconbox_white.png"/></span></div>
</div>
<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved. | Photos by ALL-IN | Design by ALL-IN.</p>
</div>
</body>
</html>
