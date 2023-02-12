<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer class="footer spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
               <div class="footer__about">
                  <div class="footer__about__logo">
                     <a href="main.do"><img src="img/logo.png" alt=""></a>
                  </div>
                  <ul>
                     <li>Address: 서울특별시 강남구 역삼동 736-7</li>
                     <li>Phone: 010.1234.1234</li>
                     <li>Email: aquarium@naver.com</li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
               <div class="footer__widget">
                  <h6>Useful Links</h6>
                  <ul>
                     <!-- footer 링크 -->
                     <li><a href="blog.do">고객센터</a></li>
                     <li><a href="leaveMsgMove.do">관리자 문의</a></li>

                  </ul>
                  <ul>
                     <li><a href="sitemap.do">사이트 맵</a></li>
                     <%-- <li><a href="checkOutMove.do">배송정보</a></li> --%>
                     <li><a href="contact.do">찾아오시는 길</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-4 col-md-12">
               <div class="footer__widget">
                  <h6>저희의 소식을 받아보세요!</h6>
                  <p>이메일을 작성해 주시면 새로운 아이들을 소개해 드릴게요.</p>
                  <form action="#">
                     <input type="text" placeholder="이메일을 입력해주세요" 
                     style="width: 100%; font-size: 16px; padding-left: 20px; color: #1c1c1c;
                     height: 46px; border: 1px solid #ededed;">
                     <button type="submit" class="site-btn" disabled>구독</button>
                  </form>
                  <div class="footer__widget__social">
                     <a href="https://www.facebook.com/coexaquarium"><i class="fa fa-facebook"></i></a>
                     <a href="https://instagram.com/aquariums.rs?igshid=YmMyMTA2M2Y="><i
                        class="fa fa-instagram"></i></a> <a
                        href="https://twitter.com/coexaquarium"><i class="fa fa-twitter"></i></a>
                      <c:if test="${member.memberAthu == 'admin' || member.memberAthu == 'ADMIN'}">
                      <a href="https://www.pinterest.co.kr/"><i
                        class="fa fa-pinterest"></i></a></c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>