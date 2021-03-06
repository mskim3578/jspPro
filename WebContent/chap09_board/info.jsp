<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/info.jsp : 게시물 상세 보기
  1. num 파라미터를 이용하여 db에 해당 게시물 조회
     Board board = new BoardDao().selectOne(num); 
  2. 조회수 증가시키기.  readcnt+1
      new BoardDao().readcntadd(num);
  3. 1번에서 조회한 게시물데이터를 화면에 출력하기    
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));//파라미터값읽기
BoardDao dao = new BoardDao();
Board board = dao.selectOne(num); //게시물 조회
dao.readcntadd(num); //조회건수증가
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세보기</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/chap07_jdbc/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 게시물 상세 보기</caption>
		<tr>
			<td width="20%">글쓴이</td>
			<td width="80%" style="text-align: left"><%=board.getName()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td style="text-align: left"><%=board.getSubject()%></td>
		</tr>
		<tr>
			<td>내용</td>
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
			<td>첨부파일</td>
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
			<td colspan="2"><a href="replyForm.jsp?num=<%=num%>">[답변]</a> <a
				href="updateForm.jsp?num=<%=num%>">[수정]</a> <a
				href="deleteForm.jsp?num=<%=num%>">[삭제]</a> <a href="list.jsp">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>