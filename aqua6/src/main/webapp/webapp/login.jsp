<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Aquarium | 로그인</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
	<div class="login-wrapper">
		<a href="main.do"><img class="logo" src="img/logo.png"></a>
		<h2>Login</h2>
		<form method="post" action="login.do" id="login-form" class="allbox"
			name="loginForm">
			<input type="text" id="userId" name="userId" placeholder="아이디 입력란">
			<div id="idCheckMent"></div>
			<input type="password" id="password" name="password" placeholder="비밀번호 입력린">
			<div id="pwCheckMent"></div>
			<input type="submit" value="Login" onclick="login()" style="background-color: skyblue; font-weight: bold;">
			<center><a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" /> </a></center>
			<%-- 아이디찾기 | 비밀번호 찾기 | 회원가입 --%>
		</form>
		<%--------------------------카카오 로그인 Begin------------------------------%>
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script> 
		<script> Kakao.init('45990d2b103fd853cba7e9a306c13eaf');</script> <%-- 사용하려는 앱의 JavaScript 키 입력 --%> 
		<p id="token-result"></p>
		
		<script>
		  function loginWithKakao() {
		    Kakao.Auth.authorize({
		      redirectUri: 'https://localhost:8088/aqua6/login.jsp',
		    });
		  }
		
		  // 아래는 데모를 위한 UI 코드입니다.
		  displayToken()
		  function displayToken() {
		    var token = getCookie('authorize-access-token');
		
		    if(token) {
		      Kakao.Auth.setAccessToken(token);
		      Kakao.Auth.getStatusInfo()
		        .then(function(res) {
		          if (res.status === 'connected') {
		            document.getElementById('token-result').innerText
		              = 'login success, token: ' + Kakao.Auth.getAccessToken();
		          }
		        })
		        .catch(function(err) {
		          Kakao.Auth.setAccessToken(null);
		        });
		    }
		  }
		
		  function getCookie(name) {
		    var parts = document.cookie.split(name + '=');
		    if (parts.length === 2) { return parts[1].split(';')[0]; }
		  }
		</script>
		
		<%--------------------------카카오 로그인 End------------------------------%>
	</div>

	<script src="js/regex.js"></script>
	<script src="js/modal.js"></script>
</body>
</html>