<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptDirectiveEx1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP Script(��ũ��Ʈ ����)</title>
</head>
<body>
<h1>Script�� ���� </h1>
<ol>
   <li>��ũ��Ʈ��(Scriptlet) : &lt;% .... %&gt; <br>
       �ڹ� �ҽ��� ����. ������ _jspService() �޼��忡 �����Ǵ� ���� </li>
   <li>ǥ����(Expression) : &lt;%= .... %&gt; <br>
       �ڹ� �ҽ��� ����. ������ �������� ȭ�鿡 ��µ�. �ݵ�� ���� �ʿ���. <br>
       �������� ;�� ���� ����. �ּ��� ������ �ּ��� ������.</li>
   <li>����(Declaration) : &lt;%! .... %&gt; <br>
       �ڹ� �ҽ��� ����. ������ ��� ������, ��� �޼���� �����. ���� ������.</li>
</ol>
<%-- out.println(100 /*������ �ּ�*/) --%>
<%= 100 /*������ �ּ�*/%>
<% String msg = "��ũ��Ʈ ����;";
   for(int i=1;i<=10;i++) { %>
   <%= i + ":" + this.msg + "<br>" /* ������ �ּ��� ������. �������� ; ǥ�� ���� */ %>
<% } %>
<%!
   String msg = "���𹮿��� ����� msg";
   /* String getMsg() {
	   return msg;
   } */
%>  
</body>
</html>