<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>택배회사 목록</title>

<link rel="stylesheet" type="text/css" href="/web/resources/css/inputstyle.css">

<script language="javascript">
function a(b)
{window.open(b,"company","widht=1000, height=800,toolbar=yes,resizable=yes,menubar=yes,location=yes,status=yes,scrollbars=auto")}


</script>

</head>
<body>
<table align="center">
<tr>
<td align="center"><a href="javascript:a('https://parcel.epost.go.kr/auth.EpostLogin.parcel')"><img src="/web/resources/img/post.JPG"/></a></td> 
<td><a href="javascript:a('https://parcel.epost.go.kr/auth.EpostLogin.parcel')">우체국택배</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.cjkoreaexpress.co.kr')"><img src="/web/resources/img/Cj.JPG"/></a></td> 
<td><a href="javascript:a('http://www.cjkoreaexpress.co.kr')">CJ대한통운</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.hanjin.co.kr/delivery_html/index.jsp')"><img src="/web/resources/img/hanjin.JPG"/></a></td> 
<td><a href="javascript:a('http://www.hanjin.co.kr/delivery_html/index.jsp')">한진택배</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.ilogen.com/')"><img src="/web/resources/img/logen.JPG"/></a></td> 
<td><a href="javascript:a('http://www.ilogen.com/')">로젠택배</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.hlc.co.kr/')"><img src="/web/resources/img/hlc.JPG"/></a></td> 
<td><a href="javascript:a('http://www.hlc.co.kr/')">현대택배</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.kgbls.co.kr')"><img src="/web/resources/img/KGB.JPG"/></a></td> 
<td><a href="javascript:a('http://www.kgbls.co.kr')">KGB택배</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://www.ilyanglogis.com')"><img src="/web/resources/img/ilyang.JPG"/></a></td> 
<td><a href="javascript:a('http://www.ilyanglogis.com')">일양로지스</a></td>
</tr>
<tr>
<td align="center"><a href="javascript:a('http://ems.epost.go.kr')"><img src="/web/resources/img/post.JPG"/></a></td> 
<td><a href="javascript:a('http://ems.epost.go.kr')">EMS</a></td>
</tr>
</table>

</body>
</html>