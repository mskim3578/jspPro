<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap07_member/login.jsp--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="/jspPro/chap07_jdbc/css/main.css">
</head>
<body>
<form action="/jspPro/chap08_member/login.jsp" method="post">
  <table>
     <caption>MODEL1 �α���</caption>
     <tr><th>���̵�</th><td><input type="text" name="id" ></td></tr>
     <tr><th>��й�ȣ</th><td><input type="password" name="pass" ></td></tr>
	 <tr><td colspan="2">
	   <input type="submit" value="�α���">
	   <input type="button" value="ȸ������"
	     onclick="location.href='/jspPro/chap08_member/joinForm.jsp'">
	 </td></tr>
  </table></form></body></html>