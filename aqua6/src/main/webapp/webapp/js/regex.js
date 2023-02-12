function validationCheck(){
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
         if (!emailReg.test(userEmail)) {
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
         console.log('로그(regex.js에서) phoneCheck : '+phoneCheck);
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

      /*
      //유효성 검사때 이용: 아직 쓸 지는 확실하지 않음
      var pastDefalutYear;
      var nowDefalutYear;
      var valNowYear1;
      var valNowYear2;
      var valPastYear1;
      var valPastYear2;
      function valYear(){ 
         var date = new Date();   // 현재 날짜 및 시간
         var nowYear = date.getFullYear();   // 현재년도
         var pastYear = date.getFullYear()-99;   // 현재년도-99
         
         pastDefalutYear = pastYear.substr(0, 1);
         nowDefalutYear = nowYear.substr(0, 1);
         valNowYear1 = nowYear.substr(2); //현재년도의 index=2, 3을 추출
         valNowYear2 = nowYear.substr(3); //현재년도의 index=2, 3을 추출
         valPastYear1 = pastYear.substr(2); //과거년도의 index=2, 3을 추출
         valPastYear2 = pastYear.substr(3); //과거년도의 index=2, 3을 추출
      }*/

      function validationId() {
         // 정규표현식 (특수문자 포함 여부 확인)
         const specialRule = /^[a-z]+[a-z0-9]{5,19}$/g;
         if (specialRule.test(document.getElementById("userId").value)) {
            document.getElementById("idCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("idCheckMent").style.color = 'green'
            // document.getElementById("idCheckMent").style.display = "none"
         } else {
            document.getElementById("idCheckMent").innerHTML = '영문자 또는 숫자 6~20자를 사용하세요.';
            document.getElementById("idCheckMent").style.color = 'red'
         }
      }

      function validationPw() {
         const specialRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
         if (specialRule.test(document.getElementById("password").value)) {
            document.getElementById("passwordCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("passwordCheckMent").style.color = 'green'
            // document.getElementById("idCheckMent").style.display = "none"
         } else {
            document.getElementById("passwordCheckMent").innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
            document.getElementById("passwordCheckMent").style.color = 'red'
         }
      }

      function validationCpw() {
         if (document.getElementById("password").value == document
               .getElementById("passwordCheck").value) {
            document.getElementById("passwordCheckMent2").innerHTML = '올바른 입력입니다.';
            document.getElementById("passwordCheckMent2").style.color = 'green'
            // document.getElementById("passwordCheckMent").style.display = "none"
            // document.getElementById("passwordCheckMent2").style.display = "none"
         } else {
            document.getElementById("passwordCheckMent2").innerHTML = '일치하지 않습니다.';
            document.getElementById("passwordCheckMent2").style.color = 'red'
         }
      }
      
      function validationName() {
         //const specialRule =  /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
         const specialRule = /^[가-힣a-zA-Z]+$/;
         if (specialRule.test(document.getElementById("userYear").value)) {
            document.getElementById("NameCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("NamerCheckMent").style.color = 'green'
            //document.getElementById("NameCheckMent").style.display = "none"
         } else {
            document.getElementById("NameCheckMent").innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
            document.getElementById("NameCheckMent").style.color = 'red'
         }
      }
      
      function validationYear() {
         //ver.1
         //const specialRule = new RegExp('^(' , `${pastDefalutYear}`, '[0-valPastYear1][0-valPastYear2]|', `${nowDefalutYear}`,'[0-valNowYear1][0-valNowYear2])$');               
         const specialRule = /^(19[0-9][0-9]|20\d{2})$/;
         if (specialRule.test(document.getElementById("userYear").value)) {
            document.getElementById("birthYearCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("birthYearCheckMent").style.color = 'green'
            //document.getElementById("passwordCheckMent").style.display = "none"
         } else if(document.getElementById("userYear")<1924||document.getElementById("userYear")>2008) {
            document.getElementById("birthYearCheckMent").innerHTML = '정확한 생년월일을 기입해주세요.';
            document.getElementById("birthYearCheckMent").style.color = 'red'
         } else {
            document.getElementById("birthYearCheckMent").innerHTML = '유효한 생년월일이 아닙니다.';
            document.getElementById("birthYearCheckMent").style.color = 'red'
         }
      }
      
      function validationDay() {
         const specialRule = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
         if (specialRule.test(document.getElementById("userDay").value)) {
            document.getElementById("birthDayCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("birthDayCheckMent").style.color = 'green'
            //document.getElementById("birthYearCheckMent").style.display = "none"
         } if(getElementById(("userMonth")==4||getElementById("userMonth")==6||getElementById("userMonth")==9||getElementById("userMonth")==11)&&day==31){
            document.getElementById("birthDayCheckMent").innerHTML = '정확한 날짜를 기입해주세요.';
            document.getElementById("birthDayCheckMent").style.color = 'red'
         } else {
            document.getElementById("birthDayCheckMent").innerHTML = '1일~31일 사이의 값을 입력해주세요';
            document.getElementById("birthDayCheckMent").style.color = 'red'
         }
      }
      
      function validationEmail() {
         const specialRule = /^([A-Za-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
         if (specialRule.test(document.getElementById("userEmail").value)) {
            document.getElementById("emailCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("emailCheckMent").style.color = 'green'
            // document.getElementById("emailCheckMent").style.display = "none"
         } else {
            document.getElementById("emailCheckMent").innerHTML = '올바르지 않은 이메일 형식입니다.';
            document.getElementById("emailCheckMent").style.color = 'red'
         }
      }

      function validationCertiNum() {
         /*var specialRule =  /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;*/
         /*다시만든 전화번호 정규식 (01로 시작하고 -는 있을수도 있고 없을수도 있음)*/
         const specialRule = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
         if (specialRule.test(document.getElementById("userPhoneNum").value)) {
            document.getElementById("phoneNumCheckMent").innerHTML = '올바른 입력입니다.';
            document.getElementById("phoneNumCheckMent").style.color = 'green'
            // document.getElementById("phoneNumCheckMent").style.display = "none"
            return true;
         } else {
            document.getElementById("phoneNumCheckMent").innerHTML = '형식에 맞지 않는 번호입니다.';
            document.getElementById("phoneNumCheckMent").style.color = 'red'
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
         // form 객체
         var loginForm = document.loginForm;
         // 정규표현식 (특수문자 포함 여부 확인)
         var specialRule = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
         if (!specialRule.test(document.getElementById("userId").value)) {
            alert("올바르지 않은 아이디입니다.");
            return false;
         }
         if (!specialRule.test(document.getElementById("password").value)) {
            alert("올바르지 않은 비밀번호입니다.");
            return false;
         }
         loginForm.submit();
      }