package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BlogUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/blogList.do"); //수정 후 관리자 공지사항목록 페이지로 이동
		forward.setRedirect(false);		 //사용자에게 보여지지 않는( 요청만 처리하는 페이지 )
		BoardVO bvo = new BoardVO();
		BoardDAO bdao = new BoardDAO();

		bvo.setBoardTitle(request.getParameter("title"));
		bvo.setBoardContent(request.getParameter("content"));
		bvo.setMemberId(request.getParameter("writer"));
		bvo.setBoardImg(request.getParameter("img"));
		bvo.setBoardNum(Integer.parseInt(request.getParameter("bNum")));
		
		bdao.update(bvo);

		return forward;
	}

}
