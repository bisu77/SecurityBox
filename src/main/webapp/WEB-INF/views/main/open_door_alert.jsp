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
<body>
	<script type="text/javascript">
		var result = '${result}';

		if (result == 'success') {
			alert("문이 열렸습니다.");
			window.location.href("open_door");
		} else {
			alert("작업에 실패 하였습니다. 다시 시도해 주세요.");
			window.location.href("open_door");
		}
	</script>

</body>
</html>