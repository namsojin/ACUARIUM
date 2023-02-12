package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
import common.Paging;

public class BlogAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/blog.jsp"); // blog.jsp 이동
		forward.setRedirect(false);   
		BoardVO bvo = new BoardVO();
		BoardDAO bdao = new BoardDAO();
		
		//검색어 
		String search = request.getParameter("search");
		bvo.setSearchContent(search);
		request.setAttribute("search", search);
		
		//페이징 처리
		Paging paging = new Paging();
		paging.setDisplayRow(6); //공지글목록 출력은 row 수 = 6으로 세팅
		bvo.setDisplayRow(6);
		
		int page = 1;  //page 초기값=1 세팅
		if (request.getParameter("page") != null) {  //사용자가 보고싶은 페이지 번호 클릭했을경우
			page = Integer.parseInt(request.getParameter("page"));
		}
		else { //초기화면 page==1
			System.out.println("로그: 목록초기화면임");
		}
	
		paging.setCurpage(page); //현재페이지
		paging.setStartNum(page); //처음글목록번호
		bvo.setStartNum(page);    
		paging.setEndNum(page);   //끝글목록번호
		bvo.setEndNum(page);
		
		if(bvo.getSearchContent()==null) { //전체검색일경우, 
			int count = bdao.getAllCount();  //총 목록 개수
			paging.setTotalCount(count);   //총 글 개수 확인되고, prev, next, beginPage, endPage를 계산해줌.
		}
		else {  //단어검색일경우,
			int count = bdao.getSearchCount(bvo);
			paging.setTotalCount(count);
		}
		
		request.setAttribute("paging", paging); //페이징처리
		request.setAttribute("bList", bdao.selectAll(bvo)); //공지글목록출력
		return forward;
	}
     
	
	
	
}
