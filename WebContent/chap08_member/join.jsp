<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp
   1. �Ķ���� ������ Member ��ü ����
   2. Member ��ü�� ����� ������ db �����ϱ� => model �κ�
   3. ���� : loginForm.jsp ������ �̵�
            ���� : joinForm.jsp ������ �̵� 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%
  MemberDao dao = new MemberDao();
  // 1 �� ��� : insert ����
  // 0 �� ��� : insert ����
  int result = dao.insert(mem);
  String msg = null;
  String url = null;
  if(result > 0) {  //���Լ���
	 msg = mem.getName() + "���� ȸ�� ������ �Ϸ� �Ǿ����ϴ�.";
     url = "loginForm.jsp";
  } else {
	 msg = "ȸ�� ���� ����.";
	 url = "joinForm.jsp";
  }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>