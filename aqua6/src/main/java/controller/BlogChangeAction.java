package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BlogChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/blog-change.jsp");  //Board 수정 페이지로 이동
		forward.setRedirect(false);
		BoardVO bvo=new BoardVO();
		BoardDAO bdao=new BoardDAO();
		
		bvo.setBoardNum(Integer.parseInt(request.getParameter("bNum")));
		System.out.println("  로그 BoardNum:"+bvo.getBoardNum());
		request.setAttribute("board", bdao.selectOne(bvo));
		return forward;
	}
}
