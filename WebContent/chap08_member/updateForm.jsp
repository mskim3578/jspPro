<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/updateForm.jsp
   1. id �Ķ���� 
   2. �α��λ��� ����.
            �α׾ƿ����� : �α����� �ʿ��մϴ�. �޼��� ����ϰ�, loginForm.jsp ������ �̵�
   3. �α��� ����
      3-1 : id �Ķ���������� login ������ ���ؼ� �ٸ���
                         �ڽ��� ������ ���� �����մϴ�. �޼��� ���. info.jsp ������ �̵�.
      3-2 : id �Ķ���������� login ������ ���Ͽ� �ٸ����� login��  �������� ���
                     ��   id�� �α��� ������ ���� ��� ȭ�鿡 ���� ����ϱ�
           MemberDao().selectOne(id) �޼��带 �̿��Ͽ� db ���� ��ȸ�ϱ�
   4. id�� �ش��ϴ� ȸ���� ������ db���� ��ȸ ȭ�� ��� 
--%>    
<%
    String login = (String)session.getAttribute("login");
    String id = request.getParameter("id");
    if(login == null || login.trim().equals("")) {
%>
    <script type="text/javascript">
        alert("�α����� �ʿ��մϴ�.");
        location.href="loginForm.jsp";
    </script>    	
<%  } else if(!login.equals("admin") && !login.equals(id)) { %>
    <script type="text/javascript">
        alert("�ڽ��� ������ ������ �����մϴ�.");
        location.href="info.jsp?id=<%=login%>";
    </script>	
<%  } else {
    Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css" >
<script type="text/javascript">
   function input_check(f) {
<%  if (!login.equals("admin")) {%>	   
	   if(f.pass.value == "") {
		   alert("��й�ȣ�� �Է��ϼ���");
		   f.pass.focus();
		   return false;
	   }
<% } %>	   
	   return true;
   }
   function passchg_winopen() {
	   var op = "width=500, height=230, left=50,top=150";
	   open("passwordForm.jsp","",op);
   }
   
   function win_upload() {
   	var op = "width=500, height=150, left=50, top=150";
   	open("pictureimgForm.jsp","",op);
   }   
</script>
</head>
<body>
<form action="update.jsp" name="f" method="post" 
      onsubmit="return input_check(this)">
  <input type="hidden" name="picture" 
          value="<%=mem.getPicture()%>">
  <table><caption>MODEL1 ȸ�� ���� ����</caption>
    <tr><td rowspan="4" valign="bottom">
      <img src="img/<%=mem.getPicture() %>" 
                         width="100" height="120" id="pic"><br>
      <font size="1"><a href="javascript:win_upload()">��������</a></font>
    </td><td>���̵�</td>
    <td><input type="text" name="id" value="<%=mem.getId()%>" readonly>
    </td></tr>
    <tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
    <tr><td>�̸�</td><td><input type="text" name="name" value="<%=mem.getName()%>"></td></tr>
    <tr><td>����</td>
    <td><input type="radio" name="gender" value="1" 
          <%=mem.getGender()==1?"checked":"" %>>��
    <input type="radio" name="gender" value="2" 
          <%=mem.getGender()==2?"checked":"" %>>��</td></tr>
    <tr><td>��ȭ��ȣ</td>
        <td colspan="2"><input type="text" name="tel" value="<%=mem.getTel()%>"></td></tr>
    <tr><td>�̸���</td>
        <td colspan="2"><input type="text" name="email" value="<%=mem.getEmail()%>"></td></tr>
    <tr><td colspan="3"><input type="submit" value="ȸ������">
    <input type="button" value="��й�ȣ����" 
          onclick="passchg_winopen()">
    </td></tr>    
  </table></form></body></html>
<% } %>  