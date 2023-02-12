<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="icon" href="img/ms-icon-70x70.png">
<meta charset="UTF-8">
<title>Aquarium | 회원가입</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
</head>
<body>
	
	<form action="join.do" method="post" name="joinForm">
		<div class="member">
			<!-- 1. 로고 -->
			<a href="main.do"><img class="logo" src="img/logo.png"></a>

			<!-- 2. 필드 -->
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input id="userId" name="userId"
					type="text" onkeyup="validationId()"></span>
				<div id="idCheckMent"></div>
			</div>
			<div class="field">
				<b>비밀번호</b> <input id="password" name="password" class="userpw" type="password"
					onkeyup="validationPw()">
				<div id="passwordCheckMent"></div>
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input id="passwordCheck" class="userpw-confirm"
					type="password" onkeyup="validationCpw()">
				<div id="passwordCheckMent2"></div>
			</div>
			<div class="field">
				<b>이름</b> <input type="text" id="userName" name="userName">
			</div>

			<!-- 3. 필드(생년월일) -->
			<div class="field birth">
				<b>생년월일</b>
				<div>
					<input type="text" placeholder="년(4자)" id="userYear" name="userYear" min="1923"
						max="2022" maxlength="4"> <select id="userMonth" name="userMonth">
						<option value="">월</option>
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select> <input type="text" placeholder="일" id="userDay" name="userDay" min="1" max="31"
						maxlength="2">
				</div>
			</div>

			<!-- 5. 이메일_전화번호 -->
			<div class="field">
				<b>이메일<small></small></b> <input type="email" placeholder="입력란"
					id="userEmail" name="userEmail" onkeyup="validationEmail()">
				<div id="emailCheckMent"></div>
			</div>

			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" placeholder="전화번호 입력" id="userPhoneNum" name="userPhoneNum"
						onkeyup="validationCertiNum()"> <input type="button"
						value="인증번호 받기" onkeyup="validationCertiNum()" id="phoneChk" name="phoneChk" >
				</div>
				<div id="phoneNumCheckMent"></div> <%--인증번호 html 수정함. --%>
				<input type="text" placeholder="전화번호 입력후 인증번호 받기를 해주세요" id="userCheck" name="userCheck" readonly>
				<input type="button" value="인증번호 확인" onkeyup="validationCertiNum()" id="phoneChk2" name="phoneChk2" >
				<input type="hidden" id="phoneCheck" name="phoneCheck" value="">
			</div>

			<!-- 6. 가입하기 버튼 -->
			<input type="button" value="가입하기"  onclick="validationCheck()">

			<!-- 7. 푸터 -->
			<a href="terms.jsp">이용약관 |</a>
			<a >개인정보 처리방침 |</a>
			<lee:modal />
		</div>
	</form>
	
	
	<script src="js/regex.js"></script>
	<script src="js/modal.js"></script>
	
	<%--문자API JS--%>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var number=0;  //랜덤문자인증번호 저장할 변수	
	    var phoneCheck=0;  //인증번호 일치(1), 불일치 변수(0)
	    
	   //인증번호 전송하기: sms()phoneChk
	   $("#phoneChk").click(function(){
	    	console.log('로그 : 인증번호받기 JS함수 실행되었음');
	    	var userPhoneNum = $("#userPhoneNum").val();
	    	console.log('로그 userPhoneNum : '+userPhoneNum);
	    	
	    	if(validationCertiNum()==false){
	    		alert("전화번호를 입력하세요!");
	    	}
	    	else{
	    	//Sms서블릿클래스로 이동함.
	    	$.ajax({
	    		type: 'POST',
	    		url: 'Sms',
	    		data: {userPhoneNum:userPhoneNum},
	    		success: function(randNum){
	    			console.log("로그 인증번호(randNum) : "+randNum);
	    			if(randNum == 0 ){
	    				alert("인증번호 전송이 불가합니다. 관리자에게 문의해주세요."); 
	    			} 
	    			else{
	    				alert("인증번호 전송이 완료되었습니다!");
	    				$("#userCheck").prop("readonly",false);
	    				$("#userPhoneNum").prop("readonly",true);
	    				number = randNum; 
	    				console.log("로그 인증번호(number) : "+number);
	    			}
	    			
	    		}
	    	})
	      }	
	    });
	    
	  //인증번호 비교: smsCheck()
	   $("#phoneChk2").click(function(){
	    	console.log('로그 : 인증번호체크 JS 함수 실행되었음');
	    	console.log('로그1 phoneCheck(유효성검사) : '+phoneCheck);
	    	console.log(typeof phoneCheck);
	    	var checkNum = $("#userCheck").val();
	    	console.log('로그(사용자가 입력한 값) checkNum : '+checkNum);
	    	
	    	//SmsCheck서블릿클래스로 이동
	    	$.ajax({
	    		type: 'POST',
	    		url: 'SmsCheck',
	    		data: {randNum:number, checkNum:checkNum},
	    		success: function(result){
	    			console.log("로그 result : "+result);
	    			console.log(typeof result);
	    			if(result == "1"){
	    				alert("인증번호가 일치합니다!");
	    				phoneCheck = 1;  //인증번호 일치
	    				console.log("로그2(일치) phoneCheck : "+phoneCheck );
	    				$("#phoneCheck").prop("value",phoneCheck);
	    			
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
	
	
</body>
</html>