package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
import common.Paging;

public class BlogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/blog-list.jsp"); //blog-list.jsp 이동
		forward.setRedirect(false);			
		BoardVO bvo = new BoardVO();
		BoardDAO bdao = new BoardDAO();
			
		//페이징 처리 
		Paging paging = new Paging();

		paging.setDisplayRow(10); //공지글목록 출력은 row 수 = 10으로 세팅
		bvo.setDisplayRow(10);

		int page = 1;  //page 초기값=1 세팅
		if (request.getParameter("page") != null) {  //사용자가 보고싶은 페이지 번호 클릭했을경우
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println("로그 클릭한 페이지 번호: "+page);
		}
		else {  //초기화면
			System.out.println("로그: 목록초기화면 page:"+page);
		}

		paging.setCurpage(page); //현재페이지
		
		paging.setStartNum(page); //처음글목록번호
		bvo.setStartNum(page);    
		
		paging.setEndNum(page);   //끝글목록번호
		bvo.setEndNum(page);
		
		int count = bdao.getAllCount();  //총 목록 개수
		paging.setTotalCount(count);
		System.out.println("총목록수 : "+count);

		request.setAttribute("paging", paging); //페이징처리
	
		request.setAttribute("bList", bdao.selectAll(bvo)); //글목록출력

		return forward;
	}

}
