package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

/**
 * 회원가입시 아이디 중복체크 때 사용되는 alert창
 */
@WebServlet("/joinIdCheck")
public class JoinIdCheckAction extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   //기본 생성자
    public JoinIdCheckAction() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   // type: 'POST',
   // url: 'check',
   //  => check라는 URL을 향해 POST방식으로 요청
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      MemberDAO mdao=new MemberDAO();
      MemberVO mvo=new MemberVO();
      mvo.setMemberId(request.getParameter("userId")); 
      System.out.println("로그 아이디:"+request.getParameter("userId"));
      MemberVO member=mdao.selectOne(mvo);
      System.out.println("로그 member:"+member);
      
      if(mvo.getMemberId() != "") {
         if(member==null) {
            response.getWriter().println("1"); // 중복아님. 가입가능
         }
         else {
            response.getWriter().println("-1"); // 중복임. 가입불가능
         }
      }
      else {
         response.getWriter().println("2"); // 공백 불가능
      }
   }

}