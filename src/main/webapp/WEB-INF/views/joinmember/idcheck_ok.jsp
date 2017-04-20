<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<title>Insert title here</title>
</head>
<%String id = (String)request.getAttribute("id");%>

<body>
	<table width = "270" border = "0" cellspacing = "0" cellpadding = "5" style="margin-top:auto;">
<tr >
      <td align = "center"><p>
            입력하신 ${id}는 사용하실 수 있는 ID입니다.
            <input type = "button" value = "사용하기" onclick = "setid()">
      </td>
</tr>
</table>
</body>
</html>
<script language = "javascript">

      function setid()
      {
            opener.document.userinfo.id.value = "<%=id%>";
            window.opener.document.userinfo.check_id.value = "true";
            self.close();
      }

</script>
	
</body>
</html>