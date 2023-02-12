package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;

public class ProductDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/productList.do"); // 어드민영역 상품수정
		forward.setRedirect(false);
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		if(request.getParameter("pNum")!=null) {
			pvo.setProductNum(Integer.parseInt(request.getParameter("pNum")));
			System.out.println("  로그 삭제:"+pvo.getProductNum());
			pdao.delete(pvo);
		} else {
			System.out.println("  로그: 삭제 실패!!");
			return null;
		}
		return forward;
	}

}
