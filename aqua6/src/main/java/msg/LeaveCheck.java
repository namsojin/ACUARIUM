package msg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LeaveCheck")
public class LeaveCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public LeaveCheck() {
        super();
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int result =  Integer.parseInt(request.getParameter("result"));
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = response.getWriter();
      
      if(result == 1) {  //문의 성공(이메일 보내진 것)
         writer.println("<script>alert('문의가 접수되셨습니다.'); history.go(-1);</script>");
         writer.close();
      }
      else {  //문의 실패(이메일 안 보내짐)
         writer.println("<script>alert('문의 접수가 실패되셨습니다. 다시 시도해주세요.'); history.go(-1);</script>");
         writer.close();
      }
   }

}