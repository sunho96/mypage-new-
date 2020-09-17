<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
네비에서 멤버 : ${memberNum }
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main">
      	<img alt="" src="images/logo_black.png" height="100%;">
      </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="communityHome">홈</a></li>
      <li><a href="communitySeek">탐색</a></li>
      <li><a href="communityProfile?memberNum=${memberNum }">프로필</a></li>
    </ul>
  </div>
</nav>