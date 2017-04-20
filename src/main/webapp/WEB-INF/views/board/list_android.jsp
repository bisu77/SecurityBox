<%@page import="com.allin.web.dto.BDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<table align="center" cellpadding="10" cellspacing="0" border="1">
		<thaed>
			<tr>
				<th width="50">번호</th>
				<th width="500">제목</th>
				<th>날짜</th>
				<th widht="150">글쓴이</th>
				<th width="30">조회</th>
			</tr>
		</thaed>
			<tbody>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td align="center">${dto.bId}</td>
				<c:set var="flag" value="${dto.bIndent}"/>
				<c:choose>
					<c:when test="${flag == 1 }">
						<td>[답변]<a href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
					</c:otherwise>
				</c:choose>				
	
				<td>${dto.bDate}</td>
				<td>${dto.bName}</td>
				<td align="right">${dto.bHit}</td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<p align="right" style="padding-right:100px;"><input type="button" value="글 쓰기"  class="button blue alt" onclick="location.href='write_view'"/></p>
		
</body>
</html>