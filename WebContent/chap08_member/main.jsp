<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/main.jsp 
   1. �α��� �Ŀ� �������� ������.
      => �α��� ���� Ȯ�� => �α��λ��°� �ƴ� ���, loginForm.jsp�� ������ �̵��ϱ�
--%>
<%
   String login = (String)session.getAttribute("login");
   if(login == null || login.trim().equals("")) {
	   response.sendRedirect("loginForm.jsp");
   } else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���α׷�</title>
</head>
<body>
<h3><%=login %> ȸ���� �ݰ����ϴ�.</h3>
<h3><a href="logout.jsp">�α׾ƿ�</a></h3>
<h3><a href="info.jsp?id=<%=login%>">ȸ����������</a></h3>
<% if(login.equals("admin")) { %>
<h3><a href="list.jsp">ȸ����Ϻ���</a></h3>
<% } %>
</body>
</html>
<% }%>