<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<title>Aquarium | 마이페이지</title>

<!-- css Style 연결 -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/mypage.css" type="text/css">
</head>
<body>

	<!-- Header Section Begin -->
	<lee:headerSection id="${member.memberId}" name="${member.memberName}"
		kakao="${member.memberName }" />
	<!-- Header Section End -->

	<div class="wrap" style="background-color: skyblue;">
		<section class="breadcrumb-section set-bg"
			data-setbg="img/details-hero.png">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<h2>마이페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--무의미 <div class="modify">i</div> -->
	</div>
	<hr>
	<div class="listContainer">
		<a href="paymentList.do?memberId=${member.memberId}" class="item">
			<div class="icon">ii</div>
			<div class="text">주문내역</div>
		</a> <a class="item">
			<div class="icon">ii</div>
			<div class="text">상품후기</div>
		</a>
		<%-- <a class="item">
            <div class="icon">ii</div>
            <div class="text">뀨잉뀨잉</div>
         </a> <a class="item">
            <div class="icon">ii</div>
            <div class="text">뀨잉뀨잉</div>
         </a><hr> --%>

		<div class="item">
			<div class="icon">ii</div>
			<div class="text">
				<span><a href="sitemap.do"
					style="text-decoration: none; color: black;">사이트맵</a></span>
			</div>
		</div>
		<div class="item">
			<div class="icon">ii</div>
			<div class="text">
				<span><a href="blog.do"
					style="text-decoration: none; color: black;">공지사항</a></span>
			</div>
		</div>
		<div class="item">
			<div class="icon">ii</div>
			<div class="text">
				<span><a href="leaveMsgMove.do"
					style="text-decoration: none; color: black;">1:1 문의</a></span>
			</div>
		</div>
		<hr>
	</div>
	<%--
      <div class="listContainer">
      </div>
      --%>
	<div class="infoContainer">
		<c:choose>
		<c:when test="${not empty member.memberPw}">
			<a href="logout.do" class="item" style="width: 33%"> <div>로그아웃</div> </a>
		</c:when>
		<c:otherwise>
			<a href="logout.do" class="item" style="width: 33%" onclick="kakaoLogout();"> <div>로그아웃</div> </a>
		</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not empty member.memberPw}">
				<a href="changeInfo.do?memberId=${member.memberId}" class="item"
					style="width: 33%">
					<div>회원정보변경</div>
				</a>
				<button type="button" value="회원탈퇴" id="memberDelete"
					name="memberDelete" onClick="memDel()"
					style="border: 0; outline: 0; width: 33%; background-color: white;">회원탈퇴
				</button>
			</c:when>
			<c:otherwise>
				<a href="#" class="item" style="width: 33%"> <div>회원정보변경</div> </a>
				<a href="#" class="item" style="width: 33%"> <div>회원탈퇴</div> </a>
			</c:otherwise>
		</c:choose>



		<input type="hidden" id="pw" name="pw" value="${member.memberPw}">
		<input type="hidden" id="userId" name="userId"
			value="${member.memberId}">


	</div>



	<lee:footer />

	<script type="text/javascript">
        
      function memDel() {
         console.log("로그: del들어왔음");
         var ans = prompt("비밀번호 확인합니다. 비밀번호 입력해주세요.");
         console.log("ans : "+ans);
         var pw = document.getElementById("pw").value;
         console.log("pw : "+pw);
         
         var m = document.getElementById("userId").value;
         if (ans == pw) {
            console.log("pw 일치 들어옴");
            var result = confirm("본인 확인되셨습니다. 정말 회원탈퇴하시겠습니까?");
            console.log(result);
            if(result){
               
               var link = 'memberDelete.do?memberId='+m;
               location.href=link;
            }
            else{
               alert("마이페이지로 돌아갑니다.");
            }
         } else {
            console.log("delete 안 들어옴");
            alert("비밀번호 불일치입니다.다시 회원탈퇴해주세요.");
            return;
         }
      }
   </script>
   
</body>
</html>