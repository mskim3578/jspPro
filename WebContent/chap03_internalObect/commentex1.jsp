<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/chap4 ������Ʈ
    /WebContent/commentex1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP �⺻ ����� �ּ� ����</title>
</head>
<body>
<h1>jsp ������ ���� ���Ǵ� �ּ� 3����</h1>
<ol>
  <li>jsp �ּ� : &lt;%-- jsp �ּ�ǥ�� --%&gt;</li>
  <%-- jsp �ּ��Դϴ�. jsp ������������ �������ϴ�. ���������� ������ �ʽ��ϴ�. --%>
  <li>�ڹ� �ּ� :  &lt;%  //java �ּ�ǥ�� %&gt;</li>
  <% //���� �ּ��Դϴ�.
     /* ������ �ּ��Դϴ�. �ڹ� �ּ��� �������� �� �� �ֽ��ϴ�. */
     String msg = "�ּ�����";
  %>
  <li>HTML �ּ� :&lt;!--  HTML �ּ�ǥ�� --&gt;<br>
     JSP ��������, ���������� �ּ��� �ƴմϴ�. �������� �ҽ����⿡�� �� �� �ֽ��ϴ�.
     <!-- <%=msg%> HTML �ּ��Դϴ�. ������ ���� �ּ����� �ν��մϴ�. -->
  </li>
</ol></body></html>