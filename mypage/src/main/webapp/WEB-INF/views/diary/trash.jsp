<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>table_form</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function save(num) {
		location.href="diary/save?diaryNum="+num;
	}
	function del(num) {
		location.href="diary/del?diaryNum="+num;
	}
</script>
</head>
<body>
	<div class="container">
		<p>
		<a href="diary/allDel?memberNum=${memberNum }">전체삭제</a>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="allDel" value="${d.diaryNum }"></th>
					<th>작성일</th>
					<th>제목</th>
					<th>복구</th>
					<th>삭제</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="d" items="${list }" varStatus="a">
					<c:if test="${d.del=='y' }">
						<tr>
							<td><input type="checkbox" name="checkDel" value="${d.diaryNum }"></td>
							<td>${d.regDate }</td>
							<td><a href="diary/view?diaryNum=${d.diaryNum}">${d.subject }</a></td>
							<td><button onclick="save(${d.diaryNum})">복구</button></td>
							<td><button onclick="del(${d.diaryNum})">삭제</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>
</html>