<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=euc-kr"%>

<h2>표현식 예제1 - 배열의 내용 출력</h2>
<%!
	String str[] = {"JSP가","정말","재미","있다"};//배열의 초기화 블럭을 사용하면 배열의 선언, 메모리할당,초기값설정을 한번에 할 수 있다.
%>
<table border="1" width="250">
    <tr><th>배열의 첨자</th><th>배열의 내용</th></tr>
<% for (int i=0;i<str.length;i++){	//배열명.length는 배열의 요소의 수를 리턴한다%>
    <tr><td><%=i%></td><td><%=str[i]%></td>
    </tr>
<%}%></table>

<h2>표현식 예제2 - 기본데이터타입 및 레퍼런스타입출력</h2>
<%
    Date date = new Date();
    int var1 = 10;
	int var2 = var1 > 8 ? 20 : 10; //조건 연산자를 사용해서 var2변수의 값을 지정 	
%>

현재 날짜와 시간: <%=date.toString()%><p>
변수 var1의 값: <%=var1%><p>
변수 var2의 값: <%=var2%><p>
변수 var1 + 변수var2의 값: <%=var1+var2%><p>

<%--Wrapper클래스: 기본데이터타입을 객체로 변환해야할 경우 사용--%>
변수 var1의 값(Wrapper클래스 사용): <%=(new Integer(var1)).toString()%><p>