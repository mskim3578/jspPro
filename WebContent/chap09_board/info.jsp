<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/info.jsp : �Խù� �� ����
  1. num �Ķ���͸� �̿��Ͽ� db�� �ش� �Խù� ��ȸ
     Board board = new BoardDao().selectOne(num); 
  2. ��ȸ�� ������Ű��.  readcnt+1
      new BoardDao().readcntadd(num);
  3. 1������ ��ȸ�� �Խù������͸� ȭ�鿡 ����ϱ�    
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));//�Ķ���Ͱ��б�
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num); //�Խù� ��ȸ
dao.readcntadd(num); //��ȸ�Ǽ�����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �󼼺���</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/chap07_jdbc/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 �Խù� �� ����</caption>
		<tr>
			<td width="20%">�۾���</td>
			<td width="80%" style="text-align: left"><%=board.getName()%></td>
		</tr>
		<tr>
			<td>����</td>
			<td style="text-align: left"><%=board.getSubject()%></td>
		</tr>
		<tr>
			<td>����</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr>
						<td
							style="border-width: 0px; vertical-align: top; text-align: left;">
							<%=board.getContent()%></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>÷������</td>
			<td style="text-align: left;">
				<%
					if (board.getFile1() == null || board.getFile1().trim().equals("")) {
				%>
				&nbsp; <%
 	} else {
 %> <a href="file/<%=board.getFile1()%>"><%=board.getFile1()%></a>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><a href="replyForm.jsp?num=<%=num%>">[�亯]</a> <a
				href="updateForm.jsp?num=<%=num%>">[����]</a> <a
				href="deleteForm.jsp?num=<%=num%>">[����]</a> <a href="list.jsp">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>