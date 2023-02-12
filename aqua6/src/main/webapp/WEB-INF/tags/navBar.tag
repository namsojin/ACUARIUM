<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="admin.do" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <!-- 검색 버튼 추가 -->
                <form class="d-none d-md-flex ms-4" action="#none">
                    <input class="form-control border-0" type="search" placeholder="검색입력" disabled>
                    <input type="submit" class="btn btn-sm btn-primary"  value="검색" disabled>
                </form>
                <div class="navbar-nav align-items-center ms-auto">
               
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/contact/minho40px.png" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">${member.memberName}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                           
                             <!-- 로그아웃시 메인페이지로 이동 추가 -->
                            <a href="logout.do" class="dropdown-item">로그아웃</a>
                        </div>
                    </div>
                </div>
            </nav>