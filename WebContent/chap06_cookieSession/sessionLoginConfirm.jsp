<%@ page contentType="text/html; charset=euc-kr" %>
<% 
	try{
	  if(session.getAttribute("id")==null){
         response.sendRedirect("sessionMemberLogin.jsp");}	
	}catch(Exception e){}%>
<html><head>
<title>������ ����� ������ ȸ������</title>
</head>
<body  >
  <form method="post" action="sessionLogout.jsp">
    <table width="300" border="1" align="center" cellspacing="0" cellpadding="0">
      <tr>      <td align="center" > 
           <b><%= session.getAttribute("id") %></b>���� �α��� �ϼ̽��ϴ�. 
         </td>	  </tr>	  <tr>
		 <td align="center" >
		   <input type="submit" value="�α׾ƿ�">
		 </td>     </tr>    </table>  </form></body></html>