<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap02/currentTime.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
<%
   Calendar c = Calendar.getInstance();
   int hour = c.get(Calendar.HOUR_OF_DAY);
   int min = c.get(Calendar.MINUTE);
   int sec = c.get(Calendar.SECOND);
%>
<h1>현재시간은 <%=hour %>시 <%=min %> 분 <%=sec %>초  입니다.</h1>
</body>
</html>