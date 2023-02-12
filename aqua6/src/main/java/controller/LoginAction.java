package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class LoginAction implements Action { // 로그인 액션

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("/IdCheck"); // IdCheck 서블릿으로 이동
      forward.setRedirect(false);
      MemberVO mvo = new MemberVO();
      MemberDAO mdao = new MemberDAO();
      MemberVO member = null;
      if(request.getParameter("kakao").equals("kakao")) {  //카카오 로그인일 경우
      
         mvo.setMemberName(request.getParameter("memberName"));
         mvo.setMemberId(request.getParameter("userId"));
       
         forward.setPath("/main.do");
         System.out.println("로그 [로그인됨]:" + mvo);
         request.getSession().setAttribute("member", mvo);
      }
      mvo.setMemberId(request.getParameter("userId"));
      mvo.setMemberPw(request.getParameter("password"));
      
      if (mdao.selectOne(mvo) != null) {  //그냥 로그인일 경우
         member = mdao.selectOne(mvo);
         forward.setPath("/main.do");
         System.out.println("로그 [로그인됨]:" + member);
         request.getSession().setAttribute("member", member);
      } else {  //로그인 실패
         System.out.println("  로그: 로그인 실패");
      }

      return forward;
   }

}