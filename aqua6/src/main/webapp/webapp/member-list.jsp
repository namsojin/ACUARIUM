<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>Admin | 회원목록</title>
     <!-- Favicon -->
    <link rel="icon" href="img/ms-icon-70x70.png">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/adminbootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/adminstyle.css" rel="stylesheet">

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
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
                            <h6 class="mb-4">회원목록</h6>
                            <div class="table-responsive">
                                <table class="table" style="text-align:center">
                                    <thead>
                                        <tr>
                                            <th scope="col">아이디</th>
                                            <th scope="col">이름</th>
                                            <th scope="col">비밀번호</th>
                                            <th scope="col">생년월일</th>
                                            <th scope="col">이메일</th>
                                            <th scope="col">전화번호</th>
                                            <th scope="col">수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<%--
										해결해야 할 문제1: 페이징 완성시켜야 함
										해결해야 할 문제 선택1: 사용자가 원한다면 5, 10, 20 이렇게 나타나면 좋을 거 같음(목록)
										해결해야 할 문제 선택2: 보통 관리자가 사진만 올리는 경우가 많음
										=> alt의 이미지 설명을 보통 어떻게 하지? ()	
										해결해야 할 문제 선택3: 사용자가 원하는대로 상품목록출력, 할인상품보기, 최신 상품 보기, 상품 이름으로 검색이 가능하면 좋겠음 (물론? 시간이 남으면? 가능)
										 --%>
                                    	<c:forEach var="v" items="${mList}" begin="0" end="9">
                                        <tr>
                                            <td>${v.memberId}</td>
                                            <td>${v.memberName}</td>
                                            <td>${v.memberPw}</td>
                                            <td>${v.memberBirth}</td>
                                            <td>${v.memberEmail}</td>
                                            <td>${v.memberPhone}</td>
                                            <td><a href="memberChange.do?memberId=${v.memberId}"><i class="fa fa-home" style="float: center;"></i></a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <lee:paging url="/memberList.do" part="admin"/>
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
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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