<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../member/sessionChk.jsp"%>
<!DOCTYPE html>
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
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	// 무한 스크롤 부분
	var startNum = 6;	
	var endCommunityChk = false;
		
	$(document).ready(function() { 
		$(window).scroll(function() { // 스크롤 이벤트 발생 시 필요한 변수를 구합니다.
			var scrollHeight = $(window).scrollTop() + $(window).height();	//갑자기 window.height() 값이 이상해짐 ...너무큼
			var documentHeight = parseInt($(document).height()* 0.9) ;

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
	    					+ '<img alt="" src="images/icons/favicon.ico">닉네임, 커뮤니티번호 : ' + value.communityNum +'<label>더보기</label></div>'
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
	

	
	//좋아요
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
	
	//댓글쓰기
	function writeComment(communityNum) {
		text = $("#comment_"+communityNum).val();
		
		$.post("writeComment","communityNum=" + communityNum + "&text=" + text,function(values){
			console.log("결과 : " + values+", 데이터타입 : " + typeof values);
			// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
			if(JSON.stringify(values) =="[]") {
				endCommunityChk = true;
				return;
			}
			for(var i=0; i<values.length;i++){
				console.log("i : " + i +", value.commentsNum : " + values[i].commentsNum);
			}
			
		});
	}
</script>
</head>
<body>
	<%@ include file="communityNav.jsp" %>
	세션 memberNum : ${memberNum }
	<div class="homeCommunityContainer">
		<c:forEach var="com" items="${list }" >
			<div class="content">
				<div class="top" style="background: aqua;">
					<img alt="" src="images/icons/favicon.ico">
					닉네임, 커뮤니티번호 : ${com.communityNum }
					<label>더보기</label>
				</div>
				
				<div class="middle" style="background: green;">
					<img alt="" src="images/trash.png">
				</div>
				<div class="bottom">
					<div class="bottom-btn" style="background: yellow;">
						<label onclick="likey(${com.communityNum})" id="likeyBtn_${com.communityNum}" >좋아요버튼</label> 
						<label>댓글쓰기버튼</label>
						<label>공유버튼 </label>
					</div>
					<div class="bottom-likeyCnt" style="background: pink" >
						<span id="likeyCnt_${com.communityNum }">좋아요 ${ com.likeyCount}개</span><br>
						<span id="testComment_${com.communityNum }" style="background: gray;"></span>
						댓글이 2개 이상이면 댓글x개 모두보기 나옴<br>
						댓글은 최신 2개
					</div>
					<div class="write-comment" style="background: fuchsia;">
						<input type="text" id="comment_${com.communityNum}"> <button onclick="writeComment(${com.communityNum})">게시</button>
					</div>
					
				</div>
			</div>
		</c:forEach>
		
		
	</div>

</body>
</html>