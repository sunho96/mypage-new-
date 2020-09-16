<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--   <%@ include file="../member/sessionChk.jsp"%> --%>
<%@ include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage 관리 페이지</title>
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript">
$(function(){
	$("#noticeList").load("notice/list");
	 $("#noticeInsertForm").click(function() {
		$("#noticeList").load("notice/insertForm");		
	});
	$("#hashInsertForm").load("hash/hashTag");
	
	
})



</script>
</head>

<body class="is-preload">

	<div id="logo" align="center" style="margin-top: 50px;">
		<img alt="" src="images/logo_white1.png" width="200px">
	</div>
	<div align="right">
		<a href="logout" style="color: white;">로그아웃 </a> <a
			href="memberUpdate_form" style="color: white;">회원정보수정</a>
		

	</div>
	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav">
			<a href="#" class="icon solid fa-home"><span>Home</span></a> <a
				href="#notice" class="icon solid fa-bullhorn"><span>notice</span></a>
			<a href="#hashtag" class="icon solid fa-plus"><span>hash</span></a>

		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro">
				<header>
					<p align="center">관리자 페이지 입니다.</p>
				</header>

			</article>

			<!-- Notice -->
			<article id="notice" class="panel">
				<header>
					<h2>Notice</h2>
				</header>
				<div id="noticeList" align="center"></div>
				<div id="noticeInsertForm">입력</div>
			</article>

			<!-- hash -->
			<!-- update로 들어가기 -->

			<article id="hashtag" class="panel">
				<header>
					<h2>hash</h2>
				</header>
				<div id="hashInsertForm" align="center"></div>
			</article>
		</div>

		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>mypage</li>
			</ul>
		</div>

	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>