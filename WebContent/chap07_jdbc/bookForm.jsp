<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/bookForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �۾���</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<form action="book.jsp" method="post">
 <table>
    <tr><td>�湮��</td>
        <td><input type="text" name="writer"></td></tr>
    <tr><td>����</td>
        <td><input type="text" name="title"></td></tr>
    <tr><td>����</td>
        <td><textarea name="content" rows="5"></textarea></td></tr>
    <tr><td colspan="2" align="center">
    <input type="submit" value="���ϵ��"></td></tr>    
 </table>
</form></body></html>