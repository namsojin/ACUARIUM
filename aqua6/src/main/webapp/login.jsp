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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
   
   
   <div class="login-wrapper">
      <a href="main.do"><img class="logo" src="img/logo.png"></a>
      <h2>Login</h2>
      <form method="post" action="login.do" id="login-form" class="allbox"
         name="loginForm">
         <input type="text" id="userId" name="userId" placeholder="아이디 입력란">
         <div id="idCheckMent"></div>
         <input type="password" id="password" name="password"
            placeholder="비밀번호 입력린">
         <div id="pwCheckMent"></div>
         <input type="hidden" name="kakao" value="login">
         <input type="submit" value="Login" onclick="login()"
            style="background-color: skyblue; font-weight: bold; margin-bottom:10px;">
      </form>
         <a href="findId.jsp"><button style="width: 100%; background-color:skyblue; color: white; border-radius:3px; margin-bottom: 10px;" >아이디 찾기</button></a>
         <a href="findPw.jsp"><button style="width: 100%; background-color:skyblue; color: white; border-radius:3px; margin-bottom: 10px;">비밀번호 찾기</button></a>
      <%--------------------------카카오 로그인 Begin------------------------------%>

      <!-- 카카오 로그인 버튼 -->
      <a id="kakao-login-btn" href="javascript:kakaoLogin()"> 
      <center><img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
         width="222" alt="카카오 로그인 버튼" /></center>
      </a>
      <!-- 카카오 로그인 버튼 end -->

      <!-- 카카오 스크립트 -->
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <!-- 카카오 스크립트 end -->

      <ul>
         <%-- 
         <li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오
                  로그인/회원가입</span>
         </a></li>
         <li onclick="kakaoLogout();"><a href="javascript:void(0)"> <span>카카오
                  로그아웃</span>
         </a></li>
         --%>
         <li onclick="kakaoDelete();" style="list-style:none;"><a href="javascript:void(0)" style="text-decoration: none;"> 
            <center><span style="color: white;">카카오회원탈퇴</span></center>
         </a></li>
      </ul>
      <script>
         Kakao.init('45990d2b103fd853cba7e9a306c13eaf'); // SDK를 초기화함 / 발급 받은 키 중 javascript키를 사용해준다.
         console.log(Kakao.isInitialized()); // sdk초기화여부판단

         /* 카카오 로그인 */
         function kakaoLogin() { // 카카오 로그인 버튼 클릭시 실행되는 함수  
            Kakao.Auth
                  .login({
                     success : function(response) { // 로그인에 성공하면 받아오는 데이터
                        console.log(Kakao.Auth.getAccessToken())
                        console.log(response)
                        Kakao.API
                              .request({
                                 url : '/v2/user/me', // --> 로그인시 url
                                 success : function(response) { // 로그인 성공시 받아올 데이터
                                   
                                    var name = response.kakao_account.profile.nickname;
                                    var id =   response.id;                         
                                
                                    location.href="login.do?memberName=" + name + "&userId=" + id + "&kakao=kakao";
                                  
                                    console.log(response);
                                    console.log(response.id); // 로그인 성공한 유저 고유 id
                                   
                                 },
                                 fail : function(error) { // 로그인 실패시
                                    console.log(error)
                                 },
                              })
                     },
                     fail : function(error) { // 로그인 실패시
                        console.log(error)
                     },
                  })
         }
         /*  로그인 end */

         /*    로그아웃 */
         function kakaoLogout() {
            console.log("너 뭐니?" + Kakao.Auth.getAccessToken())
            if (!Kakao.Auth.getAccessToken()) { // 로그인하지 않은 상태에서 로그아웃 시도
               console.log("너 뭐니?" + Kakao.Auth.getAccessToken())
               alert("로그인을 해주세요.");
               return;
            }
            console.log("로그아웃 성공 직전" + Kakao.Auth.getAccessToken())
            Kakao.Auth.logout(function() { //  로그인한 상태에서 로그아웃 시도
            /*           alert("로그아웃 성공 -> " + Kakao.Auth.getAccessToken()); */

               alert(name + "님 로그아웃되었습니다.");
            });
         }
         /* 로그아웃 end */

         /*회원탈퇴*/
         function kakaoDelete() { //  탈퇴 버튼 클릭시 실행될 함수
            if (Kakao.Auth.getAccessToken()) {
               console.log(Kakao.Auth.getAccessToken())
               Kakao.API.request({
                  url : '/v1/user/unlink', // --> 탈퇴시 url
                  success : function(response) {
                     console.log(response)
                     alert("탈퇴완료.");
                  },
                  fail : function(error) {
                     console.log(error)
                  },
               })
               Kakao.Auth.setAccessToken(undefined)
            }
         }
         /*  회원탈퇴 end */
      </script>
      <%--------------------------카카오 로그인 End------------------------------%>
   </div>
</body>
</html>