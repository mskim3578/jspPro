<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/join.jsp
   1. �Ķ���� ������ Member ��ü ����
   2. Member ��ü�� ����� ������ db �����ϱ� => model �κ�
   3. ���� : loginForm.jsp ������ �̵�
            ���� : joinForm.jsp ������ �̵� 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>
<%=mem %>
