<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/ms-icon-70x70.png">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- 클래식 에디터 -->
   <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
   
   
<title>Aquarium | 1:1문의</title>

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

<!-- 넓이 높이 조절 -->
   <style>
   .ck.ck-editor {
       max-width: 100%;
   }
   .ck-editor__editable {
       min-height: 200px;
   }
   </style>

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
						<h2>1:1 문의</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
   <!-- Breadcrumb Section End -->


   <!-- 문의하기 Begin -->
   <div class="contact-form spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="contact__form__title">
                  <h2>관리자에게 문의하기</h2>
                  <h6>궁금하신 점을 남겨주시면 접수 순서대로 답변 드리겠습니다.</h6>
               </div>
            </div>
         </div>
         <form action="leaveMsg.do" >
            <div class="row">
               <div class="col-lg-6 col-md-6">
                  <input type="text" name="title" placeholder="제목을 입력해주세요." required>
               </div>
               <div class="col-lg-6 col-md-6">
                  <input type="text" name="email" placeholder="이메일을 입력해주세요." required>
               </div>
               <div class="col-lg-12 text-center">
                  <textarea placeholder="문의 내용 입력해주세요." name="content" id="classic"></textarea>
                  <button type="submit" class="site-btn" style="margin-top:30px;">문의하기</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- 문의하기 End -->

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
        ClassicEditor
            .create( document.querySelector( '#classic' ))
            .catch( error => {
                console.error( error );
            } );
    </script>

</body>
</html>