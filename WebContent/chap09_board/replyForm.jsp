<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/replyForm.jsp : �亯�� ���� ȭ��
   1. ������ num�� �Ķ���ͷ� �޴´�.
   2. ������ num,ref,reflevel,refstep ������ ����
   3. �Է� ȭ�� ǥ�� 
--%>
<%
int num = Integer.parseInt(request.getParameter("num"));//�Ķ���Ͱ��б�
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num); //�Խù� ��ȸ%> 
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/chap07_jdbc/css/main.css"></head>
<body><form action="reply.jsp" method="post" name="f">
<%-- ���� ���� :num  ref reflevel  refstep--%>
  <input type="hidden" name="num" value="<%=board.getNum()%>">
  <input type="hidden" name="ref" value="<%=board.getRef()%>" >
  <input type="hidden" name="reflevel" value="<%=board.getReflevel()%>" >
  <input type="hidden" name="refstep" value="<%=board.getRefstep()%>" >
  <table><caption>MODEL1 �Խ��� ��� ���</caption>
  <tr><td>�۾���</td><td><input type="text" name="name"></td></tr>
  <tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
  <tr><td>����</td><td><input type="text" name="subject" 
      value="RE:<%=board.getSubject()%>"></td></tr>
  <tr><td>����</td>
      <td><textarea name="content" rows="15"></textarea></td></tr>
  <tr><td colspan="2">
  <a href="javascript:document.f.submit()">[�亯�۵��]</a></td></tr>    
  </table>
</form>
</body>
</html>