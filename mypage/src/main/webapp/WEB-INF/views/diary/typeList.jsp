<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>diary</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

  	function cata(num) {
		location.href="typeList?memberNum=${memberNum}&diaryCataNum="+num;
	}
  	function all() {
  		location.href="../main#diaryList";
	}
	
</script>
</head>
<body>

	<div class="container">
		<ul class="nav nav-tabs">		
				<li><a data-toggle="tab" href="" onclick="all()">all</a></li>
			<c:forEach var="c" items="${cataList }">
				<c:if test="${diaryCataNum == c.diaryCataNum }">
					<li class="active"><a data-toggle="tab" href="${c.name }">${c.name }</a></li>
				</c:if>			
				<c:if test="${diaryCataNum != c.diaryCataNum }">
					<li><a data-toggle="tab" href="${c.name }"
						onclick="cata(${c.diaryCataNum})">${c.name }</a></li>
				</c:if>
			</c:forEach>
		</ul>
		<div class="tab-content">
			<table class="table">
				<thead>
					<tr>
						<th>작성일</th>
						<th>제목</th>

					</tr>
				</thead>
				<tbody>
					<c:if test="${empty typeList }">
						<tr>
							<td>리스트가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty typeList }">
						<c:forEach var="d" items="${typeList }">
							<c:if test="${d.del=='n' }">
								<tr>
									<td>${d.regDate }</td>
									<td><a href="view?diaryNum=${d.diaryNum}">${d.subject }</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div align="right"><a href="../main#diaryList">다이어리 가기</a></div>
	</div>

</body>
</html>
