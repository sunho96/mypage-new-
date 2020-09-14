<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>my page</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="assets/css/login.css" />
<style type="text/css">
.logo {
	padding-left: 20px;
}

.login {
	height: 80%;
	border-radius: 10px;
	outline: none;
	border : none;
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
.hidden {
	display: none;
}

.emailChkDisp {
	margin-left: 8.33333%;
	width: 100%;
	padding: 0px;
	color: white;
	font-size: small;
	font-weight: bold;
	text-shadow: -1px 0 #000000, 0 1px #000000, 1px 0 #000000, 0 -1px
		#000000;
}

.passwordChkDisp {
	margin-left: 8.33333%;
	width: 100%;
	padding: 0px;
	color: white;
	font-size: small;
	font-weight: bold;
	text-shadow: -1px 0 #000000, 0 1px #000000, 1px 0 #000000, 0 -1px
		#000000;
}

</style>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var emailChk = true;
	var passChk = true;
	$(function() {
		//회원가입시 이메일 중복체크
		$("#join_email").focusout(
				function() {
					$.post("emailChk.do", "email=" + $("#join_email").val(),
							function(data) {
								if (data == "사용가능") {
									emailChk = true;
									$("#emailChkDisp").html("사용가능한 이메일입니다");

								} else {
									emailChk = false;
									$("#emailChkDisp").html(
											"이미 사용중인 이메일 입니다. 다른 이메일을 사용하세요");
								}
								$('.emailChkDisp').slideDown('fast');
							});
				});

		//회원가입시 패스워드 확인
		$("#join_password2").focusout(function() {
			if ($("#join_password2").val() != $("#join_password").val()) {
				passChk = false;
				$('.passwordChkDisp').slideDown('fast');
				$("#passwordChkDisp").text("패스워드를 다시 확인해주세요");
			} else {
				passChk = true;
				$('.passwordChkDisp').slideUp('fast');
			}
		});
	});

	function join_submitChk() {
		if (emailChk == false) {
			$("#join_email").focus();
			return false;
		}
		if (passChk == false) {
			$("#join_password").focus();
			return false;
		}

	}

</script>
</head>
<body class="is-preload">
	<div id="logo" align="center"></div>
	<!-- Wrapper-->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">

			<!-- LoginForm -->
			<article id="LoginForm" class="panel">
				<form action="login" method="post">
					<div align="center">
						<img alt="" src="images/logo_white1.png" width="120%"
							style="padding-bottom: 50px" class="logo">
						<div class="row">
							<div class="off-1">
								<input type="text" class="login" name="email"
									placeholder="Email" required="required" />
							</div>
							<div class="off-1">
								<input type="password" class="login" name="password"
									placeholder="Password" required="required" />
							</div>
							<div class="off-1">
								<input type="submit" class="login" id="loginbutton"
									value="login">
							</div>
							<div class="off-1" align="right">
							<input type="button" class="login" onclick="location.href='#JoinForm'" value="join us?" >
							</div>
							.   
						</div>
					</div>
				</form>
			</article>

		<!-- JoinForm -->
			<article id="JoinForm" class="panel">
				<form action="join.do" method="post" name="frmJ"
					onsubmit="return join_submitChk()">
					<div align="center">
						<img alt="" src="images/logo_white1.png" width="120%"
							style="padding-bottom: 50px" class="logo">
						<div class="row">
							<div class="off-1">
								<input type="email" class="login" name="email" id="join_email"
									placeholder="email" required="required" />
							</div>
							<div class="emailChkDisp hidden ">
								<span id="emailChkDisp"></span>
							</div>
							<div class="off-1">
								<input type="password" class="login" name="password"
									id="join_password" placeholder="Password" required="required" />
							</div>
							<div class="off-1">
								<input type="password" class="login" name="password2"
									id="join_password2" placeholder="Password Confirm"
									required="required" />
							</div>
							<div class="passwordChkDisp hidden ">
								<span id="passwordChkDisp"></span>
							</div>

							<div class="off-1">
								<input type="text" class="login" name="name" placeholder="Name"
									required="required" />
							</div>
							<div class="off-1">
								<input type="text" class="login" name="nickName"
									required="required" placeholder="Nickname" />
							</div>
							<div class="off-1">
								<input type="text" class="login" name="tel" required="required"
									placeholder="Tel 010-xxxx-xxxx" pattern="\d{3}-\d{3,4}-\d{4}" alt="010-xxxx-xxxx"/>
							</div>
							<div class="off-1">
								<input type="submit" class="login" id="loginbutton" value="Join">
							</div>
							<div class="off-1" align="right" >
							<input type="button" class="login" onclick="location.href='#LoginForm'" value="login" style="padding: auto;" >
							</div>
						</div>
					</div>
				</form>
			</article>
		</div>
		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
			</ul>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>