<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp
   1. 모든 파라미터를 Member 객체에 저장하기
   2. 입력된 비밀번호와 db의 비밀번호가 같으면 3번으로 실행.
           다르면 비밀번호 오류 메세지 출력. updateForm.jsp 페이지 이동
   3. 1번의 객체를 db에 수정하기. int update(Member)
           결과가 1이상이면 : 수정 성공 메세지 출력. main.jsp 페이지 이동
           0이하면 : 수정 실패 메세지 출력. updateForm.jsp 페이지 이동   
--%>    
<% request.setCharacterEncoding("euc-kr");
   String login = (String)session.getAttribute("login");
%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%
   String msg = null;
   String url = null;
   MemberDao dao = new MemberDao();
   Member dbMem =  dao.selectOne(mem.getId());
   if(!login.equals("admin") && !mem.getPass().equals(dbMem.getPass())) {
	   msg = "비밀번호가 틀립니다. 확인 후 다시 거래 하세요.";
	   url = "updateForm.jsp?id=" + mem.getId();
   } else {
	 if(dao.update(mem) > 0) {
		 msg = mem.getId() + "님의 회원 정보가 수정되었습니다.";
		 url = "main.jsp";
	 } else {
		 msg = mem.getId() + "님 회원 정보 수정 실패.";
		 url = "updateForm.jsp?id=" + mem.getId();
	 }
   }
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>