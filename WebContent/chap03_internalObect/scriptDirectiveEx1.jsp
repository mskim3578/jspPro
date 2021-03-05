<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/scriptDirectiveEx1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP Script(스크립트 예제)</title>
</head>
<body>
<h1>Script의 종류 </h1>
<ol>
   <li>스크립트릿(Scriptlet) : &lt;% .... %&gt; <br>
       자바 소스의 영역. 서블릿의 _jspService() 메서드에 생성되는 영역 </li>
   <li>표현식(Expression) : &lt;%= .... %&gt; <br>
       자바 소스의 영역. 내용이 브라우저의 화면에 출력됨. 반드시 값이 필요함. <br>
       마지막에 ;를 찍지 않음. 주석은 여러줄 주석만 가능함.</li>
   <li>선언문(Declaration) : &lt;%! .... %&gt; <br>
       자바 소스의 영역. 서블릿의 멤버 변수나, 멤버 메서드로 선언됨. 거의 사용안함.</li>
</ol>
<%-- out.println(100 /*여러줄 주석*/) --%>
<%= 100 /*여러줄 주석*/%>
<% String msg = "스크립트 예제;";
   for(int i=1;i<=10;i++) { %>
   <%= i + ":" + this.msg + "<br>" /* 여러줄 주석만 가능함. 마지막에 ; 표시 안함 */ %>
<% } %>
<%!
   String msg = "선언문에서 선언된 msg";
   /* String getMsg() {
	   return msg;
   } */
%>  
</body>
</html>