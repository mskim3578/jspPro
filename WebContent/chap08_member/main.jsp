<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/main.jsp 
   1. 로그인 후에 보여지는 페이지.
      => 로그인 여부 확인 => 로그인상태가 아닌 경우, loginForm.jsp로 페이지 이동하기--%>
<%   String login = (String)session.getAttribute("login");
   if(login == null || login.trim().equals("")) {
	   response.sendRedirect("/jspPro/chap08_member/loginForm.jsp");
   } else {%>
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>회원관리 프로그램</title></head><body>
<h3><%=login %> 회원님 반갑습니다.</h3>
<h3><a href="/jspPro/chap08_member/logout.jsp">로그아웃</a></h3>
<h3><a href="/jspPro/chap08_member/memberInfo.jsp?id=<%=login%>">회원정보보기</a></h3>
<% if(login.equals("admin")) { %>
<h3><a href="/jspPro/chap08_member/memberList.jsp">회원목록보기</a></h3>
<% } %></body></html><% }%>