<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/reply.jsp : ��� ���
   1. �Ķ���� ���� Board ��ü�� �����ϱ�
            �������� : num, ref, reflevel(��), refstep(print)
            �������  : name, pass, subject, content 
   2. ���� ref ���� ����ϴ� �Խù����� refstep ���� 1 ���� ��Ű��
                     1    1    0         0
                     2    2    0         0
                     3    1    1         2
                     4    1    1         1 
                     ========================  print
                     2    2    0         0
                     1    1    0         0
                     4    1    1         1
                     3    1    1         2 
   3. Board ��ü�� db�� insert �ϱ�.
   4. ��� ������ : "�亯��� �Ϸ�"�޽��� ��� ��,  list.jsp�� ������ �̵�
            ��� ���н� : "�亯��Ͻ� �����߻�"�޽��� ��� ��, replyForm.jsp�� ������ �̵��ϱ� 
--%>    1. �Ķ���� ���� Board ��ü�� �����ϱ� --%>
<%	request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="board" class="model.Board" />
<jsp:setProperty name="board" property="*"/>
<%   BoardDao dao = new BoardDao();
   dao.refstepadd(board.getRef(),board.getRefstep()); 
   //3. Board ��ü�� db�� insert �ϱ�.
  String msg = "�亯��Ͻ� �����߻�";
   String url = "replyForm.jsp?num="+board.getNum();
  if(dao.insert(board)) {  	  msg = "�亯��� �Ϸ�"; 
  url = "list.jsp";   }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>