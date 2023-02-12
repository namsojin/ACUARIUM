package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MyUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/mypage.jsp"); // 회원정보수정해서 마이페이지로 보냄
		forward.setRedirect(false);
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();

		String go = request.getParameter("go");
		System.out.println("로그 go: "+go);
		mvo.setMemberId(request.getParameter("userId"));
		mvo.setMemberPw(request.getParameter("password"));
		mvo.setMemberName(request.getParameter("userName"));
		mvo.setBirthyy(request.getParameter("userYear"));
		mvo.setBirthmm(request.getParameter("userMonth"));
		mvo.setBirthdd(request.getParameter("userDay"));
		mvo.setMemberPhone(request.getParameter("userPhone"));
		mvo.setMemberEmail(request.getParameter("userEmail"));
		mvo.setMemberAthu(request.getParameter("memberAthu"));
		mdao.update(mvo);
		
		if(go.equals("1")) {  //회원정보변경할경우,
			request.setAttribute("member", mdao.selectOne(mvo));
		}
		else if(go.equals("2")) { //비밀번호찾기할 경우,
			System.out.println("로그 비번찾기");
			forward.setPath("/login.jsp");
			
		}
		
		return forward;
	}

}
