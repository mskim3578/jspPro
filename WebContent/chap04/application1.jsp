<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/application1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application 객체 예제</title>
</head>
<body>
<h3>application 객체는 웹어플리케이션 당 한개의 객체가 할당 됩니다.<br>
현재 chap5 프로젝트의 모든 jsp는 하나의 application 객체를 공유하고 있습니다.<br>
즉 chap5 프로젝트의 모든 jsp는 application 영역에 속한 jsp 페이지 입니다.</h3>
<table border="1" style="border-collapse: collapse;">
   <tr><td>jsp버전</td>
       <td><%=application.getMajorVersion() %>.
       <%=application.getMinorVersion() %></td></tr>
   <tr><td>컨테이너 정보</td>
       <td><%=application.getServerInfo() %></td></tr>
   <tr><td>웹어플리케이션 경로</td>
       <td><%=application.getRealPath("/") %></td></tr>
</table>
<% application.setAttribute("test","application1.jsp에서 설정됨");
   
%>
</body>
</html>