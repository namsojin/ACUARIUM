package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginMoveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/login.jsp"); //로그인 버튼 누르면 로그인 화면으로 넘어감
		forward.setRedirect(false);
		
		return forward;
	}

}
