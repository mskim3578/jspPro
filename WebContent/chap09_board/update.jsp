<%@page import="dao.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp
  1. �Ķ������������ Board ��ü ����.
  2. ��й�ȣ ����
         ��й�ȣ ��ġ : ��������.
         ��й�ȣ ����ġ : ��й�ȣ ���� �޼��� ����ϰ�, updateForm.jsp�� ������ �̵�
  3. �������� : �������� �޽��� ��� ��  list.jsp ������ �̵�
         ��������   : �������� �޽��� ��� �� updateForm.jsp ������ �̵�         
--%>    
<% //�Ķ���� ���� Board ��ü�� ���� 
   Board board = new Board();
   String uploadpath = application.getRealPath("/") +"chap09_board/upfile/";
  MultipartRequest multi = new MultipartRequest
		                    (request,uploadpath,10*1024*1024,"euc-kr");
   board.setNum(Integer.parseInt(multi.getParameter("num")));
   board.setName(multi.getParameter("name"));
   board.setPass(multi.getParameter("pass"));
   board.setSubject(multi.getParameter("subject"));
   board.setContent(multi.getParameter("content"));
   board.setFile1(multi.getFilesystemName("file1"));
   //������ ÷�������� ������ �߻����� ���� ���
   if(board.getFile1()==null || board.getFile1().equals("")) {
	   board.setFile1(multi.getParameter("file2"));
   }
   //��й�ȣ ����
   BoardDao dao = new BoardDao(); 
   Board dbBoard = dao.selectOne(board.getNum());
   String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
   String url = "updateForm.jsp?num=" + board.getNum();
   if(board.getPass().equals(dbBoard.getPass())) {
	   //�����ϱ�
 	  if(dao.update(board)) {	  msg = "�Խù� ���� �Ϸ�";		  url = "list.jsp";
	  } else {		  msg = "�Խù� ���� ����";	  }
   }%>
<script>
   alert("<%=msg%>");   location.href="<%=url%>";</script>