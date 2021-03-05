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
   error 페이지 처리 방법. 우선순위
   1. 해당 페이지별로 <%@ page errorPage="..jsp" %>로 설정
   2. web.xml에 예외 객체별로 처리
   3. web.xml에 예외 코드별로 처리
   4. 톰캣(웹애플리케이션서버, 웹컨테이너)에서 기본으로 제공되는 에러 페이지. 에러처리 안함
 --%>
 