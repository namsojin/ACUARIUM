<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>상품목록</span>
						</div>
						<ul>
							<li><a href="shopGrid.do">전체</a></li>
							<li><a href="shopGrid.do?category=watertank">수조</a></li>
							<li><a href="shopGrid.do?category=feed">사료</a></li>
							<li><a href="shopGrid.do?category=cleaning">청소용품</a></li>
							
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="search.do">
								<input type="text" name="searchName" placeholder="검색어를 입력해주세요.">
								<button type="submit" class="site-btn" >검색</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>010.1234.1234</h5>
								<span>09:00 ~ 19:00</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
