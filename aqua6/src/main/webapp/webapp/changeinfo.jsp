<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<title>Aquarium | 회원수정</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<style type="text/css">
/*=================회원정보 수정=================*/
/*구글폰트 import*/
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap')
	;

</style>
</head>
<body>

	<form action="changeInfo.do" method="post" name="joinForm">
		<div class="member">
			<!-- 1. 로고 -->
			<a href="main.do"><img class="logo" src="img/logo.png"></a>

			<!-- 2. 필드 -->
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input id="userId" name="id" type="text" value="${memberId}" readonly> </span>
			</div>
			<div class="field">
				<b>비밀번호</b> <input id="password" name="pw" class="userpw" type="password" onkeyup="validationPw()">
				<div id="passwordCheckMent"></div>
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input id="passwordCheck" class="userpw-confirm" type="password" onkeyup="validationCpw()">
				<div id="passwordCheckMent2"></div>
			</div>
			<div class="field">
				<b>이름</b> <input type="text" id="userName" name="name" value="${memberName}" readonly>
			</div>

			<!-- 3. 필드(생년월일) -->
			<div class="field birth">
				<b>생년월일</b>
				<div>
					<input type="text" id="userYear" name="userYear" value="${birthyy}" readonly> 
					<input type="text" name="userMonth" value="${birthmm}" readonly> 
					<input type="text" name="userDay" value="${birthdd}" readonly>
				</div>
			</div>

			<!-- 5. 이메일_전화번호 -->
			<div class="field">
				<b>이메일<small></small></b> <input type="email" value="${memberEmail}"
					id="userEmail" name="email" onkeyup="validationEmail()">
				<div id="emailCheckMent"></div>
			</div>

			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" vlaue="${memberPhone}" id="userPhoneNum" name="phone"
						onkeyup="validationCertiNum()"> <input type="button"
						value="인증번호 받기" onclick="validationCertiNum()">
				</div>
				<div id="phoneNumCheckMent"></div>
				<input type="text" placeholder="인증번호를 입력하세요" id="userCheck">
			</div>

			<!-- 6. 변경하기 버튼 -->
			<input type="button" value="변경하기" onclick="validationCheck()">
		</div>
	</form>
	
	<script src="js/regex.js"></script>
	<script src="js/modal.js"></script>
</body>
</html>