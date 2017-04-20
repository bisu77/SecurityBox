<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" href="/web/resources/css/buttonstyle.css">
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>

<script>
parent.document.getElementById("join").className="current_page_itemselected";
parent.document.getElementById("login").className="current_page_item";

function idcheck(userinfo)
{
	if(userinfo.id.value=="")
		{
		alert('아이디를 입력하세요.');
		return;
		}
	url="idcheck?id="+userinfo.id.value;
	open(url,"중복확인","toolbar=no,resizable=no,width=400,height=300,menubar=no, scrollbars=no,location=no,status=no");
}
function boxcheck(userinfo)
{
	if(userinfo.box_code.value=="")
		{
		alert('박스코드를 입력하세요.');
		return;
		}
	url="boxcheck?box_code="+userinfo.box_code.value;
	var top = (window.screen.height-300)/2;
	var left = (window.screen.width-300)/2;
	window.open(url,"중복확인","resizable=no,location=no,toolbar=no, left="+left+", top="+top+", width=300,height=300,menubar=no"+
			"scrollbars=no,status=no");
	
}
function cancle()
{
	parent.location.href="main";
}
function searchAddr(userinfo)
{	
url="addrcheck"
open(url,"주소찾기","resizable=no,location=no,scrollbars=yes,toolbar=no,resizable=no,width=800,height=300,menubar=no");
}



</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body style="height:200px;">
		<form method="post" action="insertMember"  name="userinfo">
			<table
				style=" margin-left: auto; margin-right: auto;width: 30%; margin-top:2%;"
				align="center" border="0 "cellpadding="5">
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="right" nowrap ><h4>					
							<FONT COLOR="#0D3EE4"><b>아&nbsp;&nbsp; 이&nbsp;&nbsp; 디</b></FONT></td>
							<td colspan="3"></h4> <input type="text" name="id" class="input-input input-normal"
						placeholder="아이디를 입력하세요" /></td>
						<td width="20"><input type="button" class="button blue check"  value="중복확인" onclick="idcheck(this.form)"/></td>
				</tr>
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="right" ><h4>
							<FONT COLOR="#0D3EE4"><b>비 밀 번 호</b></FONT></h4></td>
							 <td colspan="3"><input type="password" name="password" class="input-input input-normal"
						placeholder="비밀번호를 입력하세요" /></td>
				</tr>
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="right" nowrap><h4>
							<FONT COLOR="#0D3EE4"><b>이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</b></FONT></h4></td>
					<td colspan="3"><input type="text" name="name" class="input-input input-normal"
						placeholder="이름을 입력하세요" /></td>
				</tr>
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="right" ><h4>
							<FONT COLOR="#0D3EE4"><b>박 스 코 드</b></FONT></h4></td> 
					<td colspan="3"><input type="text" name="box_code" class="input-input input-normal"
						placeholder="박스코드를 입력하세요" /></td>
						<td>
						<input type="button" class="button blue check"  value="중복확인" onclick="boxcheck(this.form)"/>
						</td>
				</tr>
				
				<tr>
					<td height="30" bgcolor="#FFFFFF" align="right" nowrap><h4>
							<FONT COLOR="#0D3EE4"><b>주 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</b></FONT></h4></td>
					<td width="80px"><input type="text" class="input-input input-normal" name="zipcode" 
					placeholder="우편번호" readonly/> </td>
					<td colspan="2"></td>
					<td>
						<input type="button" value="주소찾기" class="button blue check" onclick="searchAddr(this.form)"/></td>					
					</tr>
					<tr>
					<td></td>
					<td colspan="4"> <input type="text" class="input-input input-normal" name="addr1" readonly
						placeholder="주소찾기를 눌러주세요" /></td>
						
				</tr>
				<tr>
				<td></td>
				<td colspan="4">
				<input type="text" class="input-input input-normal" name="addr2" 
					placeholder="나머지 주소"/>
				</tr>	
				<tr height="10">
				</tr>			
				<tr>
				<td align="right">
				</td>
				<td align="right">
				<input type="submit" value="가입하기" class="button blue" />
				</td>
				<td></td>
				<td align="left">
				<input type="button" value="돌아가기" class="button blue" onclick="cancle()"/>
				</td>
				</tr>
				<input type="hidden" name="check_id" value="false"/>
				<input type="hidden" name="check_addr" value="false"/>
				<input type="hidden" name="check_box" value="false"/>
			</table>
		</form>
</body>
</html>