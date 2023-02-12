package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/memberList.do");// 멤버 수정 페이지(관리자영역)
		forward.setRedirect(false);
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();

		mvo.setMemberPw(request.getParameter("password"));
		mvo.setMemberName(request.getParameter("userName"));
		mvo.setBirthyy(request.getParameter("userYear")); // 생년월일
		mvo.setBirthmm(request.getParameter("userMonth"));
		mvo.setBirthdd(request.getParameter("userDay"));
		mvo.setMemberPhone(request.getParameter("userPhoneNum"));
		mvo.setMemberEmail(request.getParameter("userEmail"));
		mvo.setMemberAthu(request.getParameter("userAthu"));
		mvo.setMemberId(request.getParameter("userId"));

		mdao.update(mvo);

		return forward;
	}

}
