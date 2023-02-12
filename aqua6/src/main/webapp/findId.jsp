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
</head>
<body>

	<form method="post" name="idfindscreen">
		<div class="member">
			<!-- 로고 -->
			<a href="main.do"><img class="logo" src="img/logo.png"></a>
			<form id="contact">
			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" placeholder="전화번호 -없이 입력" class="joinInput"
						id="userPhoneNum" name="userPhoneNum"
						onkeyup="validationCertiNum()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required> <input type="button"
						value="인증번호 받기" onkeyup="validationCertiNum()" id="phoneChk"name="phoneChk" style="cursor :pointer;">
						<input type="hidden" id="check" name="check" value="1">
				</div>
				<div id="phoneNumCheckMent"></div>
				<%--인증번호 html 수정함. --%>
				<input type="text" placeholder="전화번호 입력후 인증번호 받기를 해주세요" class="joinInput" id="userCheck" name="userCheck" readonly>
				<input type="button" value="인증번호 확인" onkeyup="validationCertiNum()" class="joinInput" id="phoneChk2" name="phoneChk2" style="cursor :pointer;"> 
				<input type="hidden" class="joinInput" id="phoneCheck" name="phoneCheck" value="">
			</div>
			</form>
			<!-- 푸터 -->
			<lee:modal />
		</div>
	</form>
	<%--문자API JS--%>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	
	<script type="text/javascript">
      var number=0;  //랜덤문자인증번호 저장할 변수   
       var phoneCheck=0;  //인증번호 일치(1), 불일치 변수(0)
       
      //인증번호 전송하기: sms()phoneChk
      $("#phoneChk").click(function(){
          var userPhoneNum = $("#userPhoneNum").val();
          var check = $("#check").val();
         
          if(validationCertiNum()==false){
             alert("전화번호를 입력하세요!");
          }
          else{
          //Sms서블릿클래스로 이동함.
          $.ajax({
             type: 'POST',
             url: 'Sms',
             data: {userPhoneNum:userPhoneNum , check:check},
             success: function(randNum){
                if(randNum == 0 ){
                   alert("인증번호 전송이 불가합니다. 관리자에게 문의해주세요."); 
                } 
                else if(randNum == 1){
                	alert("가입되지 않은 전화번호 입니다. 다시 입력해주세요."); 
                	
                }
                else{
                   alert("인증번호 전송이 완료되었습니다!");
                   $("#userCheck").prop("readonly",false);
                   $("#userPhoneNum").prop("readonly",true);
                   number = randNum; 
                }
             }
          })
         }   
       });
       
     //인증번호 비교: smsCheck()
      $("#phoneChk2").click(function(){
        
          var checkNum = $("#userCheck").val();
         
         const userPhoneNum= $("#userPhoneNum").val();
          //SmsCheck서블릿클래스로 이동
          $.ajax({
             type: 'POST',
             url: 'SmsCheck',
             data: {randNum:number, checkNum:checkNum},
             success: function(result){
              
                if(result == "1"){
                   alert("인증번호가 일치합니다!");
                   phoneCheck = 1;  //인증번호 일치
                   console.log("로그2(일치) phoneCheck : "+phoneCheck );
                   $("#phoneCheck").prop("value",phoneCheck);
                   var link = 'findId.do?memberPhone=' + userPhoneNum;
					location.href = link;
                } 
                else{
                   console.log("로그3(불일치) phoneCheck : "+phoneCheck);
                   alert("인증번호가 일치하지 않습니다.다시 입력하세요!");  //인증번호 불일치
                   $("#phoneCheck").prop("value",phoneCheck);
                   
                }
             }
          })
       });
   </script>

	<script src="js/regex.js"></script>
	<script src="js/modal.js"></script>

</body>
</html>