//정규식은 나중에 해결하겠습니다. (생년월일 while문 해결법)
function validationCheck() {
   const userId = document.getElementById("userId").value;
   if (userId == '') {
      alert("아이디를 입력해주세요.");
      return;
   }


   const password = document.getElementById("password").value;
   if (password == '') {
      alert("비밀번호를 입력해주세요.");
      return;
   }


   const passwordCheck = document.getElementById("passwordCheck").value;
   if (passwordCheck == '') {
      alert("비밀번호를 재입력해주세요.");
      return;
   }
   if (password != passwordCheck) {
      alert("동일한 비밀번호를 입력해주세요.");
      return;
   }
 

   const userName = document.getElementById("userName").value;
   if (userName == '') {
      alert("이름을 입력해주세요.");
      return;
   }

   const userYear = document.getElementById("userYear").value;
   if (userYear == '') {
      alert("생년월일을 입력해주세요.");
      return;
   }


   const userMonth = document.getElementById("userMonth").value;
   if (userMonth == '') {
      alert("생년월일을 입력해주세요.");
      return;
   }
   

   const userDay = document.getElementById("userDay").value;
   if (userDay == '') {
      alert("생년월일 입력해주세요.");
      return;
   }


   const userEmail = document.getElementById("userEmail").value;
   if (userEmail == '') {
      alert("이메일을 입력해주세요.");
      return;
   }


   const userPhoneNum = document.getElementById("userPhoneNum").value;
   if (userPhoneNum == '') {
      alert("전화번호를 입력해주세요.");
      return;
   }

   const userCheck = document.getElementById("userCheck").value;
   if (userCheck == '') {
      alert("인증번호를 입력해주세요.");
      return;
   }
   /*문자API 인증번호체크 위해 추가하였음. */
   const phoneCheck = document.getElementById("phoneCheck").value;
   console.log('로그(regex.js에서) phoneCheck : ' + phoneCheck);
   console.log(typeof phoneCheck);
   if (phoneCheck != 1) {
      alert("인증번호를 확인해주세요.");
      return;
   }

   /*전화번호 정규식이 false라면 알러트 뜨고 진행안됌*/
   if (!validationCertiNum()) {
      alert("전화번호를 확인해 주세요.");
      return;
   }

   document.joinForm.submit();

}

		var elems=document.querySelectorAll('.joinInput');//class에서 여러개 받아옴
		for(var i=0;i<elems.length;i++){
			elems[i].onfocus=function(){//클릭 효과 냄
				this.style.borderColor='skyblue'; 
			}
			elems[i].onblur=function(){
				this.style.bordergroundColor='transparent';
			}
		}
		
		

		function validationPw() {
			const specialRule = /(?=.*\d\S{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
			if (specialRule.test(document.getElementById("password").value)) {
				document.getElementById("passwordCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("passwordCheckMent").style.color = 'green';
				// document.getElementById("idCheckMent").style.display = "none";
			} else {
				document.getElementById("passwordCheckMent").innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
				document.getElementById("passwordCheckMent").style.color = 'red';
			}
		}

		function validationCpw() {
			if (document.getElementById("password").value == document
					.getElementById("passwordCheck").value) {
				document.getElementById("passwordCheckMent2").innerHTML = '올바른 입력입니다.';
				document.getElementById("passwordCheckMent2").style.color = 'green';
				// document.getElementById("passwordCheckMent").style.display = "none"
				// document.getElementById("passwordCheckMent2").style.display = "none"
			} else {
				document.getElementById("passwordCheckMent2").innerHTML = '일치하지 않습니다.';
				document.getElementById("passwordCheckMent2").style.color = 'red';
			}
		}
		
		function validationName() {
			//const specialRule =  /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			const specialRule = /^[가-힣a-zA-Z]{2,30}$/;
			if (specialRule.test(document.getElementById("userName").value)) {
				document.getElementById("nameCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("nameCheckMent").style.color = 'green';
				//document.getElementById("NameCheckMent").style.display = "none"
			} else {
				document.getElementById("nameCheckMent").innerHTML = '한글/영문만 이용해서 입력해주세요.';
				document.getElementById("nameCheckMent").style.color = 'red';
			}
		}
		
		function validationYear(){
			const specialRule = /^(19[2][3-9]|19[3-9][0-9]|20[0][0-9]|20[1][0-1])$/; //12세~100세 사이 나이만 허용  
			if (specialRule.test(document.getElementById("userYear").value)) {
				document.getElementById("birthCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("birthCheckMent").style.color = 'green';
				//document.getElementById("passwordCheckMent").style.display = "none"
			} else {
				document.getElementById("birthCheckMent").innerHTML = '정확한 생년월일을 입력해주세요.';
				document.getElementById("birthCheckMent").style.color = 'red';
			}
		}
		
		function validationMonth(){
			const specialRule = /^([1-9]|1[0-2])$/;   
			if (specialRule.test(document.getElementById("userMonth").value)) {
				document.getElementById("birthCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("birthCheckMent").style.color = 'green';
				//document.getElementById("passwordCheckMent").style.display = "none"
			} else {
				document.getElementById("birthCheckMent").innerHTML = '정확한 생년월일을 입력해주세요.';
				document.getElementById("birthCheckMent").style.color = 'red';
			}
		}
		
		function validationDay(){
			const specialRule = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if (specialRule.test(document.getElementById("userDay").value)) {
				document.getElementById("birthCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("birthCheckMent").style.color = 'green';
			} else {
				document.getElementById("birthCheckMent").innerHTML = '정확한 생년월일을 입력해주세요.';
				document.getElementById("birthCheckMent").style.color = 'red';
			}
		}
		
		function validationEmail() {
			const specialRule = /^([A-Za-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (specialRule.test(document.getElementById("userEmail").value)) {
				document.getElementById("emailCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("emailCheckMent").style.color = 'green';
				// document.getElementById("emailCheckMent").style.display = "none"
			} else {
				document.getElementById("emailCheckMent").innerHTML = '올바르지 않은 이메일 형식입니다.';
				document.getElementById("emailCheckMent").style.color = 'red';
			}
		}

		function validationCertiNum() {
			/*var specialRule =  /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;*/
			/*다시만든 전화번호 정규식 (01로 시작하고 -는 있을수도 있고 없을수도 있음)*/
			const specialRule = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
			if (specialRule.test(document.getElementById("userPhoneNum").value)) {
				document.getElementById("phoneNumCheckMent").innerHTML = '올바른 입력입니다.';
				document.getElementById("phoneNumCheckMent").style.color = 'green';
				// document.getElementById("phoneNumCheckMent").style.display = "none"
				return true;
			} else {
				document.getElementById("phoneNumCheckMent").innerHTML = '형식에 맞지 않는 번호입니다.';
				document.getElementById("phoneNumCheckMent").style.color = 'red';
				return false;
			}
		}
		
		 function login() {

		//빈칸 유효성 검사
         const userId = document.getElementById("userId").value;
         if (userId == '') {
            alert("아이디를 입력해주세요.");
            return;
         }
         
         const password = document.getElementById("password").value;
         if (password == '') {
            alert("비밀번호를 입력해주세요.");
            return;
         }
         
         var loginForm = document.loginForm;
         
         /*
         //member객체의 userId가 비어있는 경우
         if (userId == '') {
            alert("잘못된 아이디입니다.");
            return;
         }
         //member객체의 password가 비어있는 경우
         else if(userPw == '') {
            alert('잘못된 비밀번호입니다.');
         	return;
         }
         //member에 객체가 성공적으로 들어간 경우
         else{
			alert('로그인을 성공하였습니다.');
		*/	
		 loginForm.submit();

      }