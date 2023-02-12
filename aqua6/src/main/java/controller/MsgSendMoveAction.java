package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import msg.MsgDAO;
import msg.MsgVO;

public class MsgSendMoveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/msg-send.jsp"); // 문의 내역 보기 (관리자영역)
		forward.setRedirect(false);
		
		MsgVO msgvo=new MsgVO();
		MsgDAO msgdao=new MsgDAO();
		
		msgvo.setMsgNum(Integer.parseInt(request.getParameter("msgNum"))); 
		request.setAttribute("msg", msgdao.selectOne(msgvo));
		System.out.println(msgdao.selectOne(msgvo));
		
		
		return forward;
	}

}
