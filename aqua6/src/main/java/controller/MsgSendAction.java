package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.EmailDAO;
import email.EmailVO;
import msg.MsgDAO;
import msg.MsgVO;
import msgReply.MsgReplyDAO;
import msgReply.MsgReplyVO;

public class MsgSendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/msg-send.jsp"); // 문의 답변 관리자영역
		forward.setRedirect(false);
		MsgVO msgvo=new MsgVO();
		MsgDAO msgdao=new MsgDAO();
		MsgReplyVO revo=new MsgReplyVO();
		MsgReplyDAO redao=new MsgReplyDAO();
		
		msgvo.setMsgNum(Integer.parseInt(request.getParameter("msgNum")));
		
		request.setAttribute("msg", msgdao.selectOne(msgvo));
				
		revo.setMsgNum(Integer.parseInt(request.getParameter("msgNum")));
		revo.setMemberId(request.getParameter("memberId"));
		revo.setMsgReplyTitle(request.getParameter("msgReplyTitle"));
		revo.setMsgReplyContent(request.getParameter("msgReplyContent"));
		
		request.setAttribute("msgReply", redao.insert(revo));
		
		//email API----
		System.out.println("로그: 이메일API 실행됨");
		
		EmailVO evo = new EmailVO();
		EmailDAO edao = new EmailDAO();
		
		evo.setEmailAddress(request.getParameter("msgEmail"));   //보낼 메일 주소
		
		evo.setEmailTitle(request.getParameter("msgReplyTitle"));     //메일 제목

		evo.setEmailContent(request.getParameter("msgReplyContent")); //메일 내용
		
		int result = edao.email(evo);
		request.setAttribute("email",result);
				
		
        return forward;
		
	}

}
