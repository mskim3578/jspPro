<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>초기화 파라미터 읽어오기</title></head>
<body>

초기화파라미터 목록:
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