<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/web/resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">

<title>Insert title here</title>
</head>
<body>
<form action="findpw" method="post">
		<table
			style="margin-left: auto; margin-right: auto;width: 20%"
			align="center" border="0" cellpadding="5">
			<tr>
				<td height="30" bgcolor="#FFFFFF" align="left"><h4>
						<FONT COLOR="#0D3EE4"><b>I D</b></FONT>
					</h4> <input type="text" class="input-input input-normal" name="id"
					placeholder="아이디를 입력하세요" /></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#FFFFFF" align="left"><h4>
						<FONT COLOR="#0D3EE4"><b>이 름</b></FONT>
					</h4> <input type="text" class="input-input input-normal"
					name="name" placeholder="이름을 입력하세요" /></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#FFFFFF" align="left"><h4>
						<FONT COLOR="#0D3EE4"><b>박스코드</b></FONT>
					</h4> <input type="text" class="input-input input-normal"
					name="box_code" placeholder="박스코드를 입력하세요" /></td>
			</tr>
			
			<tr height="20"></tr>

			<tr>
				<td height="30" bgcolor="#FFFFFF" align="center" cellpadding="10"><input
					type="submit" value="비밀번호 찾기" class="button blue" style="width: 100%;" /></td>
			</tr>
			<tr>
		

		</table>
	</form>
	
</body>
</html>