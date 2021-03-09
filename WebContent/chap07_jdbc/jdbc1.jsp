
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html><html><head>
<meta charset="EUC-KR">
<title>jdbc 예제 1</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
   Class.forName("oracle.jdbc.OracleDriver");
   Connection conn = DriverManager.getConnection
		    ("jdbc:oracle:thin:@localhost:1521:xe","kic","1111");
   PreparedStatement pstmt = conn.prepareStatement
		    ("select * from emp");
   ResultSet rs = pstmt.executeQuery();
   ResultSetMetaData rsmt = rs.getMetaData();
%><table><tr>
<% for(int i=1;i<=rsmt.getColumnCount();i++) { %>
    <th><%=rsmt.getColumnName(i) %></th><% } %></tr>
<% while(rs.next()) {%><tr>
 <% for(int i=1;i<=rsmt.getColumnCount();i++) { %>
 <td><%=rs.getString(i) %></td>
 <% } %></tr><% } %>
</table></body></html>