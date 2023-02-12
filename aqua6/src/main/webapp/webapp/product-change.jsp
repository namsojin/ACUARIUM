<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Admin | 상품정보 변경/삭제</title>
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
	<script type="text/javascript">
        	function del(){
        		ans=confirm("정말 삭제할까요?");
        		if(ans==true){
        			document.form.action.value="/productDelete.do";
        			document.form.submit();
        		}
        		else{ 
        			return;
        		}
        	}	
     </script>

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

			<!-- Blank Start -->
			<div class="container-fluid pt-4 px-4">
				<div
					class="row vh-100 bg-light rounded align-items-center justify-content-center mx-0">

					<div class="bg-light rounded h-100 p-4">
						<h6 class="mb-4">상품정보 변경</h6>
						<form action="productUpdate.do" method="post">
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">카테고리
									선택</label>
								<div class="col-sm-10">
									<select class="form-select mb-3" id="category" name="category"
										aria-label="Default select example">
										<option <c:if test="${productCategory==''}"> selected </c:if>>전체</option>
										<option value="waterTank" <c:if test="${category=='waterTank'}"> selected </c:if>>수조</option>
										<option value="feed" <c:if test="${category=='feed'}"> selected </c:if>>사료</option>
										<option value="cleaner" <c:if test="${category=='cleaner'}"> selected </c:if>>청소용품</option>
									</select>
								</div>
							</div>
							<%-- 기존                                 
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리 선택</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputEmail3" placeholder="카테고리 선택" required>
                                    </div>
                                    --%>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="pName" name="pName"
										placeholder="상품명" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">금액</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="price" name="price"
										placeholder="금액" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">재고</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="cnt" name="cnt"
										placeholder="재고" required>
								</div>
							</div>
							<%-- CKEditor 추가할 내용 --%>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">정보</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="info" name="info"
										placeholder="정보" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">썸네일 첨부파일</label>
								<div class="col-sm-10">
									<input class="form-control" type="file" id="img" name="img">
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">정보이미지 첨부파일</label>
								<div class="col-sm-10">
									<input class="form-control" type="file" id="infoImg" name="infoImg" multiple="">
								</div>
							</div>
								<div class="row mb-3">

								<div class="col-sm-10">
									<div class="form-check"></div>
								</div>
							</div>
							<div class="col-sm-6 col-sm-pull-9">
								<button type="submit" class="btn btn-primary" onClick="del()"
									style="float: right; margin-left: 10px" >상품삭제</button>
							</div>
							<div class="col-sm-6 col-sm-push-9">
								<button type="submit" class="btn btn-primary"
									style="float: right;" >상품정보수정</button>
							</div>

						</form>
					</div>
				</div>
			</div>
			<!-- Blank End -->

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