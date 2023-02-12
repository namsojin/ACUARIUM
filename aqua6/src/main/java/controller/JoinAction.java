package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class JoinAction implements Action { // 회원가입 페이지

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("/login.jsp"); //회원가입 후 로그인 페이지로 이동
      forward.setRedirect(false);
      MemberDAO mdao = new MemberDAO();
      MemberVO mvo = new MemberVO();

      mvo.setMemberId(request.getParameter("userId"));
      mvo.setMemberPw(request.getParameter("password"));
      mvo.setMemberName(request.getParameter("userName"));
      mvo.setBirthyy(request.getParameter("userYear"));
      mvo.setBirthmm(request.getParameter("userMonth"));
      mvo.setBirthdd(request.getParameter("userDay"));
      mvo.setMemberPhone(request.getParameter("userPhoneNum"));
      mvo.setMemberEmail(request.getParameter("userEmail"));
      mvo.setMemberAthu(request.getParameter("Athu"));

      mdao.insert(mvo);
      
      return forward;
   }

}