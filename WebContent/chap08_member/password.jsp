<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp
   1. �α��� ������. �ٸ� ������� ��й�ȣ ���� �Ұ�.
            �α׾ƿ������� ���. �α��� �ϼ���. �޼��� ���. 
            opener �������� loginForm.jsp ������ �̵�.
                         ���������� �ݱ�
   2. pass, chgpass �Ķ���� �� ����
   3. pass ��й�ȣ�� db�� ����� ��й�ȣ�� Ʋ����
            ��й�ȣ ���� �޼��� ���. passwordForm.jsp ������ �̵�
   4. pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
            ��й�ȣ ����. opener �������� info.jsp ������ �̵�.
                                   ���������� �ݱ�
 --%>
<%
    String login = (String)session.getAttribute("login");
	boolean  opener = false;
	String msg = null;
	String url = null;
	if(login == null || login.trim().equals("")) {  //�α׾ƿ� ����
		opener = true;
		msg = "�α��� �ϼ���.";
		url = "loginForm.jsp";
	} else { //�α��� ����
	  String pass= request.getParameter("pass");
	  String chgpass= request.getParameter("chgpass");
	  MemberDao dao = new MemberDao();
	  Member mem = dao.selectOne(login);
	  if(pass.equals(mem.getPass())) {//�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ���
		  if(dao.updatePass(login,chgpass) > 0) {
			  msg="��й�ȣ�� ����Ǿ����ϴ�.";
			  url = "info.jsp?id=" + login;
			  opener = true;
		  } else {
			  msg="��й�ȣ�� ����� ������ �߻� �Ǿ����ϴ�.";
			  url = "passwordForm.jsp";
		  }
	  } else {  //�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� �ٸ� ���
		  msg="��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
		  url = "passwordForm.jsp";
	  }
	}
%>     
<script>
   alert("<%=msg%>");
   <% if(opener) { %>
      opener.location.href="<%=url%>";
      self.close(); //���� window �ݱ�.
   <% }  else { %>
       location.href="<%=url%>";
   <% } %>
</script>
