<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aquarium | 1:1문의</title>

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
							<a href="main.do">Home</a> <a href="blog.do">고객센터</a> <span>1:1 문의</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Breadcrumb Section End -->


	<!-- 문의하기 Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>관리자에게 문의하기</h2>
						<h6>궁금하신 점을 남겨주시면 접수 순서대로 답변 드리겠습니다.</h6>
					</div>
				</div>
			</div>
			<form action="leaveMsg.do">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<input type="text"  name="title" placeholder="제목 입력해주세요.">
					</div>
					<div class="col-lg-6 col-md-6">
						<input type="text" name="email" placeholder="이메일을 입력해주세요.">
					</div>
					<div class="col-lg-12 text-center">
						<textarea placeholder="문의 내용 입력해주세요."  name="content"></textarea>
						<button type="submit" class="site-btn" >문의하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 문의하기 End -->

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