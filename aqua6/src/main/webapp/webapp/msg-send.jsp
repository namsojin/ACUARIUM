<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
   <title>Admin | 문의답변</title>
     <!-- Favicon -->
    <link rel="icon" href="img/ms-icon-70x70.png">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/adminbootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/adminstyle.css" rel="stylesheet">
</head>

<body>

    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Sidebar Start -->
        	<lee:sideBar />
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <!-- NavBar Start -->
            	<lee:navBar />
            <!-- NavBar End -->


            <!-- Blank Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row vh-100 bg-light rounded align-items-center justify-content-center mx-0">
                    
                  
                  <div class="bg-light rounded h-100 p-4">
                   <form action="msgSend.do" method="post" name="sendForm">
                            <h6 class="mb-4">문의답변</h6>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">문의제목</span>
                                <input type="text" class="form-control" placeholder="제목" aria-label="Username"
                                    aria-describedby="basic-addon1" value="${msg.msgTitle}" id="msgTitle" name="msgTitle" readonly>
                                <input type="hidden" name="msgNum" value="${msg.msgNum}">    
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">문의이메일</span>
                                <input type="text" class="form-control" placeholder="이메일" aria-label="Username"
                                    aria-describedby="basic-addon1" value="${msg.msgEmail}" id="msgEmail" name="msgEmail" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">문의내용</span>
                                <textarea class="form-control" aria-label="With textarea" id="msgContent" name="msgContent" readonly>${msg.msgContent}</textarea>
                            </div>
                            
                            <br>
                            
                            <%-- MemberDeleteAction.java가 안 만들어져서 보낼 name이 설정되지 않은 상태 (form에 있는 것을 받아와야 함) --%>  
                            
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">문의답변제목</span>
                                <input type="text" class="form-control" placeholder="제목" aria-label="Username"
                                    aria-describedby="basic-addon1" id="msgReplyTitle" name="msgReplyTitle"  >
                               <input type="hidden" name="memberId" value="${member.memberId}">      
                            </div>
                            <%--
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">문의답변이메일</span>
                                <input type="text" class="form-control" placeholder="이메일" aria-label="Username"
                                    aria-describedby="basic-addon1" value="${member.memberId}" id="msgEmail" name="msgEmail" >
                            </div>
                             --%>
                            <div class="input-group mb-3">
                                <span class="input-group-text">문의답변</span>
                                <textarea class="form-control" aria-label="With textarea" id="msgReplyContent" name="msgReplyContent"></textarea>
                            </div>
                             <div class="input-group mb-3">
                              <div class="col-sm-6" style="padding-right:5px;" >
                                <button type="submit" class="btn btn-primary" style="float: right;" onClick="email()" id="replySend" name="replySend" >답장보내기</button>
                           </div>
                           <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary" onClick="del()" >문의내역삭제</button>
                           </div> 
                           </div>
                            </form>
                           </div>
                           
                           
                        </div>
                </div>
            </div>
            <!-- Blank End -->

            <!-- Footer Start -->
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/adminmain.js"></script>
    
   <!-- 문의글 삭제 -->  
   <script type="text/javascript">
        	function del(){
        		ans=confirm("정말 삭제할까요?");
        		if(ans==true){
        			//msgDelete.java 추가 안 된 상황임
        			document.form.action.value="/msgDelete.do";
        			document.form.submit();
        		}
        		else{ 
        			return;
        		}
        	}	
     </script> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>

</html>