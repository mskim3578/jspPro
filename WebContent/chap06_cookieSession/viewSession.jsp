<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<html><head><title>���� ��� ����</title></head><body>
<%
	Enumeration attr = session.getAttributeNames();
	while(attr.hasMoreElements()){
		String attrName = (String)attr.nextElement();
		String attrValue = (String)session.getAttribute(attrName);
		out.println("������ �Ӽ����� " + attrName + " �̰� ");
		out.println("������ �Ӽ����� " + attrValue + "�̴�.<br>");
	}%></body></html>
