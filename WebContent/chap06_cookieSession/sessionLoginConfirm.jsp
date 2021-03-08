<%@ page contentType="text/html; charset=euc-kr" %>
<% 
	try{
	  if(session.getAttribute("id")==null){
         response.sendRedirect("sessionMemberLogin.jsp");}	
	}catch(Exception e){}%>
<html><head>
<title>세션을 사용한 간단한 회원인증</title>
</head>
<body  >
  <form method="post" action="sessionLogout.jsp">
    <table width="300" border="1" align="center" cellspacing="0" cellpadding="0">
      <tr>      <td align="center" > 
           <b><%= session.getAttribute("id") %></b>님이 로그인 하셨습니다. 
         </td>	  </tr>	  <tr>
		 <td align="center" >
		   <input type="submit" value="로그아웃">
		 </td>     </tr>    </table>  </form></body></html>