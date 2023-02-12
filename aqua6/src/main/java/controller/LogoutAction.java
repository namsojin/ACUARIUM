package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action{ //로그아웃 기능

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("main.jsp"); // 로그아웃 후 메인페이지로 이동
		forward.setRedirect(true);
		
		request.getSession().invalidate();
		
		return forward;
	}

}
