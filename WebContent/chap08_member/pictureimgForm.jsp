<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/pictureimgForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ���</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css" >
</head>
<body>
<h3>���ε�</h3>
<form action="pictureimg.jsp" method="post" enctype="multipart/form-data">
  <input type="file" name="picture">
  <input type="submit" value="�������">
</form>
</body>
</html>