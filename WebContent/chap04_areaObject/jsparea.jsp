<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
  pageContext.setAttribute("page", "page test �Դϴ�");
  request.setAttribute("request", "request test �Դϴ�");
  session.setAttribute("session", "session test �Դϴ�");
  application.setAttribute("application", "application test �Դϴ�");
%>
<%=pageContext.getAttribute("page") %><br>
<%=request.getAttribute("request") %><br>
<%=session.getAttribute("session") %><br>
<%=application.getAttribute("application") %><br>
<jsp:forward page="jsparea2.jsp" />
</body>

</html>