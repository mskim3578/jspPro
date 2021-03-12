<%@page import="dao.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap07_member/member/login.jsp
   1. id, pass 파라미터 저장
   2. db에서 id 에 해당하는 데이터를 읽어서 Member 전달받기 
   3. 결과분석 
      Member객체가 null 인경우 :   아이디를 확인하세요 메세지 출력. --->loginForm.jsp 페이지 이동  
      Member객체가 null이 아닌 경우 :
                  화면에서 입력된 비밀번호와 db 비밀번호 검증
            같은경우 : 로그인 성공. ----->        main.jsp 페이지 이동
            다른 경우 : 비밀번호 확인하세요 ---->   loginForm.jsp로 페이지 이동     --%>
<% String id = request.getParameter("id"); //입력된 id값
   String pass = request.getParameter("pass"); //입력된 pass 값
   //mem : db에 저장된 회원정보 저장
   Member mem = new MemberDao().selectOne(id);
   String msg = "아이디를 확인하세요"; 
   String url = "/jspPro/chap08_member/loginForm.jsp";
   if (mem != null) {
	   if(pass.equals(mem.getPass())) {
		   session.setAttribute("login", id);
		   msg = mem.getName() + "님이 로그인 하셨습니다.";
		   url ="/jspPro/chap08_member/main.jsp";
	   } else {		   msg = "비밀번호를 확인 하세요";
	   }   }%>
<script>
  alert("<%=msg%>");
  location.href="<%=url%>";
</script>