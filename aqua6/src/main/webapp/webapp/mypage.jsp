<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<title>Aquarium | 마이페이지</title>

<link rel="stylesheet" href="css/mypage.css" type="text/css">
</head>
<body>

	<div class="wrap">
		<div class="greenContainer">
			<div>
				<a href="main.do"><img class="logo" src="img/logo.png"></a>
				<%-- 
				<div class="name">${memberName}님</div>
				--%>
				<c:choose>
					<c:when test="${not empty id}">
						<a href="mypage.do?memberId=${memberId}">${memberName}</a>님
								<a href="logout.do">로그아웃</a>
					</c:when>
				</c:choose>
			</div>
			<!--무의미 <div class="modify">i</div> -->
		</div>
		<div class="summaryContainer">
			<div class="item">
				<div class="number">354</div>
				<div>단골상점</div>
			</div>
			<div class="item">
				<div class="number">354</div>
				<div>상품후기</div>
			</div>
			<div class="item">
				<div class="number">354</div>
				<div>적립금(BLCT)</div>
			</div>
		</div>
		<div class="shippingStatusContainer">
			<div class="title">주문/배송조회</div>
			<div class="status">

				<div class="item">
					<div>
						<div class="green number">6</div>
						<a href="cartMove.do" style="text-decoration: none;"><div
								class="text">장바구니</div></a>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number">0</div>
						<div class="text">결제완료</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">1</div>
						<div class="text">배송중</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">3</div>
						<div class="text">구매확정</div>
					</div>
				</div>

			</div>

		</div>
		<div class="listContainer">
			<a href="checkOutMove.do" class="item">
				<div class="icon">ii</div>
				<div class="text">
					주문목록<span class="circle"></span>
				</div>
				<div class="right">></div>
			</a> <a class="item">
				<div class="icon">ii</div>
				<div class="text">상품후기</div>
				<div class="right"></div>
			</a> <a class="item">
				<div class="icon">ii</div>
				<div class="text">상품문의</div>
				<div class="right"></div>
			</a> <a class="item">
				<div class="icon">ii</div>
				<div class="text">단골상점</div>
				<div class="right"></div>
			</a>
		</div>
		<div class="listContainer">
			<a class="item">
				<div class="icon">ii</div>
				<div class="text">
					<span>내지갑</span> <span class="smallLight"> <span>|</span> <span>보유
							적립금</span>
					</span>
				</div>
				<div class="right">
					<span class="blct">175 BLCT</span> >
				</div>
			</a> <a class="item">
				<div class="icon">ii</div>
				<div class="text">알림</div>
				<div class="right">></div>
			</a> <a class="item">
				<div class="icon">ii</div>
				<div class="text">설정</div>
				<div class="right">></div>
			</a>
		</div>
		<div class="infoContainer">
			<a href="blog.do" class="item">
				<div>공지사항</div>
			</a> <a href="changeInfo.do" class="item">
				<div>회원정보변경</div>
			</a> <a href="blog.do" class="item">
				<div>고객센터</div>
			</a>
		</div>
	</div>

</body>
</html>