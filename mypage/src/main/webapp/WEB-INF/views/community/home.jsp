<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../member/sessionChk.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content {
		width : 1000px;
		border: 1px solid;
		padding-bottom: 10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.commityIcon 
</style>
<script type="text/javascript">
	// 무한 스크롤 부분
	var startNum = 6;	
	var endCommunityChk = false;
	$(document).ready(function() {
		//내가 좋아요한 게시글 좋아요버튼 빨간색으로 변경
		<c:forEach items="${isLikeyList}" var="item">
			$("#likeyBtn_${item.communityNum}").css("color","red");
		</c:forEach>
			
			
		$(window).scroll(function() { // 스크롤 이벤트 발생 시 필요한 변수를 구합니다.
			var scrollHeight = $(window).scrollTop() + $(window).height();	//갑자기 window.height() 값이 이상해짐 ...너무큼
			var documentHeight = parseInt($(document).height()* 0.9) ;
			
			console.log("$(window).scrollTop() : " + $(window).scrollTop() + ",  $(window).height() : " +  $(window).height());
			console.log("scrollHeight : " +scrollHeight + ", documentHeight : " + documentHeight);
			//스크롤의 높이와 문서의 높이가 같고 community에 데이터가 남아있을때
			if (scrollHeight >= documentHeight && endCommunityChk==false) {
				$.post("addCoummunityList","startNum=" +startNum,function(values){
					
					// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
					if(JSON.stringify(values) =="[]") {
						endCommunityChk = true;
						return;
					}
						
					//communityList테이블에 추가해주기
	                $.each(values, function( index, value ) {	
	                    $('<div class="content"><div class="top">'
	    					+ '<img alt="" src="images/icons/favicon.ico">닉네임 : ' + value.nickName + ', 커뮤니티번호 : ' + value.communityNum +'<label>더보기</label></div>'
	    					+ '<div class="middle"><img alt="" src="images/test1.png"></div>'
	    					+ '<div class="bottom"><div class="bottom-btn">'
	    					+ '<label onclick="likey(' + value.communityNum + ')" id="likeyBtn_'+ value.communityNum + '">좋아요버튼</label><label>댓글쓰기버튼</label><label>공유버튼 </label></div>'
	    					+ '<div class="bottom-likeyCnt"><span id="likeyCnt_'+value.communityNum+'">좋아요  ' +value.likeyCount + '개</span></div></div></div>'
	  						).appendTo('.homeCommunityContainer');
	   	            });
					startNum +=5;

				});
			}
			
		});
		
	});
	
	//좋아요 버튼 누를때
	function likey(communityNum) {
		$.post("communityLikey","communityNum="+communityNum,function(value) {
			
			if(value.result==1){
				$("#likeyBtn_"+communityNum).css("color","red");
			}else if (value.result == -1) {
				$("#likeyBtn_"+communityNum).css("color","black");
			}
			
			$("#likeyCnt_"+communityNum).text("좋아요 " + value.likeyCnt + "개");
		}); 
		
	}
	
	//댓글 엔터로 버튼사용
	function commentKeyUp(communityNum){ 
		if($("#comment_"+communityNum).val().length>0){
			$("#writeBtn_"+communityNum).removeAttr("disabled");
			if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
				//writeComment function 실행
				console.log("엔터누름");
				writeComment(communityNum);
			} 
		}else{
			$("#writeBtn_"+communityNum).attr("disabled","disabled");
		}
	}


	//댓글쓰기
	function writeComment(communityNum) {
		text = $("#comment_"+communityNum).val();
		
		$.post("writeComment","communityNum=" + communityNum + "&content=" + text,function(value){
			$("<span><b> " + value.nickName + "</b>, " + value.content + "</span><br>").appendTo("#testComment_"+communityNum);
			$("#comment_"+communityNum).val('');
		});
		
		$("#writeBtn_"+communityNum).attr("disabled","disabled");
		$("#comment_"+communityNum).blur();
	}
	
	//댓글쓰기 버튼
	function focusComment(communityNum) {
		$("#comment_"+communityNum).focus();
	}
	
</script>
</head>
<body>
	<%@ include file="communityNav.jsp" %>
	세션 memberNum : ${memberNum }<br>
	<div class="homeCommunityContainer">
		<c:forEach var="com" items="${list }" >
			<div class="content">
				<div class="top" style="background: aqua;">
					<img alt="" src="images/icons/favicon.ico">
					닉네임 : ${com.nickName }, 커뮤니티번호 : ${com.communityNum }
					<label>더보기</label>
				</div>
				
				<div class="middle" style="background: green;">
					<img alt="" src="images/trash.png">
				</div>
				<div class="bottom">
					<div class="bottom-btn" style="background: yellow;">
						<span class="glyphicon glyphicon-heart-empty" > </span>
						<span class="glyphicon glyphicon-heart" style="color: #FF3636; font-size: 40px;"> </span>
						<svg  onclick="focusComment(${com.communityNum})"  width="1em" height="1em" viewBox="0 0 16 16" class="commityIcon bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
						</svg>
						<label onclick="likey(${com.communityNum})" id="likeyBtn_${com.communityNum}" >좋아요버튼</label> 
						
						<label>공유버튼 </label>
					</div>
					<div class="bottom-likeyCnt" style="background: pink" >
						<span id="likeyCnt_${com.communityNum }">좋아요 ${ com.likeyCnt}개</span><br>
						<div id="testComment_${com.communityNum }" style="background: gray;"></div>
						댓글이 2개 이상이면 댓글x개 모두보기 나옴<br>
						댓글은 최신 2개
					</div>
					<div class="write-comment" style="background: fuchsia;">
						<input type="text" id="comment_${com.communityNum}" onkeyup="commentKeyUp(${com.communityNum})"> 
						<button onclick="writeComment(${com.communityNum})" id="writeBtn_${com.communityNum}" disabled="disabled">게시</button>
					</div>
					
				</div>
			</div>
		</c:forEach>
		
		
	</div>

</body>
</html>