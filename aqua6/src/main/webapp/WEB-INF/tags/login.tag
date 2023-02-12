<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="name" %>
<div class="login-wrapper">
	<h2>Login</h2>
	<form action="login.do" method="post" id="login-form"
		name="loginForm">
		<c:choose>
			<c:when test="${not empty name}">
				<a href="myPage.do">${name}</a>님, 안녕하세요! :D
				<input type="hidden" name="action" value="logout">
				<input type="submit" value="로그아웃">
			</c:when>
			<c:otherwise>
				<input type="text" id="userId" placeholder="아이디 입력란">
				<div id="idCheckMent"></div>
				<input type="password" id="password" placeholder="비밀번호 입력린">
				<div id="pwCheckMent"></div>
				<input type="button" value="Login" onclick="login()"
					style="background-color: skyblue; font-weight: bold; margin: 10px;">
			</c:otherwise>
		</c:choose>
	</form>
</div>
