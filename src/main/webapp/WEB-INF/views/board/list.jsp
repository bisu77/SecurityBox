<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/bootstrap.css">

<html>
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>

<body>
<%	String result=request.getParameter("msg");%>
<script>
   var result = '<%=result%>';

 
   if (result == 'WRITE_SUCCESS') {
      alert("글쓰기가 완료되었습니다.");
   }
   else if(result == 'DELETE_SUCCESS')
   {
	   alert("삭제가 완료되었습니다."); 
   }
   else if(result == 'MODIFY_SUCCESS')
   {
	   alert("수정이 완료되었습니다.");
   }
   else if(result == 'REPLY_SUCCESS')
   {
	   alert("답변달기가 완료되었습니다.");
   }
  
   function searchCheck(frm) {
	      //검색

	      if (frm.keyword.value == "") {
	         alert("검색 단어를 입력하세요.");
	         frm.keyword.focus();
	         return;
	      }
	      frm.submit();
	   }
</script>


	<section class="content">
	<div class="col-md-12">
	
	<div class="box">
		<div class="box-header with-border">
			<center><h1 class="box-title">자유 게시판</h1></center><br>
		</div>
		<div class="box-body" align="right" style="margin-right:180px;">
<form name="listPage" action="listPage">
				<select name="searchType" >
				
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
						Title</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
						Content</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
						Writer</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
						Title OR Content</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
						Content OR Writer</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
						Title OR Content OR Writer</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword}'>
				<input type="hidden" name="page" value= "${pageMaker.criteria.page}"/>
				<input type="button" value="Search" class="btn btn-default" onclick="searchCheck(form)" />
				<input type="button" class="btn btn-default" onclick="location.href='write_view'" value="글 쓰기"/>
					</form>
				
			
			</div>
		</div>
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title" ><font style="padding-left:200px;">LIST PAGING</font></h3>
			</div>
				<div class="box-body">
	
			<table class="table table-bordered" style="width:800px; "align="center"; >
				<thaed>
				<tr>
					<th width="50px" style="text-align:center;">번호</th>
					<th style="text-align:center;">제목</th>
					<th width="180px" style="text-align:center;">날짜</th>
					<th width="100px" style="text-align:center;">글쓴이</th>
					<th width="50px" style="text-align:center;">조회</th>
				</tr>
				</thaed>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.bId}</td>
							<td><c:forEach begin="1" end="${dto.bIndent}">[답변]</c:forEach>
								<a href='content_view${pageMaker.makeSearch(pageMaker.criteria.page)}&bId=${dto.bId}'>${dto.bTitle}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${dto.bDate}" /></td>
							<td style="text-align:center;">${dto.bName}</td>
							<td style="text-align:right;">${dto.bHit}</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>

		<div class="box-footer">
			<div class="text-center">
				<ul class="pagination">

					<c:if test="${pageMaker.prev}">
						<li><a href="listPage${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.criteria.page == idx?'class =active':''}"/>>
							<a href="listPage?page=${idx}">${idx}</a>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="listPage?page=${pageMaker.endPage +1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
		</div>
	</section>


</body>
</html>