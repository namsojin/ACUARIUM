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
      function del() {
         console.log("들어왔니");
         var ans = confirm("정말 삭제할까요?");
         if (ans == true) {
            console.log("delete 들어옴");
            document.productChange.action = "productDelete.do";
            console.log(document.productChange.action);
         } else {
            console.log("delete 안 들어옴");
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
                  <h6 class="mb-4">배송상세내역</h6>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="memberId" name="memberId"
                              value="${address.memberId}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">회원 주소</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="address" name="address"
                              value="${address.address}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">우편번호</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="addressPost" name="addressPost"
                              value="${address.addressPost}" readonly>
                        </div>
                     </div>
                     <%-- CKEditor 추가할 내용 --%>
                  <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">주문일</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="ordersDate" name="ordersDate"
                              value="${orders.ordersDate}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">상품번호</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="productName" name="productName"
                              value="${orders.productNum}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">주문수량</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="ordersCnt" name="ordersCnt"
                              value="${orders.ordersCnt}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="memberPhone" name="memberPhone"
                              value="${orders.memberPhone}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">배송메모</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="ordersMemo" name="ordersMemo"
                              value="${orders.ordersMemo}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">결제상태</label>
                        <div class="col-sm-10">
                        <c:choose>
                           <c:when test="${orders.ordersPayment == 0}">미결제
                           </c:when>
                           <c:otherwise>결제 완료</c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">결제방식</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="ordersPaymentMethod" name="ordersPaymentMethod"
                              value="${orders.ordersPaymentMethod}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">배송상태</label>
                        <div class="col-sm-10">
                           <select class="form-select mb-3" id="ordersState" name="ordersState"
                              aria-label="Default select example">
                              <option value="waterTank"
                                 <c:if test="${orders.ordersState==0||orders.ordersState==''}"> selected </c:if>>배송전</option>
                              <option value="feed"
                                 <c:if test="${orders.ordersState==1}"> selected </c:if>>배송중</option>
                              <option value="cleaner"
                                 <c:if test="${orders.ordersState==2}"> selected </c:if>>배송완료</option>
                           </select>
                        <div class="col-sm-6 col-sm-push-9">
                           <button class="btn btn-primary" style="float: right;">
                              <a href="admin.do" style="color: white;">목록으로 가기</a>
                           </button>
                        </div>
                     </div>
                     </div>
               </div>
            </div>
         </div>
         <!-- Blank End -->

      </div>
      <!-- Content End -->

      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
   </div>
   -->

   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <!-- 할인율 적용 -->

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