<%@ page contentType="text/html; charset=euc-kr" %>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				cookies[i].setMaxAge(0);   //logout
				response.addCookie(cookies[i]);
			}
		}
	}
%>
<script>
    alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href="cookieLoginConfirm.jsp";
</script>


