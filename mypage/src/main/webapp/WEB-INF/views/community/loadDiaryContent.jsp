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
}
</style>
</head>
<body>
		<div align="center">
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
									style="height: ${op.height}; width: ${op.width}; left:${op.x}; top:${op.y}; position:absolute;">
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
</body>
</html>