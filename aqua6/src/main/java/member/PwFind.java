package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *비밀번호 찾기 시, 일치하는 회원이 DB에 없다면 띄울 alert창
 */
@WebServlet("/PwFind")
public class PwFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PwFind() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('존재하지않는 회원입니다. 다시 시도해주세요.'); history.go(-1);</script>");
		
		writer.close();
	}

}
