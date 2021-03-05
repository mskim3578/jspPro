<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 Date now = new Date();
 
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
<%=now %>
</body>
</html>