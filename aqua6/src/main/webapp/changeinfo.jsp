<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="icon" href="img/ms-icon-70x70.png">
<meta charset="UTF-8">
<title>Aquarium | 회원수정</title>

<link rel="stylesheet" href="css/modal.css" type="text/css">
<link rel="stylesheet" href="css/join.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>


   <form action="myUpdate.do" method="post" name="joinForm">
      <div class="member">
         <!-- 1. 로고 -->
         <a href="main.do"><img class="logo" src="img/logo.png"></a>
		<!-- 2. 필드(이름,비밀번호,아이디) -->
         <div class="field">
            <b>아이디</b> <span class="placehold-text"><input id="userId" name="userId" type="text" value="${member.memberId}" onkeyup="validationId()" readonly> </span>
         </div>
         <div class="field">
            <b>비밀번호</b> <input id="password" name="password" class="userpw" type="password" onkeyup="validationPw()">
            <div id="passwordCheckMent"></div>
         </div>
         <div class="field">
            <b>비밀번호 재확인</b> <input id="passwordCheck" name="passwordCheck" class="userpw-confirm" type="password" onkeyup="validationCpw()">
            <div id="passwordCheckMent2"></div>
         </div>
         <div class="field">
            <b>이름</b> <input type="text" id="userName" name="userName" value="${member.memberName}" readonly>
         </div>

         <!-- 3. 필드(생년월일) -->
         <div class="field birth">
            <b>생년월일</b>
            <div>
               <input type="text" id="userYear" name="userYear" value="${member.birthyy}" > 
               <input type="text" id="userMonth" name="userMonth" value="${member.birthmm}" > 
               <input type="text" id="userDay" name="userDay" value="${member.birthdd}" >
            </div>
         </div>

         <!-- 5. 이메일_전화번호 -->
         <div class="field">
            <b>이메일<small></small></b> <input type="email" value="${member.memberEmail}"
               id="userEmail" name="userEmail" onkeyup="validationEmail()">
            <div id="emailCheckMent"></div>
         </div>

         <div class="field tel-number">
            <b>휴대전화</b> <select>
               <option value="">대한민국 +82</option>
            </select>
            <div>
               <input type="tel" placeholder="전화번호 입력" id="userPhoneNum" name="userPhone" value="${member.memberPhone}"
                  onkeyup="validationCertiNum()"> <input type="button"
                  value="인증번호 받기" onkeyup="validationCertiNum()" id="phoneChk" name="phoneChk" >
                  <input type="hidden" id="check" name="check" value="3">
            </div>
            <div id="phoneNumCheckMent"></div> <%--인증번호 html 수정함. --%>
            <input type="text" placeholder="전화번호 입력후 인증번호 받기를 해주세요" id="userCheck" name="userCheck" readonly>
            <input type="button" value="인증번호 확인" onkeyup="validationCertiNum()" id="phoneChk2" name="phoneChk2" >
            <input type="hidden" id="phoneCheck" name="phoneCheck" value="">
         </div>
         <input type="hidden" value="${member.memberAthu}"name="memberAthu">

         <!-- 6. 변경하기 버튼 -->
          <input type="hidden" id="go" name="go" value="1">
         <input type="button" value="변경하기" onclick="validationCheck()">
      </div>
   </form>
   
   
   <script src="js/mUpdate.js"></script>
   <script src="js/modal.js"></script>
   
   <%--문자API JS--%>
   <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
   <script type="text/javascript">
   function joinIdCheck(){
      console.log('로그 1 : check()라는 JS 함수가 연결되었음');
      var id=$('#userId').val(); 
     
      $.ajax({
         type: 'POST',
         url: 'joinIdCheck',
         data: {userId:id},
         success: function(result){
            
            console.log(result);
            if(result==1){
               alert('사용 가능한 아이디입니다!');
            }
            else{
               alert('이미 중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요.');
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
             data: {userPhoneNum:userPhoneNum, check : check},
             success: function(randNum){
               
                if(randNum == 0 ){
                   alert("인증번호 전송이 불가합니다. 관리자에게 문의해주세요."); 
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
          
          //SmsCheck서블릿클래스로 이동
          $.ajax({
             type: 'POST',
             url: 'SmsCheck',
             data: {randNum:number, checkNum:checkNum},
             success: function(result){
               
                if(result == "1"){
                   alert("인증번호가 일치합니다!");
                   phoneCheck = 1;  //인증번호 일치
                   $("#phoneCheck").prop("value",phoneCheck);
                
                } 
                else{
                  
                   alert("인증번호가 일치하지 않습니다.다시 입력하세요!");  //인증번호 불일치
                   $("#phoneCheck").prop("value",phoneCheck);
                   
                }
                
             }
          })
          
          
       });
       
       
   </script>
   
   
</body>
</html>