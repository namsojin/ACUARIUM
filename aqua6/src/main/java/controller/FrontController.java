package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//파라미터 없이 바로 요청을 진행할 수 있도록 어노테이션
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 기본 생성자는 자동제공
	// 서블릿 컨테이너(톰캣)이 객체를 생성 및 관리
	// 이때, 생성시에 기본생성자만을 이용하기 때문
	public FrontController() {
		super();
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri: " + uri);
		String cp = request.getContextPath();
		System.out.println("cp: " + cp);
		String command = uri.substring(cp.length());
		System.out.println("command: " + command);
		// FrontController 에서의 command 는
		// controller.jsp에서의 action에 해당합니다!!

		// ★★★★★
		// 여기서 불러내는 다른 CTRL은 POJO 입니다!!!
		ActionForward forward = null;
		if (command.equals("/main.do")) {
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/join.do")) {
			try {
				forward = new JoinAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/login.do")) {
			try {
				forward = new LoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/findId.do")) { // "아이디 찾기" 버튼 클릭 시
			try {
				forward = new FindIdAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/findPw.do")) { // "비밀번호 찾기" 버튼 클릭 시
			try {
				forward = new FindPwAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/logout.do")) {
			try {
				forward = new LogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/admin.do")) {
			try {
				forward = new AdminAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog.do")) {
			try {
				forward = new BlogAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogChange.do")) {
			try {
				forward = new BlogChangeAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogDelete.do")) {
			try {
				forward = new BlogDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogDetails.do")) {
			try {
				forward = new BlogDetailsAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogInsert.do")) {
			try {
				forward = new BlogInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogInsertMove.do")) {
			try {
				forward = new BlogInsertMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogList.do")) {
			try {
				forward = new BlogListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blogUpdate.do")) {
			try {
				forward = new BlogUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/cartDelete.do")) {
			try {
				forward = new CartDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/cartMove.do")) {
			try {
				forward = new CartMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/cartUpdate.do")) {
			try {
				forward = new CartUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/changeInfo.do")) {
			try {
				forward = new ChangeInfoAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/checkOut.do")) {
			try {
				forward = new CheckOutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/checkOutMove.do")) {
			try {
				forward = new CheckOutMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/contact.do")) {
			try {
				forward = new ContactAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/joinMove.do")) {
			try {
				forward = new JoinMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/leaveMsg.do")) {
			try {
				forward = new LeaveMsgAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/leaveMsgMove.do")) {
			try {
				forward = new LeaveMsgMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/loginMove.do")) {
			try {
				forward = new LoginMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberChange.do")) {
			try {
				forward = new MemberChangeAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberDelete.do")) {
			try {
				forward = new MemberDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberList.do")) {
			try {
				forward = new MemberListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberUpdate.do")) {
			try {
				forward = new MemberUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/msgList.do")) {
			try {
				forward = new MsgListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/msgSend.do")) {
			try {
				forward = new MsgSendAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/msgSendMove.do")) {
			try {
				forward = new MsgSendMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/myPage.do")) {
			try {
				forward = new MyPageAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/msgDelete.do")) {
			try {
				forward = new MsgDelectAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/myUpdate.do")) {
			try {
				forward = new MyUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productChange.do")) {
			try {
				forward = new ProductChangeAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productDelete.do")) {
			try {
				forward = new ProductDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productInsert.do")) {
			try {
				forward = new ProductInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productInsertMove.do")) {
			try {
				forward = new ProductInsertMoveAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productList.do")) {
			try {
				forward = new ProductListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/productUpdate.do")) {
			try {
				forward = new ProductUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		 else if (command.equals("/shopDetails.do")) {
			try {
				forward = new ShopDetailsAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/shopGrid.do")) {
			try {
				forward = new ShopGridAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sitemap.do")) {
			try {
				forward = new SitemapAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/paymentList.do")) {
			try {
				forward = new PaymentListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/address.do")) {
			try {
				forward = new AddressAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

		}
		if (forward == null) {
			forward = new ActionForward();
			forward.setPath("/error/error.jsp");
			forward.setRedirect(false);
		}
		if (forward.isRedirect()) {
			// 리다이렉트
			response.sendRedirect(forward.getPath());
		} else {
			// 포워드
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}
}

