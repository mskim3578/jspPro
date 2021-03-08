<%@ page contentType="text/html; charset=euc-kr" %>
<%
String id = request.getParameter("id");
String passwd  = request.getParameter("passwd");
	
  if(id.equals(passwd)){
	    session.setAttribute("id",id);
		response.sendRedirect("sessionLoginConfirm.jsp");
  } else { %>
	<script>
	  alert("아이디가 맞지 않습니다..");
      history.go(-1);
	</script>
<%}	%>

<%=id %> 로그인 되었습니다


