<%@ page contentType="text/html;charset=euc-kr"%>

<h2>If-else�� ���� - �����ϴ� �� ����</h2>

<%
    request.setCharacterEncoding("euc-kr");
   String name = request.getParameter("name");
   String color = request.getParameter("color");
  
   String selectColor = "";
  
   if (color.equals("blue")) {
 	   selectColor = "�Ķ���";
   } else if (color.equals("green")) {
	   selectColor = "�ʷϻ�";
    }else if (color.equals("red")){
       selectColor = "������";
   }else{
       selectColor = "��Ÿ��";
    }
%>

<%=name%>���� ������ ���� <%=selectColor%>�Դϴ�.<p>
������ ��:<br>
<img src="sub/<%=color + ".jpg"%>" border="0">