
<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%> 
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap09_board/board/write.jsp
   1. �Ķ���� ���� model.Board ��ü ����. 
   2. �Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 +1 ��ϵ� �Խù��� ��ȣ.
      db���� maxnum �� ���ؼ� +1 ������ num �����ϱ�
--%><%
//1. �Ķ���� ���� model.Board ��ü ����. 
  String uploadpath = application.getRealPath("/") +"chap09_board/upfile/";
  int size = 10*1024*1024;
  MultipartRequest multi = new MultipartRequest
		  (request,uploadpath,size,"euc-kr");
  Board board = new Board();
  board.setName(multi.getParameter("name"));
  board.setPass(multi.getParameter("pass"));
  board.setSubject(multi.getParameter("subject"));
  board.setContent(multi.getParameter("content"));
  board.setFile1(multi.getFilesystemName("file1"));
  
 //2. sequence nextval �Է�
 //     db���� maxnum �� ���ؼ� +1 ������ num �����ϱ�
  BoardDao dao = new BoardDao(); 
 //3. board ��ü�� ������ db�� insert �ϱ�
  String msg = "�Խù� ��� ����";
  String url = "writeForm.jsp";
  if(dao.insert(board)) {	  msg = "�Խù� ��� ����";	  url = "list.jsp";  }%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>
