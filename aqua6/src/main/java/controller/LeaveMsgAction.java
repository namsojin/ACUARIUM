package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.EmailDAO;
import email.EmailVO;
import msg.MsgDAO;
import msg.MsgVO;

public class LeaveMsgAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/leavemsg.jsp");  //leavemsg.jsp로 이동
		forward.setRedirect(false);
		MsgVO msgvo = new MsgVO();
		MsgDAO msgdao = new MsgDAO();

		msgvo.setMsgEmail(request.getParameter("email"));
		msgvo.setMsgContent(request.getParameter("content"));
		msgvo.setMsgTitle(request.getParameter("title"));

		msgdao.insert(msgvo);  //문의내역추가
		
		//email API----
		System.out.println("  로그: 이메일API 실행됨");
				
		EmailVO evo = new EmailVO();
		EmailDAO edao = new EmailDAO();
				
		evo.setEmailAddress(request.getParameter("email"));   //사용자 메일 주소
		
		evo.setEmailTitle(request.getParameter("title"));     //메일 제목
		
		String content ="<문의내역>"+request.getParameter("content")   //내용
				          + "문의가 접수되셨습니다." 
				          + "문의 순서대로 답장 드리오니 기다려주세요 :D" ;
		evo.setEmailContent(content); //메일 내용
		
				
		int result = edao.email(evo);  //이메일 보내기
		request.setAttribute("result",result);
		
		
		return forward;
	}

}
