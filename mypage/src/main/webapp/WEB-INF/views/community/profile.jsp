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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	div .thumbnail{
		margin-bottom: 40px;

	}
	
	div .thumbnail img {
		margin: 0px;
		
	}

	header div span {
		margin-right: 40px;
	
	}
	header img{
 		max-width: 100%;
  		height: auto;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$("#shared").load("community/iSharedContents?memberNum=${member.memberNum}");
	});
	function loadContents(value) {
		if (value=="shared"){
			$("#shared").load("community/iSharedContents?memberNum=${member.memberNum}");
		}
		else if (value=="likey"){
			$("#likey").load("community/iLikeyContents?memberNum=${member.memberNum}");
		}
		else if (value=="tag"){
			$("#tag").load("community/iTaggedContents");
		}
	}
	
	//팔로우 리스트
	function showFollower() {
		$("#showFollower").load("/mypage/community/showFollower?target=${member.memberNum}");
	}
	function showFollowing() {
		console.log("팔로잉 클릭 memberNum : ${member.memberNum}");
		$("#showFollowing").load("/mypage/community/showFollowing?memberNum=${member.memberNum}");
	}
	
	//팔로우버튼
	function follow(target) {
		$.post("/mypage/community/follow","target="+target,function(result){
			if(result == 1){
				$(".followBtn").html('<button class="btn btn-default btn-xs" onclick="follow('+target+')">팔로잉취소</button>');
			}else if (result== -1){
				$(".followBtn").html('<button class="btn btn-info btn-xs" onclick="follow('+target+')">팔로우</button>');
			}else{
				alert("follow() 실패");
			}
		});
	}	
</script>
</head>
<body style="background: #F6F6F6;">
	<%@ include file="communityNav.jsp" %>
	
	<div class="container-fluid ">
		<header>
			<div class="row">
				<div class="col-sm-4"><img src="/mypage/images/icons/profile.jpg" class="img-circle" alt="" /></div>
				<div class="col-sm-8">
					<h2 style="margin-right: 30px; display: inline;">${member.nickName }</h2>
					<span class="followBtn">
						<c:if test="${member.memberNum != memberNum }">
							<c:if test="${not empty isFollowing }">
								<button class="btn btn-default btn-xs" onclick="follow(${member.memberNum})">팔로잉취소</button>
							</c:if>
							<c:if test="${empty isFollowing }">
								<button class="btn btn-info btn-xs" onclick="follow(${member.memberNum})">팔로우</button>
							</c:if>
						</c:if>
					</span>
					
					<br>
					<h4>	<span>게시물 ${sharedCount}</span>   
					<button type="button" data-toggle="modal" data-target="#showFollower">팔로워 ${followerCount }</button>  
					<button type="button" data-toggle="modal" data-target="#showFollowing">팔로잉 ${followingCount }</button>
					<span data-toggle="modal" data-target="#showFollower" onclick="showFollower()">팔로워 ${followerCount }</span>  
					<span data-toggle="modal" data-target="#showFollowing" onclick="showFollowing()">팔로잉 ${followingCount }</span></h4>
					
				</div>
			</div>
		</header>
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#shared" onclick="loadContents('shared')">게시물</a></li>
			<c:if test="${memberNum == member.memberNum }">
				<li><a data-toggle="tab" href="#likey" onclick="loadContents('likey')">좋아요</a></li>
			</c:if>
			<li><a data-toggle="tab" href="#tag" onclick="loadContents('tag')">태그됨</a></li>
		</ul>
		<div class="tab-content">
		 	<div id="shared" class="tab-pane fade in active">
		
		    </div>
		    <div id="likey" class="tab-pane fade">
		      	
		    </div>
		    <div id="tag" class="tab-pane fade">
		      	
		    </div>
		 </div>
		 
		
	</div>
	
	
	<!-- Following List -->
  <div class="modal fade" id="showFollowing" role="dialog">
      
  </div>
<!-- Follower List -->
  <div class="modal fade" id="showFollower" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          	test팔로워
        </div>
        
      </div>
      
    </div>
  </div>

</body>
</html>