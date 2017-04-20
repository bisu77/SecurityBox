<%@page import="com.allin.web.dto.FDto"%>
<%@page import="com.allin.web.dto.BDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>    
<%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">
<link rel="stylesheet" href="/web/resources/css/bootstrap.css">

<title>Content View</title>
</head>
<body>

		<div class="box-header with-border" style="padding-bottom:30px;">
			<center><h1 class="box-title">자유 게시판</h1></center>
		</div>
		<div class="box-body" align="right">
	<table class="table table-bordered" style="width:500px;" align="center">
		<tbody>
			<tr>
				<td> 번호 </td>
				<td> ${content_view.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view.bHit} </td>
			</tr>
			<tr>
				<td> 글쓴이 </td>
				<%-- <td> <input type="text" name="bName" value="${content_view.bName}"></td> --%>
				<td>${content_view.bName} </td>
			</tr>
			<tr>
				<td> 날짜 </td>
				
				<td>${content_view.bDate}</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<%-- <td> <input type="text" name="bTitle" value="${content_view.bTitle}"></td> --%>
				<td>${content_view.bTitle}</td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" cols="50" name="bContent" style="border:0px;" >${content_view.bContent}</textarea></td> 
				
			</tr>
		</tbody>
	</table>
	</div>
	<body>
		<p align="center">		
		<%
			FDto fdto = (FDto)request.getAttribute("file_select");
			if(fdto==null){
		%>
				첨부파일 : 없음 <br>
		<%
			}
			else{
				int file_size = fdto.getFile_size()/1000;
				
		%>
				첨부파일 : <a href="file_down?bId=${content_view.bId}">${file_select.original_file_name}</a> &nbsp;&nbsp; 파일크기 : <%=file_size %> KB<br>
		<%
			}
		%>
		
		<form action="listPage" method="get">
 			<input type="hidden" name="page" value="${cri.page}">
 			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 			<input type="hidden" name="searchType" value="${cri.searchType}">
 			<input type="hidden" name="keyword" value="${cri.keyword}">
 			<a href="#" style="font:0/0 a;" >목록보기</a>
 			<center><input type="submit" class="button blue alt" value="목록보기"/></center>
 		</form>
		 <% 
			
			BDto dto = (BDto)request.getAttribute("content_view"); 
		 
		if(session.getAttribute("ID").toString().equals(dto.getbName())){
			%>
				<br>
				<table align="center">
				<tr>
				<td style="padding-right:10px;">
					<form action="modify_view" method="post">
						<input type="hidden" name="bId" value="${content_view.bId}">
						<input type="hidden" name="page" value="${cri.page}">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 						<input type="hidden" name="searchType" value="${cri.searchType}">
 						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="submit" class="button blue alt" value="수정">
					</form>
					</td>
					<td>
					<form action="delete" method="post">
						<input type="hidden" name="page" value="${cri.page}">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 						<input type="hidden" name="searchType" value="${cri.searchType}">
 						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name="bId" value="${content_view.bId}">
						<input type ="submit" class="button blue alt"  value="삭제">
					</form>
					</td>
					</tr>
					</table>
					<%-- <a href="delete?bId=${content_view.bId}">삭제</a> --%> 
			<%
		}
		else if(session.getAttribute("ID").toString().equals("admin")){
			%>
			<br>
			<table align="center">
				<tr>
				<td style="padding-right:10px;">
				<form action="modify_view" method="post">
					<input type="hidden" name="bId" value="${content_view.bId}">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 					<input type="hidden" name="searchType" value="${cri.searchType}">
 					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="submit" class="button blue alt"  value="수정">
				</form> </td>
				<td style="padding-right:10px;">
				<form action="delete" method="post">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
 					<input type="hidden" name="searchType" value="${cri.searchType}">
 					<input type="hidden" name="keyword" value="${cri.keyword}">
					<input type="hidden" name="bId" value="${content_view.bId}">
					<input type ="submit" class="button blue alt" value="삭제">
				</form></td>
				<td>
	
				<form action="reply_view?bId=${content_view.bId}" method="post">
					<input type="hidden" name="page" value="${cri.page}">
 					
					<input type="hidden" name="bId" value="${content_view.bId}">
					<input type ="submit" class="button blue alt"  value="답변">
				</form>
				</td>
			<%-- <br><input type="submit" value="수정">&nbsp;&nbsp;<a href="delete?bId=${content_view.bId}">삭제</a>&nbsp;&nbsp; <a href="reply_view?bId=${content_view.bId}">답변</a> --%>
		<%
		}
		 %>
	</p>
	
	
</body>
</html>