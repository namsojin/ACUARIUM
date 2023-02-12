package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;

public class ProductChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/product-change.jsp"); // 어드민영역 상품수정
		forward.setRedirect(false);
		ProductVO pvo=new ProductVO();
		ProductDAO pdao=new ProductDAO();
		
		pvo.setProductNum(Integer.parseInt(request.getParameter("pNum")));
		System.out.println("  로그 ProductChange 들어옴 pNum:"+pvo.getProductNum());
		request.setAttribute("product", pdao.selectOne(pvo));
		System.out.println("로그 ProductChange product:"+pdao.selectOne(pvo));

		return forward;
	}

}
