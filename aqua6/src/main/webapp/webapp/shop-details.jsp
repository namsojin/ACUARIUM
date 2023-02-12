<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aquarium | 상세페이지</title>
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

	<script type="text/javascript">
		function addToCart() {
			// 확인 true 취소 false
			if (confirm("상품을 장바구니에 추가하시겠습니까?")) { // 확인
				document.addForm.submit();
			} else { // 취소
				document.addForm.reset();
			}
		}
	</script>
	
 
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

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<%-- 상품이미지 --%>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${productImg}" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${productName}</h3>
						<%-- 별점 
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
						</div>
						--%>
						<div class="product__details__price"><fmt:formatNumber value="${productPrice}" pattern="#,###" /></div>
						<%-- 
						상품번호를 입력해줄까?
						<p>API 반수생 거북이용 박테리아 물갈이제 수질관리 237ml 세트</p>
						--%>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
						</div>
						<%-- <a href="./shoping-cart.jsp" class="primary-btn">장바구니 담기</a> --%>
						
						<c:set var="ProductVO" value="${requestScope.productVO}"></c:set>
						<p>
						<form name="addForm" method="post" action="cartUpdate.do?productNum=${productNum}">
							<a href="cartMove.do" class="primary-btn" onclick="addToCart()" > 장바구니 &raquo;</a> 
							<a href="shopGrid.do" class="primary-btn"> 상품목록&raquo;</a>
						</form>
						</p>
						<ul>
							<li><b>유리두께</b> <span>237ml</span></li>
							<li><b>용량</b> <span>141L</span></li>
							<li><b>배송</b> <span>1일 소요 예상 <samp>오전 12시까지 주문시 오늘 발송</samp></span></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>상품 정보</h6>
									<br> <img src="${productInfoImg}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
	<hr>
	<br>
	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>관련 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="${productImg}"
							alt="">
							<ul class="product__item__pic__hover">
								<li><a href="shopDetails.do?ProductNum=${productNum}"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="shopDetails.do?ProductNum=${productNum}">${productName}</a>
							</h6>
							<h5><fmt:formatNumber value="${productPrice}" pattern="#,###" /></h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${productImg}" alt="이미지 없음">
							<ul class="product__item__pic__hover">
								<!-- <li><a href="#"><i class="fa fa-heart"></i></a></li> -->
								<!-- <li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
								<li><a href="shopDetails.do?ProductNum"><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="shopDetails.do?ProductNum=${productNum}">${productName}</a>
							</h6>
							<h5><fmt:formatNumber value="${productPrice}" pattern="#,###" /></h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

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