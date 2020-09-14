<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../header.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/login.css" />

<style type="text/css">
.logo {
	padding-left: 20px;
}

.login {
	height: 80%;
	border-radius: 10px;
}

.login:hover {
	box-shadow: 0px 0px 20px 10px rgba(102, 186, 255, 0.4);
}

#loginbutton {
	height: 100%;
	border: none;
	width: 30%;
	border: none;
}
</style>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
var passChk = true;
$("#password2").focusout(function() {
	if($("#password2").val() != $("password").val()){
		passChk = false;
		$('.passwordChkDisp').fadeIn('slow');
		$("#passwordChkDisp").text("암호가 다릅니다.");
	} else {
		passChk = true;
	}
});



</script>
</head>
<body class="is-preload">
	<!-- Wrapper-->
	<div id="wrapper">
		<!-- Main -->
		
		<div id="main">
			<!--회원정보 수정 -->
			<h2 align="center">회원정보수정</h2>
			<article id="LoginForm" class="panel">
				<form action="memberUpdate" method="post">
				<input type="hidden" value="${member.memberNum}" name="memberNum">
					<div align="center">
						<div class="row">
							<div class="off-1">
								 <input type="email" class="login" name="email"
									placeholder="email" required="required"
									value="${member.email }" readonly="readonly" />

							</div>

							<div class="off-1">
								<input type="password" class="login" name="password"
									placeholder="Password" required="required"
									/>
							</div>

							<div class="off-1">
								<input type="password" class="login" name="password2"
									placeholder="Pass confirm" required="required"
									 /><span id="passwordChkDisp"></span>
							</div>

							<div class="off-1">
								<input type="text" class="login" name="name" placeholder="name"
									required="required" value="${member.name }" readonly="readonly" />
							</div>
							<div class="off-1">
								<input type="text" class="login" name="nickName"
									placeholder="Nickname" required="required"
									/>
							</div>
							<div class="off-1">
								<input type="text" class="login" name="tel" required="required"
									placeholder="Tel 010-xxxx-xxxx" value="${member.tel }" />
							</div>


							<div class="off-1">
								<input type="submit" class="login" id="loginbutton"
									value="ok">
							</div>  
						</div>
					</div>
				</form>
			</article>
		</div>
	</div>

	<div align="center">
		<a href="main">메인가기(테스트)</a>
	</div>

	<!-- Footer -->
	<div id="footer">
		<ul class="copyright">
		</ul>
	</div>
	
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>


</body>
</html>