<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../member/sessionChk.jsp"%>
<!DOCTYPE HTML>
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
	// 무한 스크롤 부분
	var startNum = 6;	
	var endCommunityChk = false;
	$(document).ready(function() {
		//내가 좋아요한 게시글 좋아요버튼 빨간색으로 변경
		<c:forEach items="${isLikeyList}" var="item">
			$("#likeyBtn_${item.communityNum}").addClass("likeyHeart");
		</c:forEach>
			
			
		$(window).scroll(function() { // 스크롤 이벤트 발생 시 필요한 변수를 구합니다.
			var scrollHeight = $(window).scrollTop() + $(window).height();	//갑자기 window.height() 값이 이상해짐 ...너무큼
			var documentHeight = $(document).height() ;
			
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
	    					+ '<img alt="" src="images/icons/profile-48px.png">닉네임 : ' + value.nickName + ', 커뮤니티번호 : ' + value.communityNum +'<label>더보기</label></div>'
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
				$("#likeyBtn_"+communityNum).addClass("likeyHeart");
			}else if (value.result == -1) {
				$("#likeyBtn_"+communityNum).removeClass("likeyHeart");
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
			$("<span><b> " + value.nickName + "</b> " + value.content + "</span><br>").appendTo("#testComment_"+communityNum);
			$("#comment_"+communityNum).val('');
		});
		
		$("#writeBtn_"+communityNum).attr("disabled","disabled");
		$("#comment_"+communityNum).blur();
	}
	
	//댓글쓰기 버튼
	function focusComment(communityNum) {
		$("#comment_"+communityNum).focus();
	}
	
	//댓글 모두 보기 
	function commentViewAll(communityNum) {
		$.post("selectCommentList","communityNum="+communityNum,function(values){
			$("#testComment_" +communityNum ).empty();
			
			//Collection 전용 foreach문(for..of)
			for (let comment of values) {
				console.log("댓글 모두보기" + comment.content);
				$("<span><b> " + comment.nickName + "</b> " + comment.content + "</span><br>").appendTo("#testComment_"+communityNum);
				
			}
			
		});
	}
	
</script>
</head>
<body>
	<%@ include file="communityNav.jsp" %>
	
	<div class="homeCommunityContainer container" style="background: #EAEAEA;">
		<c:forEach var="com" items="${list }" varStatus="i" >
			<div class="thumbnail" >
				<div class="top caption " >
					<img alt="" src="images/icons/profile-48px.png" >
					<b>${com.nickName }</b>
				</div>
				
				<img alt="" src="resources/community/images/temp${i.index+1}.jpg">
				<div class="middle caption " >
				</div>
				
				<div class="bottom caption ">
					<div class="bottom-btn" >
						<svg onclick="likey(${com.communityNum})" id="likeyBtn_${com.communityNum}"  width="1em" height="1em" viewBox="0 0 16 16" class="defaultHeart bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
						<svg  onclick="focusComment(${com.communityNum})"  width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
						</svg>
					</div>
					
					<div class="bottom-likeyCnt" >
						<span class="likeyCnt" id="likeyCnt_${com.communityNum }">좋아요 ${ com.likeyCnt}개</span><br>
						<c:if test="${fn:length(com.commentsList) > 2}"> <span onclick="commentViewAll(${com.communityNum})">댓글 ${fn:length(com.commentsList)}개 모두보기 </span></c:if>
					</div>
					<div id="testComment_${com.communityNum }">
						<c:forEach items="${com.commentsList }" var="commentsList" begin="0" end="${fn:length(com.commentsList) >= 1 ? 1 : fn:length(com.commentsList) }" >
							<span><b>${commentsList.nickName}</b> ${commentsList.content }</span><br>
						</c:forEach>
					</div>
					
					<div class="write-comment"  >
						<div class="col">
							<div class="input-group">
								<input class="form-control input-lg" type="text" id="comment_${com.communityNum}" onkeyup="commentKeyUp(${com.communityNum})" > 
								<span class="input-group-btn">
									<button class="btn btn-default btn-lg" onclick="writeComment(${com.communityNum})" id="writeBtn_${com.communityNum}" disabled="disabled">게시</button>
								</span>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</c:forEach>
		
		
	</div>

</body>
</html>