<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
int num1 = Integer.parseInt(request.getParameter("num1"));//�Էµȼ���
int num2 = Integer.parseInt(request.getParameter("num2"));
String kind = request.getParameter("kind");//0:��ü��, 1:Ȧ����, 2:¦����  
double result=0;
switch(kind) {
  case "+" : result=num1+num2; break;
  case "-" : result=num1-num2; break;
  case "*" : result=num1*num2; break;
  case "/" : result=(double)num1/(double)num2; break;
}
%>
<h1><%=num1%><%=kind%><%=num2%>=<%=result %></h1>
</body>
</html>