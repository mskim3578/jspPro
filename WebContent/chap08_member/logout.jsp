<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp
   1. session에 등록된 로그인 정보 제거
   2.  id님 로그아웃되었습니다. 메세지 출력 후
       loginForm.jsp로 페이지 이동하기 
--%>    
<%
   String login = (String)session.getAttribute("login");
   session.removeAttribute("login");
   session.invalidate();
%>
<script>
   alert("<%=login%>님 로그아웃되었습니다.");
   location.href="loginForm.jsp";
</script>