<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=euc-kr"%>

<h2>ǥ���� ����1 - �迭�� ���� ���</h2>
<%!
	String str[] = {"JSP��","����","���","�ִ�"};//�迭�� �ʱ�ȭ ���� ����ϸ� �迭�� ����, �޸��Ҵ�,�ʱⰪ������ �ѹ��� �� �� �ִ�.
%>
<table border="1" width="250">
    <tr><th>�迭�� ÷��</th><th>�迭�� ����</th></tr>
<% for (int i=0;i<str.length;i++){	//�迭��.length�� �迭�� ����� ���� �����Ѵ�%>
    <tr><td><%=i%></td><td><%=str[i]%></td>
    </tr>
<%}%></table>

<h2>ǥ���� ����2 - �⺻������Ÿ�� �� ���۷���Ÿ�����</h2>
<%
    Date date = new Date();
    int var1 = 10;
	int var2 = var1 > 8 ? 20 : 10; //���� �����ڸ� ����ؼ� var2������ ���� ���� 	
%>

���� ��¥�� �ð�: <%=date.toString()%><p>
���� var1�� ��: <%=var1%><p>
���� var2�� ��: <%=var2%><p>
���� var1 + ����var2�� ��: <%=var1+var2%><p>

<%--WrapperŬ����: �⺻������Ÿ���� ��ü�� ��ȯ�ؾ��� ��� ���--%>
���� var1�� ��(WrapperŬ���� ���): <%=(new Integer(var1)).toString()%><p>