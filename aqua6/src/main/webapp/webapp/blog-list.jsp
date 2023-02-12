<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
 <title>Admin | 공지글목록</title>
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


			<!-- Table Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">

					<div class="col-12">
						<div class="bg-light rounded h-100 p-4">
							<h6 class="mb-4">공지글목록</h6>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
										    <th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">공지내용</th>
											<th scope="col">작성자</th>
											<th scope="col">수정/삭제</th>
										</tr>
									</thead>
									<tbody>
										<%-- 페이징처리 필요 --%>
										<c:forEach var="v" items="${bList}" begin="0" end="9">
										<tr>
											<th scope="row">${v.boardNum}</th>
											<td>${v.boardTitle}</td>
											<td>${v.boardContent}</td>
											<td>${v.memberId}</td>
											<td><a href="blogChange.do"> <i class="fa fa-envelope"> </i></a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								 <lee:paging url="/blogList.do" part="admin"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Table End -->


			<!-- Footer Start -->
			<!-- Footer End -->
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