<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
* {
	font-family: 'malgun gothic';
}

#content.cols-d {
	width: 583px;
	min-width: 583px;
}

.f {
	position: relative;
	margin: 0;
	padding: 0;
	color: #666;
}

.f p {
	width: 100%;
	margin: 0 0 13px;
	font-size: 1.3em;
	text-align: center;
	margin-top: 20px;
}

.f p:after {
	content: "";
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
}

.f textarea {
	position: relative;
	width: 570px;
	height: 118px;
	min-height: 118px;
	padding: 3px 3px 3px 6px;
	border: 1px solid #ececec;
	border-top-color: #e1e1e1;
	border-left-color: #e1e1e1;
	background: #ececec;
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}

.scheme-g {
	margin: 26px 0 8px;
	padding: 0px;
	font-size: 1.2em;
	font-weight: 100;
}

.button_big {
	float: right;
	border: 0;
	border-radius: 3px;
	cursor: pointer;
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	line-height: 24px;
	margin-left: 5px;
	padding: 8px 16px;
	text-decoration: none;
	color: #fff;
	background: #0080ff;
	text-shadow: 1px 1px 1px #0066cc;
	-webkit-transition: all 0.2s ease-out;
}
h1{
	text-align: center;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#nextBtn").click(function() {
			if ($("#check_1").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
				return;
			} else if ($("#check_2").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
				return;
			} else if ($("#check_3").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
				return;
			} else {
				$("#terms_form").submit();
			}
		});
	});
</script>

</head>
<body>


	<article id="content" class="cols-d" style="margin:auto";>
		<div>
			<h1>AQUARIUM</h1>
			<form id="terms_form" class="f" action="join.jsp">
				<h4 class="scheme-g">AQUARIUM 이용약관 동의</h4>
				<textarea style="font-size: 1em;">여러분을 환영합니다.&#10;AQUARIUM 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.&#10;본 약관은 다양한 AQUARIUM 서비스의 이용과 관련하여 AQUARIUM 서비스를 제공하는 AQUARIUM 주식회사(이하 ‘AQUARIUM’)와 이를 이용하는 AQUARIUM 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 AQUARIUM 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.&#10;AQUARIUM 서비스를 이용하시거나 AQUARIUM 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
            </textarea>
				<p>
					<input type="checkbox" id="check_1" name="" /> 위의 약관에 동의 합니다.<br />
				</p>
				<h4 class="scheme-g">개인정보 수집 및 이용 동의</h4>
				<textarea style="font-size: 1em;">개인정보보호법에 따라 AQUARIUM에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.&#10;수집하는 개인정보 이용자는 회원가입을 하지 않아도 제품 검색, 생물 보기 등 대부분의 아쿠아리움 서비스를 회원과 동일하게 이용할 수 있습니다.&#10;이용자가 제품구매 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 아쿠아리움은 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
            </textarea>
				<p>
					<input type="checkbox" id="check_2" name="" /> 위의 약관에 동의 합니다.<br />
				</p>
				<h4 class="scheme-g">프로모션 정보 수신 동의</h4>
				<textarea style="font-size: 1em;">AQUARIUM에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(AQUARIUM앱 알림 또는 문자), 이메일로 받아보실 수 있습니다.&#10;일부 서비스(별도 회원 체계로 운영하거나 AQUARIUM 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.

            </textarea>
				<p>
					<input type="checkbox" id="check_3" name="" /> 위의 약관에 동의 합니다.<br />
					<input type="button" id="nextBtn" class="button_big"
						style="padding: 0 10px 10px 10px; height: 24px;" value="회원가입하기" />
				</p>
			</form>
		</div>
	</article>

</body>
</html>