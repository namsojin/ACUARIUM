package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductInsertMoveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/product-insert.jsp"); // 어드민영역 상품추가
		forward.setRedirect(false);
		
		return forward;
	}

}
