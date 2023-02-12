<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="icon" href="img/ms-icon-70x70.png">
<meta charset="UTF-8">
<title>Aquarium | 회원가입</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
   
   <form action="join.do" method="post" name="joinForm">
      <div class="member">
         <!-- 1. 로고 -->
         <a href="main.do"><img class="logo" src="img/logo.png"></a>

         <!-- 2. 필드(아이디,비밀번호,이름) -->
         <div class="field">
            <b>아이디</b> <span class="placehold-text">
            <input class="joinInput" id="userId" name="userId" type="text" onkeyup="validationId()" required>
            <button type="button" onclick="joinIdCheck()" style="background-color: #87CEEB;
          color: #fff; border: 1px solid #dadada; padding: 15px; width: 100%;
          margin-bottom: 5px;">아이디 중복확인</button>
          <input type="hidden" value="" onkeyup="joinIdCheck()" id="userIdCheck" name="userIdCheck">
             </span>
            <div id="idCheckMent"></div>
            <div id="idDoubleCheckMent"></div>
         </div>
         <div class="field">
            <b>비밀번호</b> <input class="joinInput" id="password" name="password" type="password"
               onkeyup="validationPw()">
         <div id="passwordCheckMent"></div>
         
         </div>
         <div class="field">
            <b>비밀번호 재확인</b> <input class="joinInput" id="passwordCheck" class="userpw-confirm"
               type="password" onkeyup="validationCpw()">
            <div id="passwordCheckMent2"></div>
         </div>
         <div class="field">
            <b>이름</b> <input class="joinInput" id="userName" name="userName" type="text" onkeyup="validationName()">
            <div id="nameCheckMent"></div>
         </div>

         <!-- 3. 필드(생년월일) -->
         <div class="field birth">
            <b>생년월일</b>
            <div class="tribox">
            <div>
               <input type="text" placeholder="년(4자)" class="joinInput" id="userYear" name="userYear" 
               maxlength="4" onkeyup="validationMonth()"> 
               
               <input type="text" placeholder="월(2자)" class="joinInput" id="userMonth" name="userMonth"
                  maxlength="2" onkeyup="validationDay()">
               
               <input type="text" placeholder="일" class="joinInput" id="userDay" name="userDay"
                  maxlength="2" onkeyup="validationDay()">
            </div>
            </div>
            <div id="birthCheckMent"></div>
         </div>

         <!-- 4. 이메일_전화번호 -->
         <div class="field">
            <b>이메일<small></small></b> <input type="email" placeholder="입력란"
               class="joinInput" id="userEmail" name="userEmail" onkeyup="validationEmail()">
            <div id="emailCheckMent"></div>
         </div>

         <div class="field tel-number">
            <b>휴대전화</b> <select>
               <option value="">대한민국 +82</option>
            </select>
            <div>
               <input type="tel" placeholder="전화번호 -없이 입력" class="joinInput" id="userPhoneNum" name="userPhoneNum"
                  onkeyup="validationCertiNum()"> <input type="button"
                  value="인증번호 받기" onkeyup="validationCertiNum()" id="phoneChk" name="phoneChk" >
                  <input type="hidden" id="check" name="check" value="2">
            </div>
            <div id="phoneNumCheckMent"></div> <%--인증번호 html 수정함. --%>
            <input type="text" placeholder="전화번호 입력후 인증번호 받기를 해주세요" class="joinInput" id="userCheck" name="userCheck" readonly>
            <input type="button" value="인증번호 확인" onkeyup="validationCertiNum()" class="joinInput" id="phoneChk2" name="phoneChk2" >
            <input type="hidden" class="joinInput" id="phoneCheck" name="phoneCheck" value="">
         </div>

         <!-- 5. 가입하기 버튼 -->
         <input type="button" value="가입하기"  onclick="validationCheck()">

         <!-- 6. 푸터 -->
            <lee:modal />
      </div>
   </form>
   
   
   <script src="js/regex.js"></script>
   <script src="js/modal.js"></script>
   
   <%--문자API JS--%>
   <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
   <script type="text/javascript">
   function joinIdCheck(){
      var userIdCheck = 0;
      
      console.log('로그 1 : check()라는 JS 함수가 연결되었음');
      var id=$('#userId').val(); 
      console.log('id: '+id);
      $.ajax({
         type: 'POST',
         url: 'joinIdCheck',
         data: {userId:id},
         success: function(result){
            console.log('로그 2 : 응답받은 데이터( == response.getWriter() == out ) 출력');
            console.log(result);
            if(result==1){
               alert('사용 가능한 아이디입니다!');
               userIdCheck = 1 ;
               $("#userIdCheck").prop("value",userIdCheck);
            }
            else if(result==2){
               alert("아이디를 작성하세요.");
                $("#userIdCheck").prop("value",userIdCheck);
            }
            else{
               alert('이미 중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요.');
               
               $("#userIdCheck").prop("value",userIdCheck);
            }
         },
         error: function(request, status, error){
            console.log(request);
            console.log(status);
            console.log(error);
         }
      });
   }
</script>


   <script type="text/javascript">
      var number=0;  //랜덤문자인증번호 저장할 변수   
       var phoneCheck=0;  //인증번호 일치(1), 불일치 변수(0)
       
      //인증번호 전송하기: sms()phoneChk
      $("#phoneChk").click(function(){
          console.log('로그 : 인증번호받기 JS함수 실행되었음');
          var userPhoneNum = $("#userPhoneNum").val();
          console.log('로그 userPhoneNum : '+userPhoneNum);
          var check = $("#check").val();
          console.log('로그 check : '+check);
          
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
                console.log("로그 인증번호(randNum) : "+randNum);
                if(randNum == 0 ){
                   alert("인증번호 전송이 불가합니다. 관리자에게 문의해주세요."); 
                } 
                else if(randNum == 1){
                   
                   alert("이미 사용중인 전화번호 입니다. 다시 입력해주세요.");
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