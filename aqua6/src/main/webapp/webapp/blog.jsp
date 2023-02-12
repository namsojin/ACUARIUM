<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
<title>Aquarium | 고객센터</title>

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
						<h2>고객센터</h2>
						<div class="breadcrumb__option">
							<a href="main.do">Home</a> <a href="blog.do">고객센터</a> <span>공지사항</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="blog.do" method="post">
								<input type="text" name="search" placeholder="검색어를 입력해주세요">
								<button type="submit" >
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__item">
							<h4>고객센터</h4>
							<ul>
								<li><a href="leaveMsgMove.do">1:1 문의</a></li>
								<li><a href="blog.do">공지사항</a></li>
								<!-- 
                                <li><a href="#" class="disabled">취소/반품 안내</a></li>
                                 -->
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-8 col-md-7">
					<div class="row">
						<c:forEach var="v" items="${bList}" begin="0" end="6" >
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="blog__item">
									<div class="blog__item__text">
										<ul>
											<li><i class="fa fa-calendar-o"></i>${v.boardDate}</li>
										</ul>
										<h5>
											<a href="blogDetails.do?boardNum=${v.boardNum}">${v.boardTitle}</a>
										</h5>
										<p>${v.boardContent}</p>
										<a href="blogDetails.do?boardNum=${v.boardNum}"
											class="blog__btn">더보기 <span class="arrow_right"></span></a>
									</div>
								</div>
							</div>
						</c:forEach>



					<%-- 
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> 2023년 1월 4일</li>
									</ul>
									<h5>
										<a href="blogDetails.do">설날 연휴 배송 지연 안내</a>
									</h5>
									<p>2023년 1월 17일 14시 이후로는 설날 연휴가 끝난 25일 이후에 배송될...</p>
									<a href="blogDetails.do" class="blog__btn">더보기 <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> 2023년 1월 17일</li>
										<!--   <li><i class="fa fa-comment-o"></i> 5</li>   -->
									</ul>
									<h5>
										<a href="blogDetails.do">서비스 중지 안내</a>
									</h5>
									<p>개발자들이 페이지를 못 만들어 서비스가 중지될 예정입니다ㅎㅎ 내가 가는 이길이 어디로 가는지 어디로 날 데려가는 그 곳은 어딘지 알 수 없지만</p>
									<a href="blogDetails.do" class="blog__btn">더보기 <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="blog__item">
								<div class="blog__item__text">
									<ul>
										<li><i class="fa fa-calendar-o"></i> 2023년 1월 18일</li>
									</ul>
									<h5>
										<a href="blogDetails.do">프론트란 무엇인가..</a>
									</h5>
									<p>1팀 프론트 쥰니 헷갈림헷갈림헷갈림헷갈림헷갈림헷갈림헷갈림ㅜㅜ</p>
									<a href="blogDetails.do" class="blog__btn">더보기 <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						--%>
						
						<%--페이징처리--%>
						<lee:paging url="/blog.do" part="user"/>

							<!-- 게시글 등록 버튼  -->
							<!-- 
                            <form action="newblog.html" name='게시글 작성 시작'>
                            <button class="site-btn" type="submit" style="float:right;">게시글 등록</button>
                            </form>
                            -->
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</section>
	<!-- Blog Section End -->


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