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
</head>
<body>
	<div id="mainCcontainer" align="center">
		<h2>"${diary.subject }"</h2>
		<h5>${diary.regDate }</h5>
		<div class="container" align="center" style="margin-top: 20px">
			<div id="content"
				style="width: 40em; height: 50em; background-color: seashell; overflow: hidden;">
				<c:forEach items="${opList }" var="op">
					<c:forEach items="${opStickerList }" var="s">
						<c:if test="${op.stickerNum==s.stickerNum }">
							<div>
								<img alt="" src="${path }/images/stickerImage/${s.name}"
									style="height: ${op.height}; width: ${op.width}; left: 300; top:${op.y};">
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<button onclick="location.href='${path}/main#diaryList'"
			class="btn btn-outline-success">리스트 가기</button>
		<button
			onclick="location.href='updateForm?diaryNum=${diary.diaryNum}'"
			class="btn btn-outline-success">수정하기</button>
		<button onclick="location.href='delete?diaryNum=${diary.diaryNum}'"
			class="btn btn-outline-success">삭제하기</button>
	</div>
</body>
</html>