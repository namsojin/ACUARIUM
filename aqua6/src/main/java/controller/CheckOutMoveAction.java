package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckOutMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/checkout.jsp");
		forward.setRedirect(false);
		// 체크아웃 페이지로 이동시, 체크아웃 페이지에서 장바구니 목록 보여주어야함 
		// ( 세션에 카트 저장되어 있기 때문에 여기선 띄울 필요 없음 )
		// total 가격은 session으로 저장되어 있지 않기 때문에 다시 불러서 뿌려주어야 함
		if(request.getParameter("total")!=null) {
			int total=Integer.parseInt(request.getParameter("total"));
			request.setAttribute("total", total);
		} else {
			System.out.println("  로그 checkOutMove: total 안들어옴");
		}

		return forward;
	}

}
