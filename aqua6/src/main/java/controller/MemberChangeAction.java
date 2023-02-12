package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/member-change.jsp"); // 멤버 수정 페이지(관리자영역)
		forward.setRedirect(false);
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		
		mvo.setMemberId(request.getParameter("memberId"));
		request.setAttribute("member", mdao.selectOne(mvo));
		System.out.println("로그 member:"+mdao.selectOne(mvo)); 
		
		return forward;
	}

}
