<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp : �Խù� ��� ����
  1. pageNum �Ķ���� ����. pageNum �Ķ���� ������ 1�� ����.
  2. 10���� �Խù� ���.
      => db���� �ش� �������� ��µǴ� �Խù��� ��ȸ. ���� : �ֱ� �Խù� ������
  3. ȭ�鿡 ���.     
--%>
<%
   int pageNum = 1;
   try {
	   pageNum = Integer.parseInt(request.getParameter("pageNum"));
   } catch (NumberFormatException e) {}
   int limit = 3; //���������� ����� �Խù� �Ǽ�
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount();//��ϵ� ��ü �Խù��� �Ǽ�
   
   List<Board> list = dao.list(pageNum,limit, boardcount); //ȭ�鿡 ��µ� �Խù� ������
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
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/chap07_jdbc/css/main.css">
</head>
<body>
<table>
  <caption>MODEL1 �Խ��� ���</caption>
  <% if(boardcount == 0) { //��ϵ� �Խù� ����%>
  <tr><td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
  <% }  else { //��ϵ� �Խù� ���� %>
  <tr><td colspan="5" style="text-align:right">�۰���:<%=boardcount %></td></tr>
  <tr><th width="8%">��ȣ</th><th width="50%">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
      <th width="11%">��ȸ��</th></tr>
<% for(Board b : list) {%>
   <tr><td><%=boardnum-- %></td><td style="text-align: left">
      <% if (b.getFile1() != null && !b.getFile1().trim().equals("")) {%>
      <a href="file/<%=b.getFile1()%>" style="text-decoration: none;">@</a>
      <% } else {%>&nbsp;&nbsp;&nbsp; <%} %>
	  <% if (b.getReflevel() > 0) { 
		   for (int i=1;i<b.getReflevel();i++) {%>
	              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       <%} %>��<%} %>      
       <a href="info.jsp?num=<%=b.getNum()%>" ><%=b.getSubject() %></a>
       </td><td><%=b.getName() %></td><td><%=b.getRegdate() %></td>
       <td><%=b.getReadcnt() %></td></tr>    
  <% } //for ���� ���� %>
  <%-- ������ ó�� �κ�  --%>
  
  
    <tr><td colspan="5">
      <% if (startpage <= bottomLine)  {%>[����] <% } else { %>
      <a href="list.jsp?pageNum=<%=startpage - bottomLine%>">[����]</a><% } %>
      <% for (int a=startpage; a<=endpage;a++) { %>
         <% if (a==pageNum) {%>[<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% } 
       } %>
      <% if (endpage >= maxpage) {%>[����] <% } else { %>
      <a href="list.jsp?pageNum=<%=startpage + bottomLine%>">[����]</a><% } %>
    </td></tr>  
    
     <%-- ������ ó�� �κ�  --%>
<% } //else ���� ���� %>


  <tr><td colspan="5" style="text-align:right">
     <a href="writeForm.jsp">[�۾���]</a></td></tr>
</table></body></html>