package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import msg.MsgDAO;
import msg.MsgVO;


public class MsgDelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/msgList.do"); 
		forward.setRedirect(false);
		MsgVO msgvo=new MsgVO();
		MsgDAO msgdao=new MsgDAO();
		
		msgvo.setMsgNum(Integer.parseInt(request.getParameter("msgNum")));
		msgdao.delete(msgvo);
		System.out.println(msgdao.delete(msgvo));
		
		return forward;
	}
	
	
	
	
	
	

}
