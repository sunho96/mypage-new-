<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".updateId").hide();
		$(".cataInput").hide();
	});
	function cataInputA() {
		$(".cataInput").show();
		$("#cataInput").focus();
		$("#cataInputA").hide();
	}
	function cataInsert() {
		var name = $("#cataInput").val();
		location.href = "insert?name="+ name;
	}
	function cataUpdate(index) {
		var name = $('#input_'+index).val();
		var diaryCataNum= $("#num_"+index).val();
		location.href="update?name="+name+'&diaryCataNum='+diaryCataNum;
	}
	function cataReset() {
		$(".cataInput").hide();
		$("#cataInputA").show();
	}
	function update(index) {
		$("#updateInput_"+index).show();
		$("#name_"+index).hide();
		$("#input_"+index).focus();
	}
	 function reset(index) {
			$("#updateInput_"+index).hide();
			$("#name_"+index).show();
	}
</script>
</head>
<body>
	<div class="container">
		<p>
		<div align="left">
			<a id="cataInputA" onclick="cataInputA()">카테고리추가</a> <input
				type="text" class="cataInput" name="cataInput" id="cataInput"
				placeholder="create your catagory" style="border: none;">
			<button class="cataInput" onclick="cataInsert()">추가</button>
			<button class="cataInput" onclick="cataReset()">취소</button>
			ㅣ <a href="allDel?memberNum=${memberNum}">전체삭제</a>
		</div>
		<p>
		<table class="table">
			<thead>
				<tr>
					<th>카테고리 이름</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cataList }" varStatus="a">
					<input type="hidden" value="${c.diaryCataNum }" id="num_${a.index }">
					<c:if test="${c.del !='y' }">
						<tr>
							<td id="name_${a.index }">${c.name }</td>
							<td id="updateInput_${a.index }" class="updateId">
							<input type="text" value=${c.name } id="input_${a.index }" style="border: none;">     
							<a onclick="cataUpdate(${a.index})">수정하기</a>ㅣ<a onclick="reset(${a.index})">취소</a></td>
							<td><button onclick="update(${a.index})">수정</button></td>
							<td><button
									onclick="location.href='del?diaryCataNum=${c.diaryCataNum}&memberNum=${memberNum }'">삭제</button></td>
						</tr>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
		<div align="right">
			<a href="../main#diaryList">다이어리 가기</a>
		</div>
	</div>
</body>
</html>