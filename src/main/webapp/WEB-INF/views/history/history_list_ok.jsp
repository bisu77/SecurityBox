<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.allin.web.dto.HistoryDTO"%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<link rel="stylesheet" type="text/css" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/buttonstyle.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>
<body>
	<table style="margin-left:30%;">

	<c:forEach items="${list}" var="dto">
	<tr>
	<td class=font1 align="right">택 배 사</td><td ><a class=font2  style="margin-left:5%;" href="parse_history?company=${dto.company}&trans_num=${dto.trans_num}">${dto.company}</a></td>
	</tr>
	<tr>
	<td class=font1 align="right">운송장번호</td><td><a class=font2  style="margin-left:5%;" href="parse_history?company=${dto.company}&trans_num=${dto.trans_num}">${dto.trans_num}</a></td>
	</tr>
	<tr>
	<td class=font1 align="right">등록시간</td><td nowrap><a class=font2 style="margin-left:5%;" href="parse_history?company=${dto.company}&trans_num=${dto.trans_num}">${dto.enroll_time}</a></td>
	</tr>
	<tr height="10"></tr>
	</c:forEach>
	</table>

	
</body>
</html>