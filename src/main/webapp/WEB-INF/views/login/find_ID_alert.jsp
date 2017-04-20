<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/web/resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">

<title>Insert title here</title>
</head>
<body>
<script>
var id = '${id}';

if (id== '') {
   alert("아이디를 찾을 수 없습니다..");
   window.location.href("find_ID");
}
else
	{
	alert("회원님의 아이디는 ["+id+"]입니다.")
	window.location.href("find_PW");
    parent.document.getElementById("findid").className="current_page_item";
    parent.document.getElementById("findpw").className="current_page_itemselected";
	}
	

</script>
	
</body>
</html>