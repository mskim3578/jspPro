
<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp
   1. ��� �Ķ���͸� Member ��ü�� �����ϱ�
   2. �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ������ 3������ ����.
           �ٸ��� ��й�ȣ ���� �޼��� ���. updateForm.jsp ������ �̵�
   3. 1���� ��ü�� db�� �����ϱ�. int update(Member)
           ����� 1�̻��̸� : ���� ���� �޼��� ���. main.jsp ������ �̵�
           0���ϸ� : ���� ���� �޼��� ���. updateForm.jsp ������ �̵�   
--%>    <% request.setCharacterEncoding("euc-kr");
   String login = (String)session.getAttribute("login");%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%   String msg = null;   String url = null;
  	 MemberDao dao = new MemberDao();
  	 Member dbMem =  dao.selectOne(mem.getId());
   if(!login.equals("admin") && !mem.getPass().equals(dbMem.getPass())) {
	   msg = "��й�ȣ�� Ʋ���ϴ�. Ȯ�� �� �ٽ� �ŷ� �ϼ���.";
	   url = "updateForm.jsp?id=" + mem.getId();
   } else {
	 if(dao.update(mem) > 0) {
		 msg = mem.getId() + "���� ȸ�� ������ �����Ǿ����ϴ�.";
		 url = "main.jsp";
	 } else {
		 msg = mem.getId() + "�� ȸ�� ���� ���� ����.";
		 url = "updateForm.jsp?id=" + mem.getId();
	 }   }
%>
<script type="text/javascript">	
alert("<%=msg%>");
	location.href="<%=url%>";
</script>