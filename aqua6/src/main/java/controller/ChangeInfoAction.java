package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class ChangeInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/changeinfo.jsp");  //회원정보수정 페이지로 이동(회원입장)
		forward.setRedirect(false);	
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		
		mvo.setMemberId(request.getParameter("memberId"));
		mdao.selectOne(mvo);
		
		request.setAttribute("member",mdao.selectOne(mvo) );
		
		return forward;
	}
}
