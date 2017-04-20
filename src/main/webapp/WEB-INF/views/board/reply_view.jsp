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
	<table class="table table-bordered"  style="width:500px; "align="center">
		<form action="reply" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bId" value="${reply_view.bId}">
			<input type="hidden" name="bName" value="${ID}">
			<input type="hidden" name="bGroup" value="${reply_view.bGroup}">
			<input type="hidden" name="bStep" value="${reply_view.bStep}">
			<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 			<input type="hidden" name="searchType" value="${cri.searchType}">
 			<input type="hidden" name="keyword" value="${cri.keyword}">
			
			<tr>
				<td> 번호 </td>
				<td> ${reply_view.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${reply_view.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> ${ID}</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" style="width:30em;" name="bTitle" value="${reply_view.bTitle}"></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" cols="50"   name="bContent">${reply_view.bContent}</textarea></td>
			</tr>
		</table>
		<br>
			<center><input type="file" name="file"><br></center><br>
			<center><input type="submit" class="button blue alt"  value="답변" style="width:100px;">&nbsp;&nbsp; <input type="button" value="목록보기" class="button blue alt" onclick="location.href='listPage'"/></center>
		</form>
	
	
</body>
</html>