package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.ProductDAO;
import product.ProductVO;

public class CartDeleteAction implements Action{ //장바구니 삭제 액션

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/cartMove.do"); 
		forward.setRedirect(false);
	//	ProductVO pvo=new ProductVO();
	//	ProductDAO pdao=new ProductDAO();
		HttpSession session = request.getSession(false); //※false 를 준 이유는 session에 값이 없다면 null을 반환해 주기 때문에
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>) session.getAttribute("cart"); // session에 cart가 있니?
		if(cart == null) {  //※그래서 session.getAttribute("cart")가 없다면 cart == null을 리턴해줄수있다.
			// cart == null 이라면 새로운 ArrayList를 만들어주게
			cart=new ArrayList<ProductVO>();
		}
		
		if(request.getParameter("pNum")!=null) {
			// 선택삭제 (view파트 추후 추가 예정)
			int pNum=Integer.parseInt(request.getParameter("pNum"));
			for(int i=0; i<cart.size();i++) {
				if(cart.get(i).getProductNum()==pNum) {
					cart.remove(i);
					System.out.println("  로그: 장바구니 선택 삭제 완료");
				}
			}
		} else {
			// 선택이 없을 시 전체 삭제
			cart.clear();
			System.out.println("  로그: 장바구니 전체 삭제 완료");
		}
		
		System.out.println("  로그 장바구니:"+cart);
		session.setAttribute("cart", cart);
		
		return forward;
	}

}
