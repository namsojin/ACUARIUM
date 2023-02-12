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
<title>Aquarium | 배송정보/주문내역</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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
						<h2>배송정보/주문내역</h2>
						<div class="breadcrumb__option">
							<a href="main.do">Home-배송정보/주문내역</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<!-- 
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 쿠폰을 적용하시겠습니까? <a href="#">Click here</a>
                    </h6>
                </div>
            </div>
             -->
			<div class="checkout__form">
				<h4>배송 정보</h4>
				<form action="checkout.do">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											아이디<span>*</span>
										</p>
										<input type="text" name="memberId" value="${member.memberId}" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											이름<span>*</span>
										</p>
										<input type="text" name="memberName">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									상세 주소<span>*</span>
								</p>
								<input type="text" placeholder="도로명" class="checkout__input__add" name="memberadress"> 
									<%--<input type="text" placeholder="동,호,수 (optinal)"> --%>
							</div>
							<div class="checkout__input">
								<p>
									우편번호<span>*</span>
								</p>
								<input type="text">
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											전화번호<span>*</span>
										</p>
										<input type="text" name="memberPhone">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											이메일<span>*</span>
										</p>
										<input type="text" name="memberEmail">
									</div>
								</div>
							</div>
							<!-- 
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                 새로운 계좌 생성
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Create an account by entering the information below. If you are a returning customer
                                please login at the top of the page</p>
                            <div class="checkout__input">
                                <p>계좌 비밀번호<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Ship to a different address?
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                             -->
							<div class="checkout__input">
								<p>
									배송 메모
								</p>
								<input type="text" placeholder="배송시 주의사항을 적어주세요." name="memo">
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>주문내역</h4>
								<div class="checkout__order__products">
									상품 <span>Total</span>
								</div>
								<ul>
									<li>칸후 올디아망 어항 90슬림 소폭A 90x30x45cm(8T) <span>108,000원</span></li>
									<li>네이처팜 베이직 박테리아 물갈이제 250ml 세트 <span>128,000원</span></li>
									<li>그로비타 CRS 사료 50g_100ml <span>1,200,000원</span></li>
								</ul>
								<div class="checkout__order__total">
									Total <span>133,000원</span>
								</div>
								<%-- 
								<div class="checkout__input__checkbox">
									<label for="acc-or"> 새로운 계좌 생성 <input type="checkbox"
										id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<p>새로운 계좌를 생성하시려면 체크 해주세요.</p>
								<div class="checkout__input__checkbox">
									<label for="payment"> 결제 <input type="checkbox"
										id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> Paypal <input type="checkbox"
										id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								--%>
								<button type="submit" class="site-btn">결제하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

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