<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>�ʱ�ȭ �Ķ���� �о����</title></head>
<body>

�ʱ�ȭ�Ķ���� ���:
<ul>
<%
    Enumeration eNum = application.getInitParameterNames();
    while (eNum.hasMoreElements()) {
        String initParamName = (String)eNum.nextElement();
%>
<li><%= initParamName %> = 
    <%= application.getInitParameter(initParamName) %>
<%
    }
%>
</ul>
</body>
</html>