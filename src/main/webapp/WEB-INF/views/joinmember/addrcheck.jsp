<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>


<%@ page 
 import="java.io.*"
 import="javax.xml.parsers.DocumentBuilder"
 import="javax.xml.parsers.DocumentBuilderFactory"
 import="javax.xml.parsers.ParserConfigurationException"

import="org.w3c.dom.Document"
import="org.w3c.dom.NamedNodeMap"
import="org.w3c.dom.NodeList"
import="org.xml.sax.SAXException"
%>
<%
String dong=request.getParameter("temp_dong");
if(dong!=null)
dong=dong.replaceAll(" ","");
System.out.println(dong);%>

<head>
 <title>xml_sample</title>
<script language="javascript">
 function PutAddr(zip,addr)
 {
	 window.opener.document.userinfo.zipcode.value = zip;
	 window.opener.document.userinfo.addr1.value = addr;
	 window.opener.document.userinfo.check_addr.value = "true";

	 self.close();
	 
	 
 }
 </script>
</head>
<body>

<form method="post" action="addrcheck">
<input type="text" name="temp_dong"/>
<input type="submit" value="�˻��ϱ�"/>
</form>
<hr>
     <%
List<String> pt=new ArrayList<String>(); 
List<String> ar=new ArrayList<String>();
 try{
 // DocumentBuilder ��ü�� �����ϰ� xml ������ �Ľ� �� �±� �̸����� ������ �о�´�
 String url="http://biz.epost.go.kr/KpostPortal/openapi?regkey=d61569e536dfc7fa11474277291779&target=postNew&query=";
 String furl=url+dong;
 DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder(); 
 Document doc = docBuilder.parse(furl);
 NodeList aList = doc.getDocumentElement().getElementsByTagName("address");
 NodeList pList = doc.getDocumentElement().getElementsByTagName("postcd");
 
 // �±� �̸����� �о�� �������� ���ϴ� ���� ���
 for(int i = 0; i < aList.getLength(); i++){
     pt.add(pList.item(i).getFirstChild().getNodeValue());
     ar.add(aList.item(i).getFirstChild().getNodeValue());
     
  }    
 }catch (ParserConfigurationException e) {
     e.printStackTrace();
   } catch (SAXException e) {
    e.printStackTrace();
   } catch (IOException e) {
    e.printStackTrace();
   }
if(pt.isEmpty())
{%>
	�˸��� ��/��/��  �Ǵ� ���θ� �ּҸ�  �˻����ּ���.
	
<%}
else
{
	%>
	<table style="width:auto;">
	<tr>
	<td style="width:30%;">�����ȣ</td>
	<td style="width:60%;">�ּ�</td>
	</tr>
	<%
	for(int i=0;i<pt.size();i++){		
		%>
		
		<tr>
		<td><a href="Javascript:PutAddr('<%=pt.get(i) %>','<%=ar.get(i) %>')"><%=pt.get(i) %></a></td>
		<td><a href="Javascript:PutAddr('<%=pt.get(i) %>','<%=ar.get(i) %>')"><%=ar.get(i) %></a></td>
		</tr>
		
		<%
	}
}
 
%>
     </body>
 </html>


