package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberDeleteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward=new ActionForward();
      forward.setPath("/memberList.do");
      forward.setRedirect(false);
      MemberVO mvo=new MemberVO();
      MemberDAO mdao=new MemberDAO();
      
      if(request.getParameter("userId") != null) {  //관리자영역에서 회원탈퇴
         mvo.setMemberId(request.getParameter("userId"));
         
         if(mdao.delete(mvo)) {
            System.out.println("  로그 회원삭제 완료:"+mvo.getMemberId());
         } else {
            System.out.println("  로그: 회원삭제 실패");
         }
      }
      else { //회원영역에서 회원탈퇴
         mvo.setMemberId(request.getParameter("memberId"));
         if(mdao.delete(mvo)) {
            System.out.println("  로그 회원삭제 완료:"+mvo.getMemberId());
            forward.setPath("main.jsp");
            forward.setRedirect(true);
            request.getSession().invalidate();  //로그인된 session 제거
         } else {
            System.out.println("  로그: 회원삭제 실패");

         }
      }
      
      return forward;
   }

}