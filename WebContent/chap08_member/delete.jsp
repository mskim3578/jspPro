<%@page import="model.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp
   1. �α׾ƿ����� : �α��� �ϼ���. �޼��� ��� �� loginForm.jsp ������ �̵�
   2. �α��� ����
      - �Ϲݻ����
         (1) ��й�ȣ ���� 
         (2) -��й�ȣ�� ��ġ�ϸ�
               db���� id �ش��ϴ� ���� ��������.
                                   �α׾ƿ� ��,
                 'Ż�� ����' �޽��� ���, loginForm.jsp ������ �̵�
               db���� id �ش��ϴ� ���� ��������.
                 "���� ����" �޼��� ���. main.jsp ������ �̵�            
             -��й�ȣ ����ġ
              "��й�ȣ ����ġ" �޼��� ���. deleteForm.jsp ������ �̵�            
      - ������
         (1) db���� �ش� id ���� ����
              db���� id �ش��ϴ� ���� ��������.
               "���� ����" �޼��� ���. list.jsp ������ �̵�            
         (2) Ż�� ���� �޼��� ���. list.jsp ������ �̵�     
--%>
<%
   String login = (String)session.getAttribute("login");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String msg = null;   String url = null;
   if(login == null || login.trim().equals("")) {      msg= "�α����� �ʿ��մϴ�.";      url = "loginForm.jsp";
   } else if(!login.equals(id) && !login.equals("admin")) {
	  msg= "���θ� Ż�� �����մϴ�.";	  url = "main.jsp";
   } else if (id.equals("admin")) {	  msg= "�����ڴ� Ż���� �� �����ϴ�.";	  url = "main.jsp";
   } else {	   MemberDao dao = new MemberDao();
	   Member mem = dao.selectOne(id);
	   if(login.equals("admin") || pass.equals(mem.getPass())) {
			int result = dao.delete(id);    
			if(result > 0) {  //���� ����
				if(login.equals("admin")) {  //�������� ���
					msg =id + " ����ڸ� ���� Ż�� ����";	    url = "memberList.jsp";
				} else {  //�Ϲݻ������ ���
					msg =id + "����  ȸ�� Ż�� �Ϸ�Ǿ����ϴ�."; url = "loginForm.jsp";  session.invalidate();
				}
			} else {  //���� ����
				msg = id +"���� Ż��� ���� �߻�.";	if(login.equals("admin")) {  //�������� ���
					url = "memberList.jsp";	} else {  //�Ϲݻ������ ���
					url = "main.jsp";}}
	   } else {		   msg = id + "���� �����ȣ�� Ʋ���ϴ�.";   url = "deleteForm.jsp?id=" + id;   }   }
%>
<script >
   alert("<%=msg%>");
   location.href="<%=url%>"; 
</script>
         