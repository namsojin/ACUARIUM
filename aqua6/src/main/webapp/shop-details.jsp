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
            return false;
            //document.addForm.reset();
         }
      }
   </script>
   
   <script type="text/javascript">
  //submit버튼을 사용한 전형적인 예로 폼에 입력한 데이터를 서버로 전송하기 전에
  //데이터에 문제가 있는 가를 체크하는 함수이다. 대부분의 입력폼에는 이부분을 항상 기술한다.

  function formTest7(){ //submit버튼인 [전송]버튼을 클릭하면 실행된다.
    if(!document.addForm.sellCnt.value){
    //폼의 엘리먼트중 name이 'title'인 객체에 값이 입력되어 있지 않으면 실행
   alert("수량을 입력하세요"); //메시지 표시
   document.addForm.sellCnt.focus();
   //문제가 발생한 객체인 'title'에 포커스를 설정=>쉽게 수정할 수 있도록 배려
   return false; //문제가 발생시 formTest7()함수는 여기서 끝냄. 이벤트가 발생한 곳으로 복귀
 }
  }
   </script>

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

   <!-- Product Details Section Begin -->
   <section class="product-details spad">
      <div class="container">
         <div class="row">
            <%-- 상품이미지 --%>
            <div class="col-lg-6 col-md-6">
               <div class="product__details__pic">
                  <div class="product__details__pic__item">
                     <img class="product__details__pic__item--large"
                        src="${product.productImg}" alt="">
                  </div>
               </div>
            </div>
            <div class="col-lg-6 col-md-6">
               <div class="product__details__text">
                  <h3>${product.productName}</h3>
                  
                  <div class="product__details__price" style="color: black;">
                     <h4>${product.productPrice}원</h4>
                  </div>
                  
                  <form action="cartUpdate.do" id="addForm" name="addForm" onsubmit="return formTest7()">
                     <input type="hidden" name="pNum" value="${product.productNum}">
                     <input type="number" class="numberOnly" name="sellCnt" value="1" min="1" max="5"  oninput="this.value = this.value.replace(/[^0-9.]/g, ''). replace(/(\..*)\./g, '$1');" required/> 
                     <input type="submit" value="장바구니" onclick="addToCart()" name="submit" style="border-style:none; background-color:skyblue; color: white; border-style: none; height: 30px;" />
               </form>
                  <ul> 
                     <li><b>정보</b><span>${product.productInfo}</span></li>
                     <li><b>용량</b> <span></span></li>
                     <li><b>배송</b> <span>1일 소요 예상 <samp>오전 12시까지 주문시 오늘 발송</samp></span></li>
                     <li><b>제조사</b> <span>AQUARIUM</span></li>
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
                           <br> <img src="${product.productInfoImg}">
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
                  <div class="product__item__pic set-bg"
                     data-setbg="${product.productImg}" alt="">
                     <ul class="product__item__pic__hover">
                        <li><a
                           href="shopDetails.do?ProductNum=${product.productNum}"><i
                              class="fa fa-shopping-cart"></i></a></li>
                     </ul>
                  </div>
                  <div class="product__item__text">
                     <h6>
                        <a href="shopDetails.do?ProductNum=${product.productNum}">${product.productName}</a>
                     </h6>
                     <h5>
                        <fmt:formatNumber value="${product.productPrice}"
                           pattern="#,###" />
                     </h5>
                  </div>
               </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
               <div class="product__item">
                  <div class="product__item__pic set-bg"
                     data-setbg="${product.productImg}" alt="이미지 없음">
                     <ul class="product__item__pic__hover">
                        <li><a href="shopDetails.do?ProductNum"><i
                              class="fa fa-shopping-cart"></i></a></li>
                     </ul>
                  </div>
                  <div class="product__item__text">
                     <h6>
                        <a href="shopDetails.do?ProductNum=${product.productNum}">${product.productName}</a>
                     </h6>
                     <h5>
                        <fmt:formatNumber value="${product.productPrice}"
                           pattern="#,###" />
                     </h5>
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
   <script>
      function count(type) {
         // 결과를 표시할 element
         const resultElement = document.getElementById('result');

         // 현재 화면에 표시된 값
         let number = resultElement.innerText;

         // 더하기/빼기
         if (type === 'plus') {
            number = parseInt(number) + 1;
         } else if (type === 'minus') {
            number = parseInt(number) - 1;
         }

         // 결과 출력
         resultElement.innerText = number;
      }
   </script>
</body>
</html>