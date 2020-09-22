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
<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			console.log("버튼클릭");
			screenShot($("#content"));
		});
	});

	//div 이미지로 저장
	function screenShot(target) {
		console.log("screen 메소드 실행");

		if (target != null && target.length > 0) {
			console.log("if문 실행");

			var t = target[0];
			console.log("t : " + t);
			html2canvas(t).then(function(canvas) {
				var myImg = canvas.toDataURL("image/png");
				myImg = myImg.replace("data:image/png;base64,", "");
				console.log("myImg : " + myImg);
				$.ajax({
					type : "POST",
					data : {
						"imgSrc" : myImg,
						"diaryNum" : "${diary.diaryNum}"
					},
					dataType : "text",
					url : "${path}/community/ImgSave",
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

#content {
	width: 40em;
	height: 50em;
	border-radius: 7px;
	position: relative;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black; margin-bottom: 20">My
				Page</span></a>
	</div>
	<div id="mainCcontainer" align="center">
		<h2>"${diary.subject }"</h2>
		<h5>${diary.regDate }</h5>
		<div class="container" align="center">
			<div align="right">
				<button id="save" class="btn btn-outline-success">공유하기</button>
			</div>
			<div id="content"
				style="background-color: ${diary.bgColor}; position: relative; overflow: hidden; width: 40em; height: 50em;">
				<c:forEach items="${opList }" var="op">
					<c:forEach items="${opStickerList }" var="s">
						<c:if test="${op.stickerNum==s.stickerNum }">
							<div class="sti" style="height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute;">
								<img alt="" src="${path }/images/stickerImage/${s.name}"
									style="width: 100%; height: 100%; padding: 0">

							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${opTxtList }" var="t">
						<c:if test="${op.textboxNum==t.textboxNum }">
							<div
								style="font-size:${t.fntSize }; font-weight:${t.fntWeight }; color:${t.fntColor } ;height: ${op.height}px; width: ${op.width}px; left:${op.x}px; top:${op.y}px; position:absolute; ">
								${t.content }</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<div style="margin-top: 30" align="center">
			<button onclick="location.href='${path}/main#diaryList'"
				class="btn btn-outline-success">리스트 가기</button>
			<button
				onclick="location.href='updateForm?diaryNum=${diary.diaryNum}'"
				class="btn btn-outline-success">수정하기</button>
			<button onclick="location.href='delete?diaryNum=${diary.diaryNum}'"
				class="btn btn-outline-success">삭제하기</button>
		</div>
	</div>
</body>
</html>