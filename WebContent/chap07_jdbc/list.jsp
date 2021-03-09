<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
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
   int limit = 10; //���������� ����� �Խù� �Ǽ�
   BoardDao dao = new BoardDao();
   int boardcount = dao.boardCount();//��ϵ� ��ü �Խù��� �Ǽ�
   List<Board> list = dao.list(pageNum,limit); //ȭ�鿡 ��µ� �Խù� ������
   //��ü �������� ��
   /*
       ��ü �Խù��Ǽ� : 21 => 3������ 
       (double)21/10 =>2.1 + 0.95 => int(3.05) => 3
       
       ��ü �Խù��Ǽ� : 10 => 1������ 
       (double)10/10 =>1.0 + 0.95 => int(1.95) => 1 

       ��ü �Խù��Ǽ� : 101 => 11������ 
       (double)101/10 =>10.1 + 0.95 => int(11.05) => 11 
       
   */
   int maxpage = (int)((double)boardcount/limit + 0.95);
   //ȭ�鿡 ǥ�õ� ��������ȣ. 10���� �������� ǥ��
   /*
       pageNum : 2 => 1������ ����������
      2/10.0 => 0.2 + 0.9 => int(1.1) - 1 => 0 * 10 + 1 => 1������
      
       pageNum : 10 => 1������ ����������
      10/10.0 => 1.0 + 0.9 => int(1.9) - 1 => 0 * 10 + 1 => 1������
      
       pageNum : 11 => 11������ ����������
      11/10.0 => 1.1 + 0.9 => int(2.0) - 1 => 1 * 10 + 1 => 11������
      
       pageNum : 19 => 11������ ����������
      19/10.0 => 1.9 + 0.9 => int(2.8) - 1 => 1 * 10 + 1 => 11������
      */
   int startpage=((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1; //������������ȣ
   int endpage = startpage + 9;  //���������� ��ȣ
   if(endpage > maxpage) endpage = maxpage;
   int boardnum = boardcount - (pageNum -1) * limit;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
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
      <% if (pageNum <= 1) {%>[����] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum - 1%>">[����]</a><% } %>
      <% for (int a=startpage; a<=endpage;a++) {%>
         <% if (a==pageNum) {%>[<%=a %>] <%} else { %>
           <a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
         <% } 
       } %>
      <% if (pageNum >= maxpage) {%>[����] <% } else { %>
      <a href="list.jsp?pageNum=<%=pageNum + 1%>">[����]</a><% } %>
    </td></tr>  
<% } //else ���� ���� %>
  <tr><td colspan="5" style="text-align:right">
     <a href="writeForm.jsp">[�۾���]</a></td></tr>
</table></body></html>