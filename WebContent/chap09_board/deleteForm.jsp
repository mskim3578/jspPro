<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/deleteForm.jsp --%>    
<!DOCTYPE html><html><head><meta charset="EUC-KR"><title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/chap07_jdbc/css/main.css">
</head><body>
<form action="delete.jsp" name="f" method="post">
<input type="hidden" name="num"  value="<%=request.getParameter("num")%>">
<table>  <caption>MODEL1 �Խñ� ���� ȭ��</caption>
  <tr><td>�Խñۺ�й�ȣ</td>
      <td><input type="password" name="pass"></td></tr>
  <tr><td colspan="2">
     <input type="submit" value="�Խñۻ���"></td></tr>
</table></form></body></html>