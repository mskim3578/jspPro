<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- Page ���þ� (Directive)
   <%@ page �Ӽ�1=�Ӽ���1 ... %>
        �Ӽ����� �̿��Ͽ� ������������ Ư¡�� �����ϴ� ��� 
        language="java" : �⺻ ��� ����. ���� ����. 
        contentType : html �����̰�, euc-kr ���ڵ� ������� ����
        import : ���Ǵ� Ŭ������ ��Ű���� ����. ������ ������ ������ �Ӽ�
 --%>    
<%-- /WebContent/pagedirectiveex1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Page Directive(���þ� )����</title>
</head>
<body>
<%
   Date today = new Date();
   SimpleDateFormat df = 
		    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
���� �Ͻ� : <%=df.format(today) %>
</body>
</html>