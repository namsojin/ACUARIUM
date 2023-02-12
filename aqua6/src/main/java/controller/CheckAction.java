package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

/**
 * 
 */
@WebServlet("/check")
public class CheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public CheckAction() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	// type: 'POST',
	// url: 'check',
	// => check라는 URL을 향해 POST방식으로 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(request.getParameter("userId")); 
		MemberVO member = mdao.selectOne(mvo);

		if (member == null) {
			response.getWriter().println("1"); // 중복아님. 가입가능
		} else {
			response.getWriter().println("-1"); // 중복임. 가입불가능
		}
	}

}
