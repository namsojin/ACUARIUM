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
<title>Aquarium | 장바구니</title>

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
         if (confirm("수량을 추가하시겠습니까?")) { // 확인
            document.addForm.submit();
         } else { // 취소
            //document.addForm.reset();
            false;
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

   <!-- Shoping Cart Section Begin -->
   <section class="shoping-cart spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="shoping__cart__table">
                  <table>
                     <thead>
                        <tr>
                           <%-- <th class="shoping__product">장바구니 목록</th> --%>
                           <th>제품</th>
                           <th>제품명</th>
                           <th>가격</th>
                           <th>수량</th>
                           <th>추가할 수량</th>
                           <th>총 금액</th>
                           <th>삭제</th>
                        </tr>
                     </thead>
                     <c:choose>
                        <c:when test="${empty cart}">
                           <tbody>
                              <td></td>
                              <td></td>
                              <td><img src="img/empty.JPG" alt="장바구니가 비었습니다.."></td>
                              <td></td>
                              <td></td>
                              <td></td>
                           </tbody>
                        </c:when>
                        <c:otherwise>
                           <c:forEach items="${cart}" var="v">
                              <tbody>
                                 <td><a href="shopDetails.do?pNum=${v.productNum}">
                                 <img src="${v.productImg}" style="width : 200px; height : 180px"></a></td>
                                 <td>${v.productName}</td>
                                 <td>${v.productPrice}</td>
                                 <td>${v.sellCnt}</td>
                             <td> <form action="cartUpdate.do" id="addForm" name="addForm" onsubmit="return formTest7()">
                              <input type="hidden" name="pNum" value="${v.productNum}"/>
                                 <input type="number" id="sellCnt" name="sellCnt" value="1" min="1" max="5" 
                                 oninput="this.value = this.value.replace(/[^0-9.]/g, ''). replace(/(\..*)\./g, '$1');" 
                                 style="width: 60px;">
                                 <input type="submit" value="추가" onclick="addToCart()" name="submit" />
                                 </form></td>
                                 <td>${v.sellCnt * v.productPrice}</td>
                                 <td><a href="cartDelete.do?pNum=${v.productNum}">X</a></td>
                              </tbody>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                  </table>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-12">
               <div class="shoping__cart__btns">
                  <a href="shopGrid.do" class="primary-btn cart-btn">쇼핑 계속하기</a>
                  <a href="cartDelete.do" class="primary-btn cart-btn cart-btn-right">
                     <span class="icon_loading"></span> 장바구니 비우기
                  </a>
               </div>
            </div>
            <div class="col-lg-6">
               <div class="shoping__continue">
               </div>
            </div>
            <div class="col-lg-6">
               <div class="shoping__checkout">
                  <h5>Cart Total</h5>
                  <ul>
                     <li>총 금액 <span style="color: black;"> ${total}원</span></li>
                  </ul>
                  <a href="checkOutMove.do?total=${total}" class="primary-btn">주문하기</a>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Shoping Cart Section End -->

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
   <script type="text/javascript">
  
   </script>
</body>
</html>