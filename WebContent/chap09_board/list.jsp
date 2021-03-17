<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
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
   int limit = 3; //한페이지에 출력할 게시물 건수
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount();//등록된 전체 게시물의 건수
   
   List<Board> list = dao.list(pageNum,limit, boardcount); //화면에 출력된 게시물 데이터
   //13 --->   boardcount/limit : 4 + 1
   int maxpage = (int)(boardcount/limit)+(boardcount%limit==0?0:1);
 
   int bottomLine=3;
   // page 1,2,3 : 1,   4,5,6: 2
   int startpage = 1 + (pageNum - 1) / bottomLine * bottomLine;
   int endpage = startpage + bottomLine - 1;
   
  
   if(endpage > maxpage) endpage = maxpage;
   
   
   int boardnum = boardcount - (pageNum -1) * limit;
 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/chap07_jdbc/css/main.css">
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
      <% if (startpage <= bottomLine)  {%>[이전] <% } else { %>
      <a href="list.jsp?pageNum=<%=startpage - bottomLine%>">[이전]</a><% } %>
      <% for (int a=startpage; a<=endpage;a++) { %>
         <% if (a==pageNum) {%>[<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% } 
       } %>
      <% if (endpage >= maxpage) {%>[다음] <% } else { %>
      <a href="list.jsp?pageNum=<%=startpage + bottomLine%>">[다음]</a><% } %>
    </td></tr>  
    
     <%-- 페이지 처리 부분  --%>
<% } //else 구문 종료 %>


  <tr><td colspan="5" style="text-align:right">
     <a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table></body></html>