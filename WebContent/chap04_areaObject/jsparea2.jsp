<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=pageContext.getAttribute("page") %><br>
<%=request.getAttribute("request") %><br>
<%=session.getAttribute("session") %><br>
<%=application.getAttribute("application") %><br>
</body>

</html>