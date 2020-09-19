<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style type="text/css">
a:link {
	text-decoration: none;
	color: #646464;
}

a:visited {
	text-decoration: none;
	color: #646464;
}

a:active {
	text-decoration: none;
	color: #646464;
}

a:hover {
	text-decoration: none;
	color: #646464;
}

#dcontent {
	width: auto;
	height: 50em;
	border-radius: 7px;
	position: relative;
	overflow: hidden;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			console.log("버튼클릭");
			screenShot($("#screenshot"));
		});
	});

	//div 이미지로 저장
	function screenShot(target) {
		console.log("screen 메소드 실행");
		
		if (target != null && target.length > 0) {
			console.log("if문 실행");
			
			var t = target[0];
			console.log("t : " +t);
			html2canvas(t).then(function(canvas) {
				var myImg = canvas.toDataURL("image/png");
				myImg = myImg.replace("data:image/png;base64,", "");
				console.log("myImg : " + myImg);
				$.ajax({
					type : "POST",
					data : {
						"imgSrc" : myImg,
						"diaryNum": "${diary.diaryNum}"
					},
					dataType : "text",
					url : "ImgSaveTest",
					success : function(data) {
						console.log(data);
					},
					error : function(a, b, c) {
						alert("error");
					}
				});
			});
		}
	}
</script>
</head>
<body>
	<div id="screenshot" style="display: table;">
		<div align="center" >
			<h2>"${diary.subject }"</h2>
			<h5>${diary.regDate }</h5>
		</div>
		<div class="container" align="center"
			style="width: 40em; height: 50em;">
			<div id="dcontent" style="background-color: ${diary.bgColor};">
				${diary.content }
				<c:forEach items="${opList }" var="op">
					<c:forEach items="${opStickerList }" var="s">
						<c:if test="${op.stickerNum==s.stickerNum }">
							<div>
								<img alt="" src="${path }/images/stickerImage/${s.name}"
									style="height: ${op.height}; width: ${op.width}; left:${op.x}; top:${op.y}; position:absolute ;">
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</div >
	<button id="save">스샷</button>

	<div id="img">
		<img alt="" src="/mypage/images/diary/contents/diaryContent${diary.diaryNum }.png">
	</div>
</body>
</html>