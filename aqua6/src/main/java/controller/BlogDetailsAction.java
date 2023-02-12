package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class BlogDetailsAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("/blog-details.jsp"); //blog-details.jsp 이동
      forward.setRedirect(false);

      BoardVO bvo = new BoardVO();
      BoardDAO bdao = new BoardDAO();

      int boardNum =(Integer.parseInt (request.getParameter("boardNum")));
   
      bvo.setBoardNum(boardNum);
      
      bdao.selectOne(bvo);

      request.setAttribute("board", bdao.selectOne(bvo));

      return forward;
   }

}