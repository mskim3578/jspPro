<%@ page contentType="text/html; charset=euc-kr" %>
<%
String id = request.getParameter("id");
String passwd  = request.getParameter("passwd");
	
  if(id.equals(passwd)){
	    session.setAttribute("id",id);
		response.sendRedirect("sessionLoginConfirm.jsp");
  } else { %>
	<script>
	  alert("���̵� ���� �ʽ��ϴ�..");
      history.go(-1);
	</script>
<%}	%>

<%=id %> �α��� �Ǿ����ϴ�


