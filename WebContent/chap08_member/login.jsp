<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp
   1. id, pass �Ķ���� ����
   2. db���� id �� �ش��ϴ� �����͸� �о Member ���޹ޱ� 
   3. ����м� 
      Member��ü�� null �ΰ�� : 
                ���̵� Ȯ���ϼ��� �޼��� ���. 
        loginForm.jsp ������ �̵�  
      Member��ü�� null�� �ƴ� ��� :
                  ȭ�鿡�� �Էµ� ��й�ȣ�� db ��й�ȣ ����
            ������� : �α��� ����. main.jsp ������ �̵�
            �ٸ� ��� : ��й�ȣ Ȯ���ϼ���
               loginForm.jsp�� ������ �̵�              
--%>
<%
   String id = request.getParameter("id"); //�Էµ� id��
   String pass = request.getParameter("pass"); //�Էµ� pass ��
   //mem : db�� ����� ȸ������ ����
   Member mem = new MemberDao().selectOne(id);
   String msg = "���̵� Ȯ���ϼ���";
   String url = "loginForm.jsp";
   if (mem != null) {
	   if(pass.equals(mem.getPass())) {
		   session.setAttribute("login", id);
		   msg = mem.getName() + "���� �α��� �ϼ̽��ϴ�.";
		   url ="main.jsp";
	   } else {
		   msg = "��й�ȣ�� Ȯ�� �ϼ���";
	   }
   }
%>
<script>
  alert("<%=msg%>");
  location.href="<%=url%>";
</script>