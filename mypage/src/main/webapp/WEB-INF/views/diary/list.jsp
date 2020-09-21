<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".cataInput").hide();
		$('#scroll').scroll();
		
	});
	function cataInputLi() {
		$(".cataInput").show();
		$("#cataInput").focus();
		$("#cataInputLi").hide();
	}
	function cataInsert() {
		var name = $("#cataInput").val();
		location.href="diaryCatagory/insert?name="+name;
	}
	function cataReset() {
		$(".cataInput").hide();
		$("#cataInputLi").show();
	}
  	function cataSelect(num) {
		location.href="diary/typeList?memberNum=${memberNum}&diaryCataNum="+num;
	}	
  </script>
</head>
<body>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="">all</a></li>
			<c:forEach var="c" items="${cataList }">
				<c:if test="${c.del !='y'}">
					<li><a data-toggle="tab"
						onclick="cataSelect(${c.diaryCataNum})">${c.name }</a></li>
				</c:if>
			</c:forEach>
			<li><a id="cataInputLi" onclick="cataInputLi()">추가하기</a></li>
			<li><input type="text" class="cataInput" name="cataInput"
				id="cataInput" placeholder="create catagory" style="border: none;">
				<button class="cataInput" onclick="cataInsert()">추가</button>
				<button class="cataInput" onclick="cataReset()">취소</button></li>
		</ul>
		<div class="tab-content">
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>작성일</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td>리스트가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach var="d" items="${list }">
								<c:if test="${d.del=='n' }">
									<tr>
										<td>${d.regDate }</td>
										<td><a href="diary/view?diaryNum=${d.diaryNum}">${d.subject }</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>