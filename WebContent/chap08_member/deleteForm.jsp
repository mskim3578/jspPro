<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/deleteForm.jsp --%>    
<!DOCTYPE html>
<html><head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ Ȯ��</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/chap07_jdbc/css/main.css">
</head>
<body>
<form name="f" action="<%=request.getContextPath() %>/chap08_member/delete.jsp" method="post">
<input type="hidden" name="id"  value="<%=request.getParameter("id") %>" >
<table>
   <caption>ȸ�� ���� ��й�ȣ �Է�</caption>
   <tr><td>��й�ȣ</td>
       <td><input type="password" name="pass"></td></tr>
   <tr><td colspan="2"><input type="submit" value="Ż���ϱ�"></td></tr>    
</table></form></body></html>
