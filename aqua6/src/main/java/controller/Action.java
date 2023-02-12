package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 모든 요청처리로직 (==Action클래스류들, CTRL)들은
// 반드시 AF execute(req,res)의 메서드 시그니쳐를 가져야함!!
// == 강제성 == 추상메서드 == 인터페이스
public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
