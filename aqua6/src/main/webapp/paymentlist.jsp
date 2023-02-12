<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aquarium | 결제내역</title>

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
  <lee:humberger id="${member.memberId}" name="${member.memberName}" kakao="${member.memberName }" />
   <!-- Humberger End -->

   <!-- Header Section Begin -->
   <lee:headerSection id="${member.memberId}" name="${member.memberName}" kakao="${member.memberName }" />
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
                  <h2>결제내역</h2>
                  <div class="breadcrumb__option">
                     <a href="main.do">Home</a> <a href="blog.do">결제내역</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <!-- Breadcrumb Section End -->

   <!-- paymentList Begin -->
   <section class="from-blog spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title from-blog__title">
                  <h2>결제내역</h2>
               </div>
            </div>
         </div>
         
         <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
               <div class="col-12">
                  <div class="bg-light rounded h-100 p-4">
                     <h6 class="mb-4">주문번호</h6>
                     <div class="table-responsive">
                        <table class="table" style="text-align:center">
                           <thead>
                              <tr>
                                 <th scope="col">주문날짜</th>
                                 <th scope="col">주문식별번호</th>
                                 <th scope="col">상품이름</th>
                                 <th scope="col">구매가격</th>
                                 <th scope="col">구매수량</th>
                                 <th scope="col">배송상태</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="v" items="${orders}" begin="0" end="9">
                              <c:if test="${member.memberId == v.memberId || not empty member.memberId}">
                                 <tr>
                                    <th scope="row">${v.ordersDate}</th>
                                    <td>${v.ordersNum}</td>
                                    <td>${v.productName}</td>
                                    <td>${v.productPrice}원</td>
                                    <td>${v.ordersCnt}</td>
                                    <c:choose>
                                    <c:when test="${v.ordersState == 0}">
                                    <td>배송전</td>
                                    </c:when>
                                    <c:otherwise>
                                    <td>배송중</td>
                                    </c:otherwise>
                                    </c:choose>
                                 </tr>
                                 </c:if>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      
      
      
      </div>
   </section>
   <!-- paymentList End -->

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