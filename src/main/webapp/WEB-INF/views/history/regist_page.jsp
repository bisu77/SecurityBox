<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="stylesheet" type="text/css" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/buttonstyle.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<title>Insert title here</title>
</head>
<body>
		<form method="post" action="regist_history">
			<table style="margin-left: auto; margin-right: auto;width: 30%" align="center" border="0" >
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
					<FONT COLOR="#0D3EE4" size="3"><b>택배 회사</b></FONT></td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
						 <select id="select_com" name="company">
						 <option value="우체국택배" selected="selected">우체국택배</option>
						 <option value="CJ대한통운">CJ대한통운</option>
						 <option value="한진택배">한진택배</option>
						 <option value="로젠택배">로젠택배</option>
						 <option value="현대택배">현대택배</option>
						 <option value="KGB택배">KGB택배</option>
						 <option value="일양로지스">일양로지스</option>
						 <option value="EMS">EMS</option>
						 <option value="기타">기타</option>						 
						 </select>
					</td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
					<FONT COLOR="#0D3EE4" size="3" ><b>운송장번호</b></FONT></td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
						 <input type="text" class="input-input input-normal"
						name="trans_num" placeholder="운송장번호를 입력하세요" />
					</td>
				</tr>
				<tr height="20">
				</tr>
				<tr>
					<td align="center" height="30" bgcolor="#FFFFFF" >
					<input type="submit" class="button blue submit" value="등록하기"/>
					</td>
				</tr>
			</table>
		</form>
	
</body>
</html>