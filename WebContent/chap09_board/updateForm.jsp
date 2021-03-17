<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/updateForm.jsp
    1. num ���� �Խù��� ��ȸȭ�� ȭ�� ����ϱ� 
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
Board board = new BoardDao().selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/chap07_jdbc/css/main.css">
<script>
	function file_delete() {
		file_desc = document.getElementById("file_desc")
		document.f.file2.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
	<form action="update.jsp" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="num" value="<%=board.getNum()%>">
		<input type="hidden" name="file2"
			value="<%=((board.getFile1() == null) ? "" : board.getFile1())%>">
		<table>
			<caption>MODEL1 �Խ��� ���� ȭ��</caption>
			<tr>
				<td>�۾���</td>
				<td><input type="text" name="name" value="<%=board.getName()%>"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="subject"
					value="<%=board.getSubject()%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="15" name="content"><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<td>÷������</td>
				<td style="text-align: left">
					<%
						if (board.getFile1() != null && (!board.getFile1().equals(""))) {
					%>
					<div id="file_desc"><%=board.getFile1()%>
						<a href="javascript:file_delete()">[÷������ ����]</a>
					</div> <%
 	}
 %> <input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[�Խù�����]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>