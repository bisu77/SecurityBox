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
					<FONT COLOR="#0D3EE4" size="3"><b>�ù� ȸ��</b></FONT></td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
						 <select id="select_com" name="company">
						 <option value="��ü���ù�" selected="selected">��ü���ù�</option>
						 <option value="CJ�������">CJ�������</option>
						 <option value="�����ù�">�����ù�</option>
						 <option value="�����ù�">�����ù�</option>
						 <option value="�����ù�">�����ù�</option>
						 <option value="KGB�ù�">KGB�ù�</option>
						 <option value="�Ͼ������">�Ͼ������</option>
						 <option value="EMS">EMS</option>
						 <option value="��Ÿ">��Ÿ</option>						 
						 </select>
					</td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
					<FONT COLOR="#0D3EE4" size="3" ><b>������ȣ</b></FONT></td>
				</tr>
				<tr>
					<td height="40" bgcolor="#FFFFFF" align="left">
						 <input type="text" class="input-input input-normal"
						name="trans_num" placeholder="������ȣ�� �Է��ϼ���" />
					</td>
				</tr>
				<tr height="20">
				</tr>
				<tr>
					<td align="center" height="30" bgcolor="#FFFFFF" >
					<input type="submit" class="button blue submit" value="����ϱ�"/>
					</td>
				</tr>
			</table>
		</form>
	
</body>
</html>