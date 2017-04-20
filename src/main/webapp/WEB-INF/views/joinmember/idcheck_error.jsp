<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head><title>ID 중복확인</title></head>
<body>
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
      <td height = "39">${id}는이미 사용중인 아이디입니다.</td>
</tr>
</table>
<form name = "checkForm" method = "post" action = "idcheck">
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
      <td  align = "center">
            다른 아이디를 사용하세요.<p>
            <input type = "text" size = "10" maxlength = "12" name = "id">
            <input type = "submit" value = "중복확인">
      </td>
</tr>
</table>
</form>
</body>
</html>
