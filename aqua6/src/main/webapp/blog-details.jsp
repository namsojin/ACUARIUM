<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" href="img/ms-icon-70x70.png">
<title>Aquarium | 공지사항 내용</title>

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

    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="img/details-hero.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${board.boardTitle}</h2>
                        <ul>
                            <li>작성자: ${board.memberId}</li>
                            <li>${board.boardDate}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                       <div class="blog__sidebar__search">
							<form action="blog.do" method="post">
								<input type="text" name="search" placeholder="검색어를 입력해주세요">
								<button type="submit" >
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
                       <div class="blog__sidebar__item">
                            <h4>고객센터</h4>
                            <ul>
                                <li><a href="leaveMsgMove.do">1:1 문의</a></li>
                                <li><a href="blog.do">공지사항</a></li>
                                <!-- 
                                <li><a href="#" class="disabled">취소/반품 안내</a></li>
                                 -->
                            </ul>
                        </div>                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1"> 
                    <div class="blog__details__text">
                        <br>
                        <p>${board.boardContent}</p>
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                               <%-- 선택: 권한이 admin인 경우 blogChange 페이지로 이동하도록 함
                               <c:if test="${memberAthu=='admin'}">
                               <form action="blogChange.do">
                                  <button type="submit">수정</button>
                               </form>
                               </c:if>
                               --%>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

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