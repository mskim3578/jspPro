<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp
   1. 로그아웃상태 : 로그인 하세요. 메세지 출력 후 loginForm.jsp 페이지 이동
   2. 로그인 상태
      - 일반사용자
         (1) 비밀번호 검증 
         (2) -비밀번호가 일치하면
               db에서 id 해당하는 정보 삭제성공.
                                   로그아웃 후,
                 '탈퇴 성공' 메시지 출력, loginForm.jsp 페이지 이동
               db에서 id 해당하는 정보 삭제실패.
                 "삭제 실패" 메세지 출력. main.jsp 페이지 이동            
             -비밀번호 불일치
              "비밀번호 불일치" 메세지 출력. deleteForm.jsp 페이지 이동            
      - 관리자
         (1) db에서 해당 id 정보 삭제
              db에서 id 해당하는 정보 삭제실패.
               "삭제 실패" 메세지 출력. list.jsp 페이지 이동            
         (2) 탈퇴 성공 메서지 출력. list.jsp 페이지 이동     
--%>
<%
   String login = (String)session.getAttribute("login");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String msg = null;   String url = null;
   if(login == null || login.trim().equals("")) {      msg= "로그인이 필요합니다.";      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "본인만 탈퇴가 가능합니다.";	  url = "main.jsp";
   } else if (id.equals("admin")) {	  msg= "관리자는 탈퇴할 수 없습니다.";	  url = "main.jsp";
   } else {	   MemberDao dao = new MemberDao();
	   Member mem = dao.selectOne(id);
	   if(login.equals("admin") || pass.equals(mem.getPass())) {
			int result = dao.delete(id);    
			if(result > 0) {  //삭제 성공
				if(login.equals("admin")) {  //관리자인 경우
					msg =id + " 사용자를 강제 탈퇴 성공";	    url = "list.jsp";
				} else {  //일반사용자인 경우
					msg =id + "님의  회원 탈퇴가 완료되었습니다."; url = "loginForm.jsp";  session.invalidate();
				}
			} else {  //삭제 실패
				msg = id +"님의 탈퇴시 오류 발생.";	if(login.equals("admin")) {  //관리자인 경우
					url = "list.jsp";	} else {  //일반사용자인 경우
					url = "main.jsp";}}
	   } else {		   msg = id + "님의 비빌번호가 틀립니다.";   url = "deleteForm.jsp?id=" + id;   }   }
%>
<script >
   alert("<%=msg%>");
   location.href="<%=url%>"; 
</script>
         