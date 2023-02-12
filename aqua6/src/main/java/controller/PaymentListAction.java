package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.AddressDAO;
import address.AddressVO;
import orders.OrdersDAO;
import orders.OrdersVO;

public class PaymentListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("paymentlist.jsp"); // 주문정보 등록후 결제창으로 이동
		forward.setRedirect(false);
		
		OrdersVO ovo=new OrdersVO();
		OrdersDAO odao=new OrdersDAO();
        AddressDAO adao = new AddressDAO();
        AddressVO avo = new AddressVO();
        String id =request.getParameter("memberId");
		ovo.setMemberId(id);
		avo.setMemberId(id);
		System.out.println("  로그 PaymentListAction:"+ovo.getMemberId());
		
		request.setAttribute("address", adao.selectOne(avo));
		request.setAttribute("orders", odao.selectAll(ovo));
		
		//결제정보 창에서는 모든 주문내역을 확인해야 하기 때문에 selectAll
		return forward;
	}

}
