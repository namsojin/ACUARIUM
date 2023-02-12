package sms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/Sms")
public class Sms extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
    public Sms() {
        super();
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("  로그: Sms서블릿 실행");
      SmsVO svo = new SmsVO();
      SmsDAO sdao = new SmsDAO();
      MemberVO mvo = new MemberVO();
      MemberDAO mdao = new MemberDAO();
      
      String check = request.getParameter("check");  //check: 수행하고싶은 기능 분기처리위해 사용.
      System.out.println("  로그 check : "+check);
      svo.setMemberPhone(request.getParameter("userPhoneNum"));   //사용자 전화번호 가져오기
      mvo.setMemberPhone(request.getParameter("userPhoneNum"));
      
      MemberVO member = mdao.selectOne(mvo);  //해당 전화번호 가진 member가 있니?
      System.out.println("  로그 member : "+member);
      
      int randNum = 0; 
      
      response.setContentType("application/x-json; charset=UTF-8");  
      
      if(check.equals("1")) {   //아이디 찾기 할 때, 비밀번호 찾기 할 때 사용
         if(member != null) {  //전화번호가 있어. 
            randNum = sdao.sns(svo);  //sns() 통해 randNum값 리턴받아옴.
            System.out.println(" 로그 randNum:"+randNum);
         }
         else if(member == null) {  //전화번호가 없어.
            randNum = 1 ;          
         }
      }
      else if(check.equals("2")) {  //회원가입 할 때 사용
         if(member == null) {  //전화번호가 없어. 
            randNum = sdao.sns(svo);  //sns() 통해 randNum값 리턴받아옴.
            System.out.println(" 로그 randNum:"+randNum);
         }
         else if(member != null) { //전화번호 있어 -> 전화번호중복임
            randNum = 1 ; 
         }
      }
      else if(check.equals("3")) {  //회원정보수정 할 때 사용(changeinfo)
         randNum = sdao.sns(svo);  //sns() 통해 randNum값 리턴받아옴.
         System.out.println(" 로그 randNum:"+randNum);
      }
      
      response.getWriter().write(randNum+"");  //randNum 다시 jsp로.
   }

}