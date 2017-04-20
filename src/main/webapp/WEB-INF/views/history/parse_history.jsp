<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.allin.web.java.ParseHistory"%>
<%@ page import="com.allin.web.java.HistoryInfo"%>

<%@ page import="org.json.simple.parser.ParseException"%>
<%@ page import="java.io.IOException"%>



<link rel="stylesheet" type="text/css" href="/web/resources/css/inputstyle.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/buttonstyle.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<script>
function del_history(invoice)
{
	 window.location.href="del_history?trans_num="+invoice;
}
function update_history(invoice)
{
	 window.location.href="update_history?trans_num="+invoice;

}
function go_back()
{
	history.go(-1);
}
</script>


<title>parse_history</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

String temp_company= request.getParameter("company");

String trans_num= request.getParameter("trans_num");
System.out.println(temp_company);


ParseHistory trans_parser= new ParseHistory(temp_company, trans_num);
HistoryInfo trans_item = trans_parser.parser();

if(trans_item==null)
{%>
<table align="center" style="padding-top:30%;">
<tr>
<td colspan="2">배송추적이 불가능한 운송장번호 입니다. 삭제하시겠습니까?</td>
</tr>
<tr height="30">
</tr>
<tr>
<td align="center"><input type="button" class="button blue" value="삭제하기" onclick="del_history('<%=trans_num%>')"/></td>
<td align="center"><input type="button" class="button blue"  value="돌아가기" onclick="go_back()"/></td>
</tr>
</table>

<%
	return;
}
String item = trans_item.getItem();
String invoice = trans_item.getInvoice();
String estimate = trans_item.getEstimate();	
String receiver = trans_item.getReceiver();
String sender = trans_item.getSender();
String receiverAddr = trans_item.getReceiverAddr();
String time = trans_item.getTime();
String where = trans_item.getWhere();
String kind = trans_item.getKind();
String worker_name = trans_item.getWorker_name();
String worker_phone = trans_item.getWorker_phone();
String img_name= trans_item.getImg_name();
String img_url=" ";
System.out.println(img_name);

%>

<table  border="0" align="center">
<tr><td class="font1">상품명<td></tr>
<tr><td><%=item %></td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 도착예정시간 <td></tr>
<tr><td><%=estimate%></td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 택배사/운송장번호 <td></tr>
<tr><td><%=temp_company %>/<%=trans_num%><td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 받는 사람 </td> <td  class="font1"> 보내는 사람 </td></tr>
<tr><td><%=receiver %></td> <td><%=sender %></td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 수령주소 </td></tr>
<tr><td><%=receiverAddr %></td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 현재배송상태 </td></tr>
<tr><td rowspan="2"><img src="/web/resources/img/<%=img_name %>" style="width:120px; height:100px;"/></td><td><%=time %></td></tr>
<tr><td><%=where%> <%=kind%></td></tr>
<tr height="10px"></tr>
<tr><td  class="font1"> 택배기사명 </td><td><%=worker_name%><td></tr>
<tr><td  class="font1"> 택배기사번호 </td><td><%=worker_phone%><td></tr>
<tr height="10px"></tr>
</table>
<table align="center" border="0">
<tr>
<td><input type="button" class="button blue" value="삭제하기" onclick="del_history('<%=trans_num%>')"/></td>
<td><input type="button" class="button blue"  value="배송완료" onclick="update_history('<%=trans_num%>')"/></td>
<td><input type="button" class="button blue"  value="돌아가기" onclick="go_back()"/></td>
</tr>
</table>

	
</body>
</html>
	