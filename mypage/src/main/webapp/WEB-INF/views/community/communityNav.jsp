<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main">
      	<img alt="" src="/mypage/images/logo_black.png" height="100%;">
      </a>
    </div>
    <ul class="nav navbar-nav" id="communityNav">
      <li ><a href="javascript:coummunityChange('communityHome')">홈</a></li>
      <li><a href="javascript:coummunityChange('communityProfile?memberNum=${memberNum}')">프로필</a></li>
    </ul>
  </div>

</nav> 