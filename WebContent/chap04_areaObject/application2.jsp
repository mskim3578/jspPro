<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/application2.jsp
   jsp�� 4������ ����
     1.page ����      : �ϳ��ϳ��� jsp ������. pageContext ��ü. 
     2.request ����: �ѹ��� ��û �� ������� ȣ��Ǵ� ��� jsp ������.
                    request ��ü�� ������.
     3.session ���� : ���� ���������� ȣ��Ǵ� ���  jsp ������.
                    session ��ü�� ������. 
     4.application ���� : �����ø����̼ǿ� ���� ��� jsp ������.
                    application ��ü�� ������.
                    �����ø����̼� : chap5 ������Ʈ
                                     �� chap5 ������Ʈ ��� jsp�� ���� application ������.                              

     ������� ��ü���� �Ӽ� ���� �޼��� ����� ������
            �Ӽ���� : setAttribute(Ű(key), ��ü(value))
               setAttribute(String,Object)
            �Ӽ���ȸ  : getAttribute(String)
            �Ӽ�����  : removeAttribute(String)                   
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application �Ӽ� ��ȸ</title>
</head>
<body>
application ��ü�� test �Ӽ��� :<%= application.getAttribute("test") %>
<% application.setAttribute("test", null); %>
</body>
</html>