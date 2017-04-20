<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head><title>BOX 중복확인</title></head>
<body>
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
      <td height = "39">${boxcode}는 이미 사용중인 박스코드입니다.</td>
</tr>
</table>
<form name = "checkForm" method = "post" action = "boxcheck">
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
      <td  align = "center">
            다른 박스코드를 사용하세요.<p>
            <input type = "text" size = "10" maxlength = "12" name = "box_code">
            <input type = "submit" value = "중복확인">
      </td>
</tr>
</table>
</form>
</body>
</html>
