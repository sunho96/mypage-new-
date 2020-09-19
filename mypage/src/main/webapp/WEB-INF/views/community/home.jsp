<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../member/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div .thumbnail{
		padding: 0px;
		margin-bottom: 40px;

	}
	div .top{
		padding-top: 10px;
		padding-bottom: 10px;
	}
	div .bottom-likeyCnt{
		margin-bottom: 10px;
	}
	.content {
		width : 800px;
		/* border: 1px solid; */
		padding-bottom: 40px;
	}
	
	.caption svg {
		margin-right: 10px;
		font-size: 40px;
	}
	.defaultHeart{
		color:#FFC6C6;
	}
	.likeyHeart{
		color: #FF3636;
	}
	.write-comment {
		align-items: left;
	}
	.likeyCnt {
		font-size: medium;
		font-weight: bold;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var startNum =1;
	var endCommunityChk = false;
	$(function() {
		$(".homeCommunityContainer").load("/mypage/community/contentList?startNum="+startNum );
		startNum +=5;
		
		$(window).scroll(function() {
			var scrollHeight = $(window).scrollTop() + $(window).height();	//갑자기 window.height() 값이 이상해짐 ...너무큼
			var documentHeight = $(document).height() ;
			
			console.log("$(window).scrollTop() : " + $(window).scrollTop() + ",  $(window).height() : " +  $(window).height());
			console.log("scrollHeight : " +scrollHeight + ", documentHeight : " + documentHeight);
			//스크롤의 높이와 문서의 높이가 같고 community에 데이터가 남아있을때
			if (scrollHeight >= documentHeight && endCommunityChk==false) {
				$('<div class="homeCommunityContainer"></div>').appendTo(".container").load("/mypage/community/contentList?startNum="+startNum);
				startNum +=5;
			}
		});
		
	});
</script>
</head>
<body>
<%@ include file="communityNav.jsp" %>
<div class=" container" >
	<div class="homeCommunityContainer">
	
	</div>

</div>
</body>
</html>