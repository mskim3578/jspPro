<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/join.jsp
   1. 파라미터 정보를 Member 객체 저장
   2. Member 객체에 저장된 내용을 db 저장하기 => model 부분
   3. 성공 : loginForm.jsp 페이지 이동
            실패 : joinForm.jsp 페이지 이동 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%=mem %>
