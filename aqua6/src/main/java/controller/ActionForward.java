package controller;

public class ActionForward {
	/*
	어디 페이지로 이동해야 하는지 == main.jsp
	어떤 방식으로 이동해야 하는지를 반환 해야함. == forward
	java의 메서드로는 2개 이상의 반환값을 전달 xxxx
	- > 객체를 생성 : ActionForward 클래스로 만든 객체
	*/
	private String path; // 어디로 갈지
	private boolean redirect; // 어떻게 갈지 (false면 forward)
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	@Override
	public String toString() {
		return "ActionForward [path=" + path + ", redirect=" + redirect + "]";
	}
	ActionForward(){
		
	}
}
