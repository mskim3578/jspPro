<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/request2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�հ� ��� ����</title>
</head>
<body>
<%
//http://localhost:8080/chap5/request2.jsp?num=10&kind=2
  int num = Integer.parseInt(request.getParameter("num"));//�Էµȼ���
  String kind = request.getParameter("kind");//0:��ü��, 1:Ȧ����, 2:¦����  
  int sum=0;
  for(int i=1;i<=num;i++) {
	  switch(kind) {
	  case "0" : sum += i;break;
	  case "1" : if(i%2==1)  sum += i;break;
	  case "2" : if(i%2==0)  sum += i;break;
	  }
  }
%>
<h2><%=num %>������ <%= (kind.equals("0")?"��ü":
	 (kind.equals("1")?"Ȧ��":"¦��")) %>�� : <%=sum %></h2>
</body>
</html>