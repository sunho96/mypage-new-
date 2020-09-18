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

<script type="text/javascript">
	$(function() {
		<c:forEach items="${commList}"  var="com">
			console.log("com : ${com }");
			$("#content_${com.communityNum }").load("diary/loadDiaryContent?diaryNum=${com.diary.diaryNum}");
		</c:forEach>
	});


	//좋아요 버튼 누를때
	function likey(communityNum) {
		$.post("communityLikey","communityNum="+communityNum,function(value) {
			
			if (value.result == -1) {
			    $("#div_"+communityNum).remove();
			}
			
		}); 
		
	}

</script>
</head>
<body>
<br>
	<div class="row">
		<c:forEach items="${commList }" var="com" varStatus="i">
		
			<div class="col-sm-4" id="div_${com.communityNum }">
				<div class="thumbnail">
					<div class="caption" >
						<img alt="" src="images/icons/profile-48px.png" >
						<a href="communityProfile?memberNum=${com.diary.memberNum}"><b>${com.nickName }</b></a>
					</div>
					<div id="content_${com.communityNum }">
						컨텐츠 위치
					</div>
					
					<div class="caption" align="center">
						작성자 : ${com.nickName }
						<svg onclick="likey(${com.communityNum})" id="likeyBtn_${com.communityNum}" style="color:#FF3636; " width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> 
						</svg> ${com.likeyCnt }개  
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  	<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
						  	<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
						</svg> ${fn:length(com.commentsList) }개
					</div>				
				</div>
			</div>
		</c:forEach>
	  	</div>


</body>
</html>