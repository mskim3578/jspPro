<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp
   1. 로그아웃상태 : 로그인 하세요. 메세지 출력. loginForm.jsp 페이지 이동
   2. 로그인상태  
           일반사용자 로그인: 관리자만 조회가능 메세지 출력. main.jsp 페이지 이동          
                관리자로그인 : 목록 출력
   3. 회원 목록을 조회하여 화면에 출력하기       
--%>
<%
   String login = (String)session.getAttribute("login");
   if(login == null || login.trim().equals("")) {
%>
<script>
    alert("관리자로 로그인 하세요");
    location.href="loginForm.jsp";
</script>
<% } else if (!login.equals("admin"))  { %>
<script>
    alert("관리자만 가능한 거래 입니다.");
    location.href="main.jsp";
</script>
<% } else {  //관리자만 조회
	List<Member> list = new MemberDao().list();
%>
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css"></head>
<script type="text/javascript">
   function del(id) {
	    if (confirm(id + "님을 탈퇴하시겠습니까?")) {
	       location.href="delete.jsp?id="+id;	    	
	    }
   }
</script>
<body>
<table>
 <caption>MODEL1 회원 목록</caption>
 <tr><th>사진</th><th>아이디</th><th>이름</th><th>성별</th><th>전화</th><th>&nbsp;</th></tr>
 <% for(Member m : list) {%>
  <tr><td>
  <img src="img/<%=m.getPicture() %>" width="30" height="32"></td>
  <td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td><td><%=m.getName() %></td>
  <td><%=m.getGender()==1?"남자":"여자" %></td><td><%=m.getTel() %></td>
  <td><a href="updateForm.jsp?id=<%=m.getId()%>">[수정]</a>
  <% if(!m.getId().equals("admin")) {%>
<%--       <a href="delete.jsp?id=<%=m.getId()%>">[강제탈퇴]</a> --%>
     <a href="javascript:del('<%=m.getId()%>')">[강제탈퇴]</a>
   <% } %>    
  </td></tr><% } %></table></body></html><% } %>
  
  
  