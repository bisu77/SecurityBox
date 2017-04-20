<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">
<link rel="stylesheet" href="/web/resources/css/bootstrap.css">

<title>Insert title here</title>
</head>
<body>

	<center><h1 class="box-title">자유 게시판</h1></center><br>	
	<form action="write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${cri.page}">
 			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 			<input type="hidden" name="searchType" value="${cri.searchType}">
 			<input type="hidden" name="keyword" value="${cri.keyword}">
 			
		<table class="table table-bordered" style="width:500px; height:400px "align="center">
			<tr>
				<td width="70px"> 글쓴이 </td>
				<!-- <td> <input type="text" name="bName" size = "50"> </td> -->
				<td><%=session.getAttribute("ID") %></td>
			</tr>
			<tr>
				<td > 제목 </td>
				<td> <input type="text" name="bTitle" size = "45"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea name="bContent" rows="18" cols="46" ></textarea> </td>
			</tr>
		</table>
		<br><br>
		<center><input type="file" name="file"></center>
		<br><br> 
	
		<center><input type="submit" class="button blue alt" value="입력"> 
		<input type="button" value="목록보기" class="button blue alt" onclick="location.href='listPage'"/></center>
	</form>
	
</body>
</html>