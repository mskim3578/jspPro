<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp
   1. num,pass �Ķ���͸� ������ ����.
   2. �Էµ� ��й�ȣ�� db ��й�ȣ ����
            Ʋ����� : ��й�ȣ ���� �޽��� ���, deleteForm.jsp ������ �̵�
   3. �Խù� ����.
           ���� ���� : ���� ���� �޽��� ���, list.jsp ������ �̵�
           ���� ���� : ���� ���� �޽��� ���, info.jsp ������ �̵�              
 --%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass"); //�Էµ� ��й�ȣ
String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�!";String url = "deleteForm.jsp?num=" + num;
BoardDao dao = new BoardDao();Board board = dao.selectOne(num);
//board.getPass() : db�� ����� ��й�ȣ
if (pass.equals(board.getPass())) { 
	if (dao.delete(num)) {		msg = "�Խñ��� ���������� �����Ͽ����ϴ�.";		url = "list.jsp";
	} else {		msg = "�Խñ��� �����ϴµ� �����Ͽ����ϴ�!";
		url = "info.jsp?num=" + num;
	}}
%>
<script>
  alert("<%=msg%>");  location.href="<%=url%>";</script>
  
  
  
  