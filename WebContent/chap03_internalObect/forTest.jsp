<%@ page contentType="text/html;charset=euc-kr"%>


<% 
    int num = Integer.parseInt(request.getParameter("num"));
    int sum = 0;
    String str="";

	for(int i=1;i<=num;i++){
       if(i<num){
          str += i + " + ";
	   }else{
	      str += i + " = ";
       }
       sum += i; 
    }     	
%>	
<h2>For ���� - 1~<%=num %>���� �� ���ϱ�</h2>    
<%=str%><%=sum%>