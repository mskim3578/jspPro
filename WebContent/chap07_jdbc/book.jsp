<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap07_jdbc/book.jsp
          writer,title,content  �Ķ���� 3�� --%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="book" class="chap07.Book" />
<%-- <jsp:useBean /> : useBean �׼��±�. chap7.Book Ŭ���� ��üȭ
   �ڹ� :   book = new chap07.Book();   --%>
<jsp:setProperty property="*" name="book"/> 
<%--  <jsp:setProperty .. /> : setProperty �׼��±�
      property="*" : �Ķ�����̸��� ������Ƽ�� �̸��� ���� ���� ����
      name="book" : book ��ü�� ���.
      �ڹ�:
      book.setWriter(request.getParameter('writer'))
      book.setTitle(request.getParameter('title'))
      book.setContent(request.getParameter('content'))
   set ������Ƽ
      setWriter(..) : writer ������Ƽ. --%> 
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>���� ���</title>
<link rel="stylesheet" href="css/main.css">
</head><body><table>
<tr><td>�湮��</td>
    <td><jsp:getProperty property="writer" name="book"/></td>
    <td><%=book.getWriter() %></td>   </tr>
<tr><td>����</td>
    <td><jsp:getProperty property="title" name="book"/></td>
    <td><%=book.getTitle() %></td>   </tr>
<tr><td>����</td>
    <td><jsp:getProperty property="content" name="book"/></td>
    <td><%=book.getContent() %></td>
    </tr></table></body></html>