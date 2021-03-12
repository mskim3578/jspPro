
<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/memberInfo.jsp 
   1. id 파라미터값 저장하기
   2. 로그아웃상태 : 로그인이 필요합니다. 메세지 출력하고, loginForm.jsp 페이지 이동
   3. 로그인 상태  
      3-1 : id 파라미터정보와 login 정보를 비교해서 다르면 자신의 정보만 조회 가능합니다. 메세지 출력. main.jsp 페이지 이동.
      3-2 : id 파라미터정보와 login 정보를 비교하여 다르지만 login이  관리자인 경우
                     이거나 id와 로그인 정보가 같은 경우 화면에 내용 출력하기
           MemberDao().selectOne(id) 메서드를 이용하여 db 내용 조회하기
    4. 관리자로 로그인 한 경우나, 자신정보 조회시 화면에 출력하기 --%>
<%  String login = (String)session.getAttribute("login");
    String id = request.getParameter("id");
    if(login == null || login.trim().equals("")) {   //2. logout 경우
%>
   <script type="text/javascript">
       alert("로그인이 필요합니다.로그인 하세요");
       location.href="<%=request.getContextPath()%>/chap08_member/loginForm.jsp";
   </script>
<%     } else if (!login.equals("admin") && !login.equals(id)){   //3-1 login 경우
%>    	
   <script type="text/javascript">
       alert("자신의 정보만 조회가 가능합니다.");
       location.href="<%=request.getContextPath()%>/chap08_member/main.jsp";
   </script>
<%  } else {  // login admin or id==login
    Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보보기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/chap07_jdbc/css/main.css" >
</head>
<body>
<table>
  <caption>MODEL1 회원 정보 보기</caption>
  <tr><td rowspan="6">
     <img src="img/<%=mem.getPicture() %>" width="100" height="120">
  </td><td>아이디</td><td><%=mem.getId() %></td></tr>
  <tr><td>이름</td><td><%=mem.getName() %></td></tr>
  <tr><td>성별</td><td><%=mem.getGender()==1?"남":"여" %></td></tr>
  <tr><td>전화</td><td><%=mem.getTel() %></td></tr>
  <tr><td>이메일</td><td><%=mem.getEmail() %></td></tr>
  <tr><td colspan="2">
    <a href="<%=request.getContextPath()%>/chap08_member/updateForm.jsp?id=<%=mem.getId()%>">[수정]</a>
    <% if (!id.equals("admin")) {%>
    <a href="<%=request.getContextPath()%>/chap08_member/deleteForm.jsp?id=<%=mem.getId()%>">[탈퇴]</a>
    <% } %></td></tr>
</table></body></html>
<% } %>

