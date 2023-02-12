<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="admin.do" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>AQUARIUM</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/contact/minho.png" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">이민호</h6>
                        <span>관리자</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="main.do" class="nav-item nav-link active"><i class="fa fa-snowman me-2"></i>판매페이지</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-barcode me-2"></i>상품관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="productList.do" class="dropdown-item">상품목록</a>
                            <a href="productChange.do" class="dropdown-item">상품 정보변경/삭제</a>
                            <a href="productInsertMove.do" class="dropdown-item">상품추가</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-user me-2"></i>회원관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="memberList.do" class="dropdown-item">회원목록</a>
                            <a href="memberChange.do" class="dropdown-item">회원 정보변경/삭제</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-bell me-2"></i>글관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="blogList.do" class="dropdown-item">공지글목록</a>
                            <a href="blogInsertMove.do" class="dropdown-item">공지글추가</a>
                            <a href="blogChange.do" class="dropdown-item">공지글수정/삭제</a>
                        </div>
                    </div>
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-comment me-2"></i>문의내역</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="msgList.do" class="dropdown-item">문의내역목록</a>
                            <a href="msgSendmove.do" class="dropdown-item">문의답변</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>