package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;

public class ProductUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/productList.do"); // 어드민영역 상품수정
		forward.setRedirect(false);
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();

		pvo.setProductNum(Integer.parseInt(request.getParameter("pNum")));
		pvo.setProductName(request.getParameter("pName"));
		pvo.setProductPrice(Integer.parseInt(request.getParameter("price")));
		pvo.setProductCnt(Integer.parseInt(request.getParameter("cnt")));
		pvo.setProductImg(request.getParameter("img"));
		pvo.setProductInfo(request.getParameter("info"));
		pvo.setProductInfoImg(request.getParameter("infoImg"));
		pvo.setProductSale(Integer.parseInt(request.getParameter("sale")));
		pvo.setProductStatus(request.getParameter("status"));
		pvo.setProductCategory(request.getParameter("category"));
		System.out.println("  로그 수정:"+pvo);
		pdao.update(pvo);

		return forward;
	}

}
