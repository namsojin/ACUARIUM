package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setPath("findIdResult.jsp"); //findIdResult.jsp 로 이동
		forward.setRedirect(false);
		System.out.println("sb 생성 전");
		StringBuffer sb = new StringBuffer();

		sb.append(request.getParameter("memberPhone"));
		System.out.println("sb 생성 후" + sb);
		
		MemberVO mvo = new MemberVO();
		mvo.setMemberPhone(sb.toString());
		MemberDAO mdao = new MemberDAO();

		MemberVO member = mdao.selectOne(mvo); // id, 이름이 담긴 멤버
		
		request.setAttribute("memberName", member.getMemberName());
		request.setAttribute("memberId", member.getMemberId());
		return forward;
	}

}
