<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="icon" href="img/ms-icon-70x70.png">
<meta charset="UTF-8">
<title>Aquarium | 아이디찾기</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
body {
   background-color: #ffffff;
}
</style>
</head>
<body>
 
      <div class="member">
         <!-- 로고 -->
         <a href="logout.do"><img class="logo" src="img/logo.png"></a>

         <div class="field tel-number">
            <h3 style="text-align: center;">${memberName}님이
               가입하신 아이디는 <a href="loginMove.do"><strong
                  style="color: skyblue;">${memberId}</a></strong> 입니다.
            </h3>
            <br> <br>
         
         </div>
         
         <!-- 푸터 -->
         <center><lee:modal /><center>
      </div>
   
   <script src="js/regex.js"></script>
   <script src="js/modal.js"></script>

</body>
</html>