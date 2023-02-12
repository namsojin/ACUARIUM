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
                  <h6 class="mb-4">상품정보 변경</h6>
                  <form action="productUpdate.do" name="productChange" method="post">
                     <!--<form name="productChange" method="post">-->
                     <!--    <input type="hidden" name="action" value="productUpdate.do"> -->
                     <input type="hidden" name="pNum" value="${product.productNum}">
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리
                           선택</label>
                        <div class="col-sm-10">
                           <select class="form-select mb-3" id="category" name="category"
                              aria-label="Default select example">
                              <option
                                 <c:if test="${product.productCategory==''}"> selected </c:if>>전체</option>
                              <option value="watertank"
                                 <c:if test="${product.productCategory=='watertank'}"> selected </c:if>>수조</option>
                              <option value="feed"
                                 <c:if test="${product.productCategory=='feed'}"> selected </c:if>>사료</option>
                              <option value="cleaning"
                                 <c:if test="${product.productCategory=='cleaning'}"> selected </c:if>>청소용품</option>
                           </select>
                        </div>
                     </div>
                    
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">상품명</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="pName" name="pName"
                              value="${product.productName}">
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">금액</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="price" name="price"
                              value="${product.productPrice}">
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">재고</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="cnt" name="cnt"
                              value="${product.productCnt}">
                        </div>
                     </div>
                     <%-- CKEditor 추가할 내용 --%>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">정보</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="info" name="info"
                              value="${product.productInfo}">
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">세일</label>
                        <div class="col-sm-10">
                           <input id="sale" name="sale" class="form-control" maxlength="2" 
                              placeholder="1~99까지의 숫자를 입력해주세요." value="0"> 
                           <span class="step_val">할인될 가격: <span class="span_sale"></span></span>
                           <span id="guide_sale"></span>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">상품상태</label>
                        <div class="col-sm-10">
                           <select class="form-select mb-3" id="status" name="status"
                              aria-label="Default select example">
                              <option value="waterTank"
                                 <c:if test="${product.productStatus=='판매중'||product.productStatus==''}"> selected </c:if>>판매중</option>
                              <option value="feed"
                                 <c:if test="${product.productStatus=='품절'}"> selected </c:if>>품절</option>
                              <option value="cleaner"
                                 <c:if test="${product.productStatus=='단종'}"> selected </c:if>>단종</option>
                           </select>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">현재 썸네일
                           </label>
                        <div class="col-sm-10">
                           <input class="form-control" type="text" id="img" name="img" value="${product.productImg}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">썸네일
                           첨부파일</label>
                        <div class="col-sm-10">
                           <input class="form-control" type="file" id="img" name="img" value="${product.productImg}">
                        </div>
                     </div>
                      <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">현재 정보 첨부파일</label>
                        <div class="col-sm-10">
                           <input class="form-control" type="text" id="infoImg" name="infoImg" value="${product.productInfoImg}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">정보
                           첨부파일</label>
                        <div class="col-sm-10">
                           <input class="form-control" type="file" id="infoImg" value="${product.productInfoImg}"
                              name="infoImg" multiple="">
                        </div>
                     </div>
                     <div class="row mb-3">

                        <div class="col-sm-10">
                           <div class="form-check"></div>
                        </div>
                     </div>
                     <div class="col-sm-6 col-sm-pull-9">
                        <button type="submit" class="btn btn-primary" onClick="del()"
                           style="float: right; margin-left: 10px">상품삭제</button>
                     </div>
                     <div class="col-sm-6 col-sm-push-9">
                        <button type="submit" class="btn btn-primary"
                           style="float: right;">상품정보수정</button>
                     </div>
                  </form>
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

   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <!-- 할인율 적용 -->
   <script>
   //할인율 Input 설정 (확인 완료)
   $("#sale").on("propertychange change keyup paste input", function(){ // id=sale의 input의 모든 텍스트의 변경에 반응함
         
      let userInput = $("#sale");   //id=sale은 userInput에 저장함
      let discountInput = $("input[name='sale']");   // name=sale은 discountInput에 저장함
         
      let discountRate = userInput.val();   // 사용자가 입력할 할인값
      let sendDiscountRate = discountRate;   // 서버에 전송할 할인값
      
      let goodsPrice = $("input[name='price']").val();   // 원가
      let discountPrice = goodsPrice * (1 - sendDiscountRate/100);   // 할인가격
           
      if(!isNaN(discountRate)){   // 할인율이 숫자로 들어온 경우
         $(".span_sale").html(discountPrice);   // span_sale class에 discountPrice 값을 세팅함
         discountInput.val(sendDiscountRate);   // name="sale" 값을 sendDiscountRate로 설정
      }
         
   });

   // 가격 > 할인율 > 가격 수정 시에도 할인가격을 볼 수 있음 (확인 완료)
   $("input[name='sale']").on("change", function(){ // name=sale의 값이 변경될 시 실행됨
         
      let userInput = $("#sale");
      let discountInput = $("input[name='sale']");
            
      let discountRate = userInput.val();   // 사용자가 입력한 할인값
      let sendDiscountRate = discountRate;   // 서버에 전송할 할인값
      let goodsPrice = $("input[name='price']").val();   // 원가
      let discountPrice = goodsPrice * (1 - sendDiscountRate/100);   // 할인가격
      
      if(!isNaN(discountRate)){   // 할인율이 숫자로 들어온 경우
         $(".span_sale").html(discountPrice); // class="span_sale"의 값을 discountPrice로 설정
      }
   });
   
   /*
   //향후 추가할 유효성검사 내용
   // 숫자 유효성 검사 (숫자를 입력받아야 하는 항목에서 문자를 입력받은 경우 제출되지 않게 막아줌) (오류)

   // 유효성검사 1. isNaN()의 input이 숫자인 경우 할인가격 표시와 함께 false를 반환 + 밑에 빈칸 유효성검사 추가할 예정
   let price = $("#price").val();
   let cnt = $("#cnt").val();
   let sale = $("#sale").val();
   
   if(isNaN(price)){   // 가격이 문자라면   
      $(".guide_price").innerHTML='숫자로 입력해주세요.';
      priceCk=false;
   }
   else{
      $(".guide_price").innerHTML='';
      priceCk=true;
   }
   
   if(isNaN(cnt)){   // 재고가 문자라면
      $(".guide_cnt").innerHTML='숫자로 입력해주세요.';
      cntCk=false;
   }
   else{
      $(".guide_cnt").innerHTML='';
      cntCk=true;
   }
   
   if(!isNaN(sale)){   // 세일이 문자라면
      $(".guide_sale").innerHTML='숫자로 입력해주세요.';
      saleCk=false;
   }
   
   else{
      if(price<1){
         $(".guide_sale").css('display','none'); // class = warn_sale의 css를 'display','none'으로 수정
         saleCk=true;
      }
      else{
         $(".guide_sale").innerHTML='1~100 사이의 숫자만 입력해주세요.';
         saleCk=false;
      }
   }
   
   // 유효성검사 2. 모든 폼이 true를 반환한 경우에만 제출되도록 함 (확인 완료) + 밑에 빈칸 유효성검사 확인 여부도 추가할 예정
   function smt(){
      if(priceCk && cntCk && saleCk){
         // alert('통과');
         productForm.submit();
      }
      else if(!priceCk || !cntCk || !saleCk){
         alert('가격, 재고, 세일 항목 중 문자로 입력된 부분이 있습니다. 숫자로 다시 입력해주세요.');         
         history.go(-1);   // 얘가 안 되고 그냥 바로 제출되어버리는데 원인이 뭘까요?
         return;
      }   
      else {
         alert('빈칸 없이 항목을 작성해주세요.');
         history.go(-1);
         return;
      }
   }
   */
   </script>
   <!-- 할인율 적용 끝 -->   

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