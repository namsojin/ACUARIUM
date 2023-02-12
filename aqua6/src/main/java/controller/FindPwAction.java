package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class FindPwAction implements Action {
	 // 인증번호로 폰 본인 건지 확인 후, 
    // 폰 번호로 비밀번호 찾기 버튼 누르면 
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ActionForward forward = new ActionForward();
      forward.setPath("/PwFind"); //PwFind 서블릿으로 이동
      forward.setRedirect(false);
     
      MemberVO mvo = new MemberVO();
      
      mvo.setMemberName(request.getParameter("memberName"));
      mvo.setMemberId(request.getParameter("memberId"));
      mvo.setMemberPhone(request.getParameter("memberPhone"));
          
      // mdao에서 해당하는 멤버 가져오고, 아이디만 전달
      MemberDAO mdao = new MemberDAO();
      MemberVO member = mdao.selectOne(mvo);
      
      if(member == null) {
         System.out.println("  로그: 해당 member 없음");
     
      }else { //member 있다면
         forward.setPath("/changePw.jsp"); 
         request.setAttribute("member", member);
     
      }
      
      return forward;
   }

}