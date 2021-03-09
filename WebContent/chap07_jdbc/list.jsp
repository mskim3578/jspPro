<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp : 게시물 목록 보기
  1. pageNum 파라미터 존재. pageNum 파라미터 없으면 1로 설정.
  2. 10건의 게시물 출력.
      => db에서 해당 페이지에 출력되는 게시물만 조회. 순서 : 최근 게시물 순으로
  3. 화면에 출력.     
--%>
<%
   int pageNum = 1;
   try {
	   pageNum = Integer.parseInt(request.getParameter("pageNum"));
   } catch (NumberFormatException e) {}
   int limit = 10; //한페이지에 출력할 게시물 건수
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount();//등록된 전체 게시물의 건수
   List<Board> list = dao.list(pageNum,limit); //화면에 출력된 게시물 데이터
   //전체 페이지의 수
   /*
       전체 게시물건수 : 21 => 3페이지 
       (double)21/10 =>2.1 + 0.95 => int(3.05) => 3
       
       전체 게시물건수 : 10 => 1페이지 
       (double)10/10 =>1.0 + 0.95 => int(1.95) => 1 

       전체 게시물건수 : 101 => 11페이지 
       (double)101/10 =>10.1 + 0.95 => int(11.05) => 11 
       
   */
   int maxpage = (int)((double)boardcount/limit + 0.95);
   //화면에 표시될 페이지번호. 10개의 페이지만 표시
   /*
       pageNum : 2 => 1페이지 시작페이지
      2/10.0 => 0.2 + 0.9 => int(1.1) - 1 => 0 * 10 + 1 => 1페이지
      
       pageNum : 10 => 1페이지 시작페이지
      10/10.0 => 1.0 + 0.9 => int(1.9) - 1 => 0 * 10 + 1 => 1페이지
      
       pageNum : 11 => 11페이지 시작페이지
      11/10.0 => 1.1 + 0.9 => int(2.0) - 1 => 1 * 10 + 1 => 11페이지
      
       pageNum : 19 => 11페이지 시작페이지
      19/10.0 => 1.9 + 0.9 => int(2.8) - 1 => 1 * 10 + 1 => 11페이지
      */
   int startpage=((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1; //시작페이지번호
   int endpage = startpage + 9;  //종료페이지 번호
   if(endpage > maxpage) endpage = maxpage;
   int boardnum = boardcount - (pageNum -1) * limit;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
<table>
  <caption>MODEL1 게시판 목록</caption>
  <% if(boardcount == 0) { //등록된 게시물 없음%>
  <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
  <% }  else { //등록된 게시물 존재 %>
  <tr><td colspan="5" style="text-align:right">글개수:<%=boardcount %></td></tr>
  <tr><th width="8%">번호</th><th width="50%">제목</th>
      <th width="14%">작성자</th><th width="17%">등록일</th>
      <th width="11%">조회수</th></tr>
<% for(Board b : list) {%>
   <tr><td><%=boardnum-- %></td><td style="text-align: left">
      <% if (b.getFile1() != null && !b.getFile1().trim().equals("")) {%>
      <a href="file/<%=b.getFile1()%>" style="text-decoration: none;">@</a>
      <% } else {%>&nbsp;&nbsp;&nbsp; <%} %>
	  <% if (b.getReflevel() > 0) { 
		   for (int i=1;i<b.getReflevel();i++) {%>
	              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       <%} %>└<%} %>      
       <a href="info.jsp?num=<%=b.getNum()%>" ><%=b.getSubject() %></a>
       </td><td><%=b.getName() %></td><td><%=b.getRegdate() %></td>
       <td><%=b.getReadcnt() %></td></tr>    
  <% } //for 구문 종료 %>
  <%-- 페이지 처리 부분  --%>
    <tr><td colspan="5">
      <% if (pageNum <= 1) {%>[이전] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum - 1%>">[이전]</a><% } %>
      <% for (int a=startpage; a<=endpage;a++) {%>
         <% if (a==pageNum) {%>[<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% } 
       } %>
      <% if (pageNum >= maxpage) {%>[다음] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum + 1%>">[다음]</a><% } %>
    </td></tr>  
<% } //else 구문 종료 %>
  <tr><td colspan="5" style="text-align:right">
     <a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table></body></html>