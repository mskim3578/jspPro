<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%= Integer.parseInt("bbb") %>
</body>
</html>
<%--
   error ������ ó�� ���. �켱����
   1. �ش� ���������� <%@ page errorPage="..jsp" %>�� ����
   2. web.xml�� ���� ��ü���� ó��
   3. web.xml�� ���� �ڵ庰�� ó��
   4. ��Ĺ(�����ø����̼Ǽ���, �������̳�)���� �⺻���� �����Ǵ� ���� ������. ����ó�� ����
 --%>
 