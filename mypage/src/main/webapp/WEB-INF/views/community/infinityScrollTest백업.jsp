<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var startNum = 6;	
	var endCommunityChk = false;
		
	// 무한 스크롤 부분
	$(document).ready(function() { // 스크롤 이벤트 발생 시
		$(window).scroll(function() { // 필요한 변수를 구합니다.
			
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			
			//스크롤의 높이와 문서의 높이가 같고 community에 데이터가 남아있을때
			if (scrollHeight == documentHeight && endCommunityChk==false) {
				$.post("addCoummunityList","startNum=" +startNum,function(values){
						
					// 데이터가 비어있으면 endChk로 비어있다는 걸 표시해주고 메소드 끝내기
					if(JSON.stringify(values) =="[]") {
						endCommunityChk = true;
						return;
					}
						
					//communityList테이블에 추가해주기
	                $.each(values, function( index, value ) {	
	                    $('<tr><td><img alt="" src="images/test1.png"></td>'
	    						+ '<td>'+ value.communityNum +'</td>'
	    						+ '<td>'+ value.shareDate +'</td>'
	    						+ '<td>'+ value.likeyCount +'</td>'
	    						+ '<td>'+ value.diaryNum +'</td>'
	    						+ '<td>'+ value.diary.subject +'</td>'
	    						+ '<td>'+ value.diary.content +'</td>'
	   							+'</tr>').appendTo('#communityList');
	   	                    });
					startNum +=5;

				});
			}
			
			var today = Date.now();
			alert(today);
		});
	});
	
</script>
</head>
<body>
	test
	<table border="1" id="communityList">
		<tr>
			<th>이미지</th>
			<th>communityNum</th>
			<th>shareDate</th>
			<th>likeyCount</th>
			<th>diaryNum</th>
			<th>subject</th>
			<th>content</th>
		</tr>
		<c:forEach var="com" items="${list }">
			<tr>
				<td><img alt="" src="images/trash.png"></td>
				<td>${com.communityNum }</td>
				<td>${com.shareDate }</td>
				<td>${com.likeyCount}</td>
				<td>${com.diaryNum}</td>
				<td>${com.diary.subject}</td>
				<td>${com.diary.content}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>