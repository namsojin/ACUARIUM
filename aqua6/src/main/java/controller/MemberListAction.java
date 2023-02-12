package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import member.MemberDAO;
import member.MemberVO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		forward.setPath("/member-list.jsp"); // 회원정보 목록(관리자영역)
		forward.setRedirect(false);
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		//---페이징 처리 
		int page = 1;  //page 초기값=1 세팅
		if (request.getParameter("page") != null) {  //사용자가 보고싶은 페이지 번호 클릭했을경우
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println("로그 클릭한 페이지 번호: "+page);
		}
		else {
			System.out.println("  로그 초기화면:"+page);
		}
		
		Paging paging = new Paging();
		
		paging.setDisplayRow(10); //회원목록 출력은 row 수 = 10으로 세팅
		mvo.setDisplayRow(10);
		
		paging.setCurpage(page); //현재페이지
		
		paging.setStartNum(page); //처음글목록번호
		mvo.setStartNum(page);    
		
		paging.setEndNum(page);   //끝글목록번호
		mvo.setEndNum(page);
		
		int count = mdao.getAllCount();  //총 목록 개수
		paging.setTotalCount(count);
		mvo.setTotalCount(count);
		System.out.println("  로그 총목록수:"+count);
		System.out.println("  로그 next:"+paging.isNext());
		System.out.println("  로그 prev:"+paging.isPrev());
		request.setAttribute("paging", paging); //페이징처리
		
		request.setAttribute("mList", mdao.selectAll(mvo)); //해당 페이지번호에 맞게 목록출력
		
		return forward;
	}

}
