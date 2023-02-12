package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LeaveMsgMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/leavemsg.jsp"); //1:1문의 페이지로 이동
		forward.setRedirect(false);
		return forward;
	}

}
