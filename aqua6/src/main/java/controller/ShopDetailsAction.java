package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;

public class ShopDetailsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/shop-details.jsp");
		forward.setRedirect(false);
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		
		//선택한 애 selectOne
		String pNum=request.getParameter("pNum");
		if(pNum!=null) {
			pvo.setProductNum(Integer.parseInt(request.getParameter("pNum")));
		}
		request.setAttribute("product", pdao.selectOne(pvo));
		
		return forward;
	}

}
