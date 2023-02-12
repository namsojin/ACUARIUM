package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.AddressDAO;
import address.AddressVO;
import orders.OrdersDAO;
import orders.OrdersVO;
import product.ProductDAO;
import product.ProductVO;

public class CheckOutAction implements Action { // 주문정보 등록 기능 액션

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("paymentlist.jsp"); // 주문정보 등록후 결제되면 주문내역창으로 이동
		forward.setRedirect(false); // checkOut페이지에서 주문정보 입력 후 결제
		HttpSession session = request.getSession(false);
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<ProductVO>();
		} else {
			AddressDAO adao = new AddressDAO();
			AddressVO avo = new AddressVO();
			OrdersVO ovo = new OrdersVO();
			OrdersDAO odao = new OrdersDAO();
			ProductVO pvo = new ProductVO();
			ProductDAO pdao = new ProductDAO();
			
			String id = null;
			if (request.getParameter("memberId") != null) {
				id = request.getParameter("memberId");
			}
			avo.setAddress(request.getParameter("address"));
			avo.setAddressPost(request.getParameter("addressPost"));
			avo.setMemberId(id);
			System.out.println("  로그 address:" + avo);
			for (int i = 0; i < cart.size(); i++) {
				// 카트배열에 저장되어 있는 값들을 빼서 모두 insert
				ovo.setProductNum(cart.get(i).getProductNum());
				ovo.setMemberId(id);
				ovo.setMemberName(request.getParameter("memberName"));
				ovo.setMemberPhone(request.getParameter("rcvPhoneNum"));
				ovo.setOrdersCnt(cart.get(i).getSellCnt());
				ovo.setOrdersMemo(request.getParameter("memo"));
				ovo.setOrdersPayment(1); // 결제상태를 어떻게 추가해 줄 것인지.
				ovo.setOrdersPaymentMethod(request.getParameter("oPay")); // 뭘로 결제했는지
				ovo.setOrdersState(0); // 배송상태
				System.out.println("  로그 Orders:" + ovo);
				if (odao.insert(ovo)) {
					System.out.println("  로그: Orders insert 성공!");
					pvo.setSellCnt(cart.get(i).getSellCnt());
					pvo.setProductNum(cart.get(i).getProductNum());
					pdao.update(pvo);
					session.removeAttribute("cart"); // odao.insert가 성공했다면 주문에 성공한 것이니 카트삭제
				} else {
					System.out.println("  로그: Orders insert 실패!");
				}
			}
			// 해당 맴버에게 이미 주소가 있니? 있다면 update / 없다면 insert
			if (adao.selectOne(avo) != null) {
				adao.update(avo);
			} else {
				adao.insert(avo);
			}
			

			request.setAttribute("address", adao.selectOne(avo));
			request.setAttribute("orders", odao.selectAll(ovo));

		}

		return forward;
	}

}