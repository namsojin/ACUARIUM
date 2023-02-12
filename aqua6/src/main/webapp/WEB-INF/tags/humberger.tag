<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="id"%>
<%@ attribute name="name"%>
<%@ attribute name="kakao" %>

<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<!-- 로고 삽입 -->
		<a href="main.do"><img src="img/logo.png" alt=""></a>
	</div>
	<div class="humberger__menu__cart">
		<ul>

			<c:choose>
				<c:when test="${not empty id}">
					<a href="cartMove.do?memberId=${memberId}"> <i
						class="fa fa-shopping-cart" style="padding-right: 30px;"></i></a>
					<a href="myPage.do?memberId=${memberId}"><i class="fa fa-user"
						aria-hidden="true" style="padding-right: 30px;"></i></a>
					<a href="logout.do"><i class="fa fa-sign-out"
						aria-hidden="true" style="padding-right: 30px;"></i></a>
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

		</ul>
		<div class="header__cart__price">
			<!-- 현재금액: <span>133,000</span> -->
		</div>
	</div>
	<div class="humberger__menu__widget">
		<div class="header__top__right__language">
			<img src="img/language.jpg" alt="">
			<div>Korean</div>
			<span class="arrow_carrot-down"></span>
			<ul>
				<li><a href="#">Korean</a></li>
				<li><a href="#">English</a></li>
			</ul>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li class="active"><a href="main.do">Home</a></li>

			<li><a href="shopGrid.do">판매</a>
				<ul class="header__menu__dropdown">
					<li><a href="shopGrid.do">전체</a></li>
					<li><a href="shopGrid.do?category=watertank">수조</a></li>
					<li><a href="shopGrid.do?category=feed">사료</a></li>
					<li><a href="shopGrid.do?category=cleaning">청소용품</a></li>
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
				</ul></li>

			<li><a href="contact.do">회사소개</a>
				<ul class="header__menu__dropdown">
					<li><a href="sitemap.do">사이트맵</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
	<div class="header__top__right__social">
		<a href="https://www.facebook.com/coexaquarium"><i
			class="fa fa-facebook"></i></a> <a
			href="https://instagram.com/aquariums.rs?igshid=YmMyMTA2M2Y="><i
			class="fa fa-twitter"></i></a> <a href="https://kr.linkedin.com/"><i
			class="fa fa-linkedin"></i></a>
		<c:if
			test="${member.memberAthu == 'admin' || member.memberAthu == 'ADMIN'}">
			<a href="admin.do"><i class="fa fa-pinterest-p"></i></a>
		</c:if>
	</div>
	<div class="humberger__menu__contact">
		<ul>
			<li><i class="fa fa-envelope"></i> aquarium@naver.com</li>
			<a href="main.do"><li>Aquarium</li></a>
		</ul>
	</div>
</div>