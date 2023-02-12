package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.AddressDAO;
import address.AddressVO;
import orders.OrdersDAO;
import orders.OrdersVO;

public class AddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/address.jsp"); // address.jsp 로 이동
		forward.setRedirect(false);      //forward 방식으로. 
		
		OrdersDAO odao = new OrdersDAO();
		OrdersVO ovo = new OrdersVO();
		AddressDAO adao = new AddressDAO();
		AddressVO avo = new AddressVO();
		
		avo.setMemberId(request.getParameter("memberId"));
		ovo.setOrdersNum(Integer.parseInt(request.getParameter("ordersNum")));
		request.setAttribute("orders", odao.selectOne(ovo));
		request.setAttribute("address", adao.selectOne(avo));
		
		return forward;
	}

}
