<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aquarium | 배송정보/주문내역</title>
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

<style type="text/css">
.address {
   width: 100%;
   height: 46px;
   border: 1px solid #ebebeb;
   padding-left: 20px;
   margin-top: 20px;
   font-size: 16px;
   color: #000000;
   border-radius: 4px;
}
</style>
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
                  <h2>배송정보/주문내역</h2>
                  <div class="breadcrumb__option">
                     <a href="main.do">Home-배송정보/주문내역</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Breadcrumb Section End -->

   <!-- Checkout Section Begin -->
   <section class="checkout spad">
      <div class="container">
         <!-- 
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 쿠폰을 적용하시겠습니까? <a href="#">Click here</a>
                    </h6>
                </div>
            </div>
             -->
         <div class="checkout__form">
            <h4>배송 정보</h4>
            <form action="checkout.do">
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 아이디<span>*</span>
                              </p>
                              <input type="text" id="memberId" name="memberId" value="${member.memberId}"
                                 readonly>
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 이름<span>*</span>
                              </p>
                              <c:set var="memberName" value="${member.memberName}"/>
                              <input type="text" id="memberName" name="memberName" value="${member.memberName}">
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 전화번호<span>*</span>
                              </p>
                              <c:set var="memberPhone" value="${member.memberPhone }"/>
                              <input type="text" id="memberPhone" name="memberPhone" value="${member.memberPhone}">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 이메일<span>*</span>
                              </p>
                              <c:set var="memberEmail" value="${member.memberEmail}"/>
                              <input type="text" id="memberEmail" name="memberEmail" value="${member.memberEmail}">
                           </div>
                        </div>
                     </div>
                     <%------------ 주소api Begin ------------%>
                     <div>
                     <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="address"><br> 
                     <input type="text" id="sample4_postcode" placeholder="우편번호" name="post" class="address"  readonly> 
                     <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="address" name="address" readonly> 
                     <span id="guide" style="color: #999; display: none"></span> 
                     <input type="text" id="sample4_jibunAddress" placeholder="상세주소" class="address" name="jibunAddress">
                     <script
                        src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                     <script src="js/address.js"></script>
                     </div>
                     <%------------ 주소api End ------------%>
                     <div class="checkout__input" style="margin-top: 30px;">
                        <p>배송 메모</p>
                        <input type="text" placeholder="배송시 주의사항을 적어주세요." name="memo" id="memo">
                     </div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                     <div class="checkout__order">
                        <h4>주문내역</h4>
                        <div class="checkout__order__products">
                           상품 <span>금액</span>
                        </div>
                        <c:forEach items="${cart}" var="v">
                           <ul>
                              <li><div
                                    style="display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${v.productName}</div>
                                 <span style="display: inline-block;">${v.productPrice}원</span></li>
                           </ul>
                        </c:forEach>
                        <div class="checkout__order__total">
                           Total <span>${total}</span>
                        </div>
                        <%-- <button type="submit" class="site-btn">결제하기</button> --%>
							
                        <button id="iamportPayment" class="site-btn" type="button">카드결제</button>
                        <button id="iamportPayment2" class="site-btn" type="button">카카오페이</button>
                        <button id="iamportPayment3" class="site-btn" type="button">토스페이</button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </section>
   <!-- Checkout Section End -->

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

   <!-- jQuery -->
   <script type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


   <script type="text/javascript">
   
      //문서가 준비되면 제일 먼저 실행
      $(document).ready(function() {
    	  var post = $("#sample4_postcode").val();	
    	  console.log(post);
    	 
    	  var road = $("#sample4_roadAddress").val();
    	  console.log(road);
         var data;
         $("#iamportPayment").click(function() {
        	 
        	if(post != null && road != null){
            data = '카드';
            payment(data); //버튼 클릭하면 호출 
        	}
            
         });
         $("#iamportPayment2").click(function() {
            data = '카카오';
            payment(data); //버튼 클릭하면 호출 
         });
         $("#iamportPayment3").click(function() {
            data = '토스';
            payment(data); //버튼 클릭하면 호출 
         });
         $("#iamportPayment4").click(function() {
            data = '자동결제';
            payment(data); //버튼 클릭하면 호출 
         });
      })

      //버튼 클릭하면 실행
      function payment(data) {
    	  
    	 
		
         var orderName = '${memberName}';
         var searchItem2 = document.getElementById("memberId").value;
         var cTotalPrice = '${total}';
         var str='상품이름';
         var len=14;
         function textLength(str,len){   
            // name은 16자 이상 넘어가게 되면 에러나기 때문에 잘라서 넣어주는 작업.
            var returnValue="";
            
            if(!len || len==""){
               return str;
            }
            if(str.length>len){
               returnValue=str.substring(0,len) + "...";
            }
            else{
               returnValue= str;
            }
            return returnValue;
         }
         var pName=textLength(str,len);
         console.log(pName);
         
         var uid = 'ORDER' + new Date().toLocaleString();
         console.log("cTotalPrice 로그: "+cTotalPrice);
         console.log("orderName 로그: "+orderName);
         console.log(searchItem2);

         var pay = data;
         if (pay == '카카오') {
            pay = 'kakaopay.TC0ONETIME';
         } else if (pay == '토스') {
            pay = 'tosspay.tosstest';
         } else if (pay == '카드') {
            pay = 'nice.nictest00m';
         }

         IMP.init('imp30040244');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
         IMP.request_pay({// param

            pg : pay, //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
            pay_method : "card", //지불 방법
            merchant_uid : "iamport_test_id12564", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
            name : pName, //결제창에 노출될 상품명
            amount : cTotalPrice, //금액
            buyer_postcode : document.getElementById("sample4_postcode").value,
            buyer_addr : document.getElementById("sample4_roadAddress").value + document.getElementById("sample4_jibunAddress").value,
            buyer_name : document.getElementById("memberName").value,
            buyer_tel : document.getElementById("memberPhone").value
            // 위에 태그 아이디 가져오는거 ( 맞춰주기만 하면 됌 )
         }, function(rsp) { // callback
            if (rsp.success) {
               console.log(sessionStorage.getItem("buyer_name"));
               var link = 'checkOut.do?memberName=' + rsp.buyer_name
                     + '&rcvPhoneNum=' + rsp.buyer_tel + '&address='
                     + rsp.buyer_addr + '&oPay=' + pay + '&addressPost=' + rsp.buyer_postcode
                     + '&memo=' + document.getElementById("memo").value
                     + '&memberId=' + searchItem2;

               location.href = link;
        
            } else {
               alert("실패 : 코드(" + rsp.error_code + ") / 메세지("
                     + rsp.error_msg + ")");
            }

         });
    	 
      }
   </script>



</body>
</html>