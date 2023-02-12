<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Admin | 회원 정보변경/삭제</title>
<!-- Favicon -->
<link rel="icon" href="img/ms-icon-70x70.png">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

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
         ans = confirm("정말 삭제할까요?");
         if (ans == true) {
            document.form.action.value = "/memberDelete.do";
            document.form.submit();
         } else {
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
                  <h6 class="mb-4">회원정보 수정</h6>

                  <form name="changeform" action="memberUpdate.do" method="post">
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="userId"
                              name="userId" placeholder="아이디" value="${member.memberId}" readonly>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-10">
                           <input type="password" class="form-control" id="password"
                              name="password"  value="${member.memberPw}" onkeyup="validationPw()" placeholder="비밀번호">
                        </div>
                        <div id="passwordCheckMent"></div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="userName"
                              name="userName" onkeyup="validationName()" placeholder="이름"
                              value="${member.memberName}">
                        </div>
                        <div id="nameCheckMent"></div>
                     </div>
                     
                     <div class="field birth">
            <div>
               <label for="inputEmail3" class="col-sm-2 col-form-label">생년월일</label>
               <input type="text" placeholder="출생년" id="userBirth" name="userYear" value="${member.birthyy}" style="padding: 0.375rem 0.75rem; border: 1px solid #ced4da; border-radius: 5px;"> 
               <input type="text" placeholder="출생월" id="userBirth" name="userMonth" value="${member.birthmm}" style="padding: 0.375rem 0.75rem; border: 1px solid #ced4da; border-radius: 5px;"> 
               <input type="text" placeholder="출생일" id="userBirth" name="userDay" value="${member.birthdd}" style="padding: 0.375rem 0.75rem; border: 1px solid #ced4da; border-radius: 5px;">
            </div>
         </div>
                     
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label"style="margin-top:20px;">이메일</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="userEmail"
                              name="userEmail" onkeyup="validationEmail()" placeholder="이메일"
                              value="${member.memberEmail}" style="margin-top:15px;">
                        </div>
                        <div id="emailCheckMent"></div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="userPhoneNum"
                              name="userPhoneNum" onkeyup="validationCertiNum()"
                              placeholder="전화번호" value="${member.memberPhone}">
                        </div>
                        <div id="phoneNumCheckMent"></div>
                     </div>
                     <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">권한</label>
                        <div class="col-sm-10">
                           <input type="text" class="form-control" id="userAthu"
                              name="userAthu" value="${member.memberAthu}">
                        </div>
                     </div>
                     <div class="row mb-3">

                        <div class="col-sm-10">
                           <div class="form-check"></div>
                        </div>
                        <div class="col-sm-6 ">
                           <input type="submit" value="회원정보수정" class="btn btn-primary"
                              onClick="validationCheck()" style="float: right;">
                        </div>
                        <div class="col-sm-6">
                           <input type="button" value="회원정보삭제" class="btn btn-primary"
                              onClick="del()">
                        </div>
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
   <script type="text/javascript">
      function validationCheck() {
         const password = document.getElementById("password").value;
         if (password == '') {
            alert("비밀번호를 입력해주세요.");
            return;
         }
         <%--
         const passwordCheck = document.getElementById("passwordCheck").value;
         if (passwordCheck == '') {
            alert("비밀번호를 재입력해주세요.");
            return;
         }
         if (password != passwordCheck) {
            alert("동일한 비밀번호를 입력해주세요.");
            return;
         }
         --%>
         const userName = document.getElementById("userName").value;
         if (userName == '') {
            alert("이름을 입력해주세요.");
            return;
         }

         const userBirth = document.getElementById("userBirth").value;
         if (userBirth == '') {
            alert("생년월일을 입력해주세요.");
            return;
         }
         // 없는 벨류를 받아오라고 하면 에러가 발생하며 진행되지 않음
         /*const userMonth = document.getElementById("userMonth").value;
         if (userMonth == '') {
            alert("생년월일을 입력해주세요.");
            return;
         }

         const userDay = document.getElementById("userDay").value;
         if (userDay == '') {
            alert("생년월일 입력해주세요.");
            return;
         }*/

         const gender = document.getElementsByName("gender");
         if (!gender[0].checked && !gender[1].checked) {
            alert("성별을 선택해주세요.");
            return;
         }

         const emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
         const userEmail = document.getElementById("userEmail").value;
         if (!emailReg.test(userEmail)) {
            alert("이메일을 입력해주세요.");
            return;
         }

         const userPhoneNum = document.getElementById("userPhoneNum").value;
         if (userPhoneNum == '') {
            alert("전화번호를 입력해주세요.");
            return;
         }

         /*const userCheck = document.getElementById("userCheck").value;
         if (userCheck == '') {
            alert("인증번호를 입력해주세요.");
            return;
         }*/
         /*전화번호 정규식이 false라면 알러트 뜨고 진행안됌*/
         if (!validationCertiNum()) {
            alert("전화번호를 확인해 주세요.");
            return;
         }

         document.changeform.submit();

      }

      function validationPw() {
         var specialRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
         if (specialRule.test(document.getElementById("password").value)) {
            document.getElementById("passwordCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("passwordCheckMent").style.color = 'green'
         } else {
            document.getElementById("passwordCheckMent").innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
            document.getElementById("passwordCheckMent").style.color = 'red'
         }
      }

      function validationCpw() {
         if (document.getElementById("password").value == document
               .getElementById("passwordCheck").value) {
            document.getElementById("passwordCheckMent").style.display = "none"
            document.getElementById("passwordCheckMent2").style.display = "none"
         } else {
            document.getElementById("passwordCheckMent2").innerHTML = '일치하지 않습니다.';
            document.getElementById("passwordCheckMent2").style.color = 'red'
         }
      }
      function validationName() {
         var specialRule = /^[가-힣]{2,6}$/;
         if (specialRule.test(document.getElementById("userName").value)) {
            document.getElementById("nameCheckMent").style.display = "none"
         } else {
            document.getElementById("nameCheckMent").innerHTML = '올바르지 않은 이름 형식입니다.';
            document.getElementById("nameCheckMent").style.color = 'red'
         }
      }
      function validationEmail() {
         var specialRule = /^([A-Za-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
         if (specialRule.test(document.getElementById("userEmail").value)) {
            document.getElementById("emailCheckMent").style.display = "none"
         } else {
            document.getElementById("emailCheckMent").innerHTML = '올바르지 않은 이메일 형식입니다.';
            document.getElementById("emailCheckMent").style.color = 'red'
         }
      }
      function validationBirth() {
         var specialRule = /^[0-9]{4}-[0-9]{2}-[0-9]{2}/;
         if (specialRule.test(document.getElementById("userBirth").value)) {
            document.getElementById("birthCheckMent").style.display = "none"
            return true;
         } else {
            document.getElementById("birthCheckMent").innerHTML = '생년월일은 ????-??-??의 형식으로 작성해주세요.';
            document.getElementById("birthCheckMent").style.color = 'red'
            return false;
         }
      }

      function validationCertiNum() {
         /*var specialRule =  /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;*/
         /*다시만든 전화번호 정규식 (01로 시작하고 -는 있을수도 있고 없을수도 있음)*/
         var specialRule = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
         if (specialRule.test(document.getElementById("userPhoneNum").value)) {
            document.getElementById("phoneNumCheckMent").style.display = "none"
            return true;
         } else {
            document.getElementById("phoneNumCheckMent").innerHTML = '형식에 맞지 않는 번호입니다.';
            document.getElementById("phoneNumCheckMent").style.color = 'red'
            return false;
         }
      }
      function del() {
         ans = confirm("정말 삭제할까요?");
         if (ans == true) {
            document.form.action.value = "delete";
            document.form.submit();
         } else {
            return;
         }
      }
   </script>
</body>

</html>