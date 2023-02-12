<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aquarium | 아쿠아리움</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

	<!-- Page Preloder -->

	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<lee:humberger id="${member.memberId}" name="${member.memberName}" />
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<lee:headerSection id="${member.memberId}" name="${member.memberName}" />
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<lee:heroSection />
	<!-- Hero Section End -->


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/details-hero.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>고객센터</h2>
						<div class="breadcrumb__option">
							<a href="main.do">Home</a> <a href="blog.do">사이트맵</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Breadcrumb Section End -->

	<!-- 사이트맵 Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>사이트맵</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="sidebar__item">
						<h4>HOME</h4>
						<ul>
							<li><a href="main.do"> &nbsp;&nbsp;HOME</a></li>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="sidebar__item">
						<h4>판매</h4>
						<ul>
							<li><a href="shopGrid.do?ProductCategory=${'all'}">전체</a></li>
							<li><a href="shopGrid.do?ProductCategory=${'watertank'}">수조</a></li>
							<li><a href="shopGrid.do?ProductCategory=${'feed'}">사료</a></li>
							<li><a href="shopGrid.do?ProductCategory=${'cleaning'}">청소용품</a></li>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="sidebar__item">
						<h4>생물도감</h4>
						<ul>
							<!--생물도감 하위메누 비활성화 -->
							<li><a href="#" class="disabled">&nbsp;생물정보</a></li>
							<li><a href="#" class="disabled">&nbsp;생물톡톡</a></li>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="sidebar__item">
						<h4>고객센터</h4>
						<ul>
							<!-- 고객센터 하위메뉴 수정 -->
							<li><a href="leaveMsgMove.do"> &nbsp;&nbsp;1:1문의</a></li>
							<li><a href="blog.do"> &nbsp;&nbsp;공지사항</a></li>
							<%-- 
							<li><a href="#" class="disabled"> &nbsp;&nbsp;취소/반품안내</a></li>
							--%>
						</ul>
					</div>
				</div>
				<div class="col">
					<div class="sidebar__item">
						<h4>회사소개</h4>
						<ul>
							<li><a href="contact.do"> &nbsp;&nbsp;&nbsp;&nbsp;회사소개</a></li>
							<li><a href="sitemap.do"> &nbsp;&nbsp;&nbsp;&nbsp;사이트맵</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 사이트맵 End -->

	<!-- Footer Section Begin -->
	<lee:footer />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>