<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Admin | 메인페이지</title>
<!-- Favicon -->
<link rel="icon" href="img/ms-icon-70x70.png">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/adminbootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/adminstyle.css" rel="stylesheet">
</head>

<body>
	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Sidebar Start -->
		<lee:sideBar />
		<!-- Sidebar End -->


		<!-- Content Start -->
		<div class="content">
			<!-- NavBar Start -->
			<lee:navBar />
			<!-- NavBar End -->


			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-pie fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">총 매출</p>
								<h6 class="mb-0">${totalSum}</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">총 판매개수</p>
								<h6 class="mb-0">${totalCnt}</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Best 카테고리</p>
								<h6 class="mb-0">${bestCate}</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-light rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-area fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Worst 카테고리</p>
								<h6 class="mb-0">${worstCate}</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Sale & Revenue End -->

			<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-light text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">최근주문내역</h6>
						<!-- 
                        <a href="">전체보기</a>
                         -->
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-dark">
									<th scope="col">날짜</th>
									<th scope="col">주문번호</th>
									<th scope="col">고객</th>
									<th scope="col">결제금액</th>
									<th scope="col">결제방법</th>
									<th scope="col">확인</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="v" items="${oList}" begin="0" end="9">
									<tr>
										
										<%-- 사용자에 --%>
										<td>${v.ordersDate}</td>
										<td>${v.ordersNum}</td>
										<td>${v.memberId}</td>
										<td>${v.ordersCnt * v.productPrice}</td>
										<td>${v.ordersPaymentMethod}</td>
										<td><a class="btn btn-sm btn-primary" href="address.do?memberId=${v.memberId}&ordersNum=${v.ordersNum}"
											class="disabled">자세히</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->


			
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/adminmain.js"></script>
</body>

</html>