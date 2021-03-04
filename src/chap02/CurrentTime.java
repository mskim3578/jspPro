package chap02;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//http://localhost:8080/jspPro/chap02/CurrentTime 으로 요청된 경우 현재 서블릿 호출
@WebServlet("/chap02/CurrentTime") //어노테이션으로 요청URL 정의하기
public class CurrentTime extends HttpServlet {
     //요청방식이 Get 방식인 경우 호출되는 메서드
	protected void doGet(HttpServletRequest request, 
			   HttpServletResponse response) 
					   throws ServletException, IOException {
		//request : 요청객체. 클라이언트의 요청 정보를 저장하고 있는 객체
        //response: 응답객체. 클라이언트에 전달 정보를 저장하고 있는 객체	
		//text/html : 문서의 종류 설정하는 방식. MIME 타입 이라고함.
		response.setContentType("text/html; charset=EUC-KR");
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		//목적지가 브라우저인 출력스트림
		PrintWriter out = response.getWriter(); 
		out.println("<html><head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1>현재시간은 " + hour + "시 " + min + "분 " + 
		    sec + "초 입니다.</h1></body></html>");
	}
    //요청방식이 POST 방식인 경우 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
