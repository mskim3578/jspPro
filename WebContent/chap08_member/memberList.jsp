<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/list.jsp
   1. �α׾ƿ����� : �α��� �ϼ���. �޼��� ���. loginForm.jsp ������ �̵�
   2. �α��λ���  
           �Ϲݻ���� �α���: �����ڸ� ��ȸ���� �޼��� ���. main.jsp ������ �̵�          
                �����ڷα��� : ��� ���
   3. ȸ�� ����� ��ȸ�Ͽ� ȭ�鿡 ����ϱ�       
--%>
<%   String login = (String)session.getAttribute("login");
   if(login == null || login.trim().equals("")) {%>
<script>    alert("�����ڷ� �α��� �ϼ���");   location.href="loginForm.jsp";</script>
<% } else if (!login.equals("admin"))  { %>
<script> 
    alert("�����ڸ� ������ �ŷ� �Դϴ�.");    location.href="main.jsp";
</script>
<% } else {  //�����ڸ� ��ȸ
	List<Member> list = new MemberDao().list();%>
<!DOCTYPE html><html><head><meta charset="EUC-KR"><title>ȸ�� ��� ��ȸ</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/chap07_jdbc/css/main.css"></head>
<script type="text/javascript">
   function del(id) {
	    if (confirm(id + "���� Ż���Ͻðڽ��ϱ�?")) {
	       location.href="delete.jsp?id="+id;	     	
	    }   }  </script>
<body><table>

 <caption>MODEL1 ȸ�� ���</caption>
 <tr><th>����</th><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>&nbsp;</th></tr>
 <% for(Member m : list) {  %>
  <tr><td>
  <img src="img/<%=m.getPicture() %>" width="30" height="32"></td>
  <td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td><td><%=m.getName() %></td>
  <td><%=m.getGender()==1?"����":"����" %></td><td><%=m.getTel() %></td>
  <td><a href="updateForm.jsp?id=<%=m.getId()%>">[����]</a>
  <% if(!m.getId().equals("admin")) {%>
<%--       <a href="delete.jsp?id=<%=m.getId()%>">[����Ż��]</a> --%>
     <a href="javascript:del('<%=m.getId()%>')">[����Ż��]</a>
   <% } %>    
  </td></tr><% } %></table></body></html><% } %>  
  