<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/chap07_jdbc/member/joinForm.jsp --%>
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>ȸ������ȭ��</title>
<link rel="stylesheet" href="/jspPro/chap07_jdbc/css/main.css">
<script type="text/javascript">
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("pictureimgForm.jsp", "", op);	}</script></head><body>
	<form action="/jspPro/chap08_member/join.jsp" name="f" method="post">
		<input type="hidden" name="picture" value="">
		<table>
			<caption>MODEL1���� ������ ȸ������</caption>
			<tr><td rowspan="4" valign="bottom"><img src="" width="100"
					height="120" id="pic"><br> <font size="1"><a
						href="win_upload()">�������</a></font></td>
				<td>���̵�</td>
				<td><input type="text" name="id"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>�̸�</td>	<td><input type="text" name="name"></td></tr>
			<tr><td>����</td>	<td><input type="radio" name="gender" value="1" checked>��
					<input type="radio" name="gender" value="2">��</td></tr>
			<tr><td>��ȭ��ȣ</td><td colspan="2"><input type="text" name="tel"></td></tr>
			<tr><td>�̸���</td><td colspan="2"><input type="text" name="email"></td></tr>
			<tr><td colspan="3"><input type="submit" value="ȸ������"></td></tr>
		</table>	</form></body></html>