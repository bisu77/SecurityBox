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



<body >
<div id="header-wrapper">
	<div id="header" class="container" >
		<div id="logo">
			<span><img src="/web/resources/img/ICONBOX.png"/></span>
			<h1><a href="main">Security Box</a></h1>
			<span>Design by All_IN</span>
		</div>
		<div id="triangle-up"></div>
	</div>
</div>
<div id="menu-wrapper">
		<div id="menu">
			<ul id="ul">
				<li><a href="login_page" class="current_page_itemselected" onclick='addCss(this)' target="iframe" id="login">로그인</a></li>
				<li><a href="JoinMember" class="current_page_item" onclick='addCss(this)' target="iframe" id="join">회원가입</a></li>
				<li><a href="find_ID" class="current_page_item" onclick='addCss(this)' target="iframe" id="findid">아이디찾기</a></li>	
				<li><a href="find_PW" class="current_page_item" onclick='addCss(this)' target="iframe" id="findpw">비밀번호찾기</a></li>			
			</ul>
			

		</div>
</div>
<div id="wrapper">	
	<center>
	<iframe src="login_page" name="iframe" frameborder="0" style="width:1200px; height:600px; padding-top:4em;" >	
	</iframe>
	</center>	
</div>
<div id="stamp" class="container">
	<div class="hexagon"><span><img src="/web/resources/img/iconbox_white.png"/></span></div>
</div>
<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved. | Photos by ALL-IN | Design by ALL-IN.</p>
</div>
</body>
</html>
