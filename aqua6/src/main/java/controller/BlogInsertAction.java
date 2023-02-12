package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BlogInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/blogList.do"); //글추가한후 -> blogList.do실행
		forward.setRedirect(false);
		BoardVO bvo=new BoardVO();
		BoardDAO bdao=new BoardDAO();
		
		bvo.setBoardTitle(request.getParameter("title"));
		bvo.setBoardContent(request.getParameter("content"));
		bvo.setMemberId(request.getParameter("writer"));
		bvo.setBoardImg(request.getParameter("img"));
		
		bdao.insert(bvo);
		request.setAttribute("board", bdao.selectOne(bvo));
		
		return forward;
	}

}
