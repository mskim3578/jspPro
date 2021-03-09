<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp 
   1. id �Ķ���Ͱ� �����ϱ�
   2. �α��λ��� ����.
            �α׾ƿ����� : �α����� �ʿ��մϴ�. �޼��� ����ϰ�, loginForm.jsp ������ �̵�
   3. �α��� ����
      3-1 : id �Ķ���������� login ������ ���ؼ� �ٸ���
                         �ڽ��� ������ ��ȸ �����մϴ�. �޼��� ���. main.jsp ������ �̵�.
      3-2 : id �Ķ���������� login ������ ���Ͽ� �ٸ����� login��  �������� ���
                     ��   id�� �α��� ������ ���� ��� ȭ�鿡 ���� ����ϱ�
           MemberDao().selectOne(id) �޼��带 �̿��Ͽ� db ���� ��ȸ�ϱ�
    4. �����ڷ� �α��� �� ��쳪, �ڽ����� ��ȸ�� ȭ�鿡 ����ϱ�                                             
--%>
<%
    String login = (String)session.getAttribute("login");
    String id = request.getParameter("id");
    if(login == null || login.trim().equals("")) {
%>
   <script type="text/javascript">
       alert("�α����� �ʿ��մϴ�.�α��� �ϼ���");
       location.href="loginForm.jsp";
   </script>
<%    	
    } else if (!login.equals("admin") && !login.equals(id)){
%>    	
   <script type="text/javascript">
       alert("�ڽ��� ������ ��ȸ�� �����մϴ�.");
       location.href="main.jsp";
   </script>
<%  } else {
    Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����������</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css" >
</head>
<body>
<table>
  <caption>MODEL1 ȸ�� ���� ����</caption>
  <tr><td rowspan="6">
     <img src="img/<%=mem.getPicture() %>" width="100" height="120">
  </td><td>���̵�</td><td><%=mem.getId() %></td></tr>
  <tr><td>�̸�</td><td><%=mem.getName() %></td></tr>
  <tr><td>����</td><td><%=mem.getGender()==1?"��":"��" %></td></tr>
  <tr><td>��ȭ</td><td><%=mem.getTel() %></td></tr>
  <tr><td>�̸���</td><td><%=mem.getEmail() %></td></tr>
  <tr><td colspan="2">
    <a href="updateForm.jsp?id=<%=mem.getId()%>">[����]</a>
    <% if (!id.equals("admin")) {%>
    <a href="deleteForm.jsp?id=<%=mem.getId()%>">[Ż��]</a>
    <% } %></td></tr>
</table></body></html>
<% } %>