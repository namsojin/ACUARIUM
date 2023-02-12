<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="id" %>
<%@ attribute name="name" %>

<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> aquarium@naver.com</li>
							<a href="main.do"><li>Aquarium</li></a>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						<div class="header__top__right__social">
							<a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
							<a href="https://twitter.com/?lang=ko"><i
								class="fa fa-twitter"></i></a> <a href="https://kr.linkedin.com/"><i
								class="fa fa-linkedin"></i></a> <a href="admin.do"><i
								class="fa fa-pinterest-p"></i></a>
						</div>
						<c:choose>
							<c:when test="${not empty id}">
								<a href="mypage.do?memberId=${id}">${name}</a>님
								<a href="logout.do">로그아웃</a>
							</c:when>
							<c:otherwise>
								<!-- 회원가입 버튼 -->
								<div class="header__top__right__auth">
									<a href="joinMove.do"><i class="fa fa-user"></i> 회원가입</a>
								</div>
								<!-- 로그인 버튼 -->
								<div class="header__top__right__auth">
									<a href="loginMove.do"><i class="fa fa-user"></i> 로그인</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="main.do"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li class="active"><a href="main.do">Home</a></li>
						<li><a href="shopGrid.do">판매</a>
							<ul class="header__menu__dropdown">
								<li><a href="shopGrid.do?ProductCategory=${'all'}">전체</a></li>
								<li><a href="shopGrid.do?ProductCategory=${'watertank'}">수조</a></li>
								<li><a href="shopGrid.do?ProductCategory=${'feed'}">사료</a></li>
								<li><a href="shopGrid.do?ProductCategory=${'cleaning'}">청소용품</a></li>
							</ul></li>

						<!-- 생물도감 비활성화 -->
						<li><a href="#">생물도감</a> <!--  
								<ul class="header__menu__dropdown">
									<li><a href="#">생물정보</a></li>
									<li><a href="#">생물톡톡</a></li>
								</ul></li>
						-->
						<li><a href="blog.do">고객센터</a>
							<ul class="header__menu__dropdown">
								<li><a href="leaveMsgMove.do">1:1 문의</a></li>
								<li><a href="blog.do">공지사항</a></li>
								<!--  
									<li><a href="#" class="disabled">취소/반품안내</a></li>
									-->
							</ul></li>

						<li><a href="contact.do">회사소개</a>
							<ul class="header__menu__dropdown">
								<li><a href="sitemap.do">사이트맵</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<c:choose>
							<c:when test="${not empty id}">
								<li><a href="myPage.do?memberId=${memberId}">마이페이지</a></li>
								<li><a href="cartMove.do?memberId=${memberId}">장바구니</a></i>
							</c:when>
						</c:choose>
					</ul>
					<!-- 장바구니에 담긴 물품에 대한 가격 -->
					<div class="header__cart__price">
						<!-- 현재금액: <span>133,000</span> -->
					</div>

				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>