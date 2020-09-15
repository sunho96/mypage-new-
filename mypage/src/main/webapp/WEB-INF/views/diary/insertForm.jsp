
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/sessionChk.jsp"%>
<%@ include file="../header.jsp"%>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- draggable에 필요한 cdn  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$('#inputTd').hide();
		$('#diaryCatagory').change(function() {
			var dc = $('#diaryCatagory').val();
			if (dc == 'makeCata') {
				$('#select').hide();
				$('#inputTd').show();
				$('#newCata').focus();
			}
		});
	});
	function insertCata() {
		var name = $('#newCata').val();
		location.href ='diaryCatagory/insert?name='+ name +'&insertForm='+ 'insertForm';
	}
	function cataReset() {
		$("#inputTd").hide();
		$("#select").show();
	}

	function goDeco() {
		var diaryCataNum = $('#diaryCatagory').val();
		if (diaryCataNum == null) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		var subject = $('#subject').val();
		if (subject == "") {
			alert("제목을 입력해주세요.");
			$('#subject').focus();
			return false;
		}
		location.href = "diary/decorate?memberNum=${memberNum}&diaryCataNum=" + diaryCataNum
				+ "&subject=" + subject;
	}
</script>
</head>
<body>
	<form>
		<input type="hidden" name="memberNum" value="${memberNum }">
		<table>
			<tr>
				<th>catagory</th>
			</tr>
			<tr>
				<td id="select"><select name="diaryCataNum" id="diaryCatagory">
						<option disabled="disabled" selected="selected">select
							catagory</option>
						<c:forEach var="c" items="${cataList }">
							<c:if test="${c.del !='y' }">
								<option value="${c.diaryCataNum }">${c.name }</option>
							</c:if>
						</c:forEach>
						<option value="makeCata">카테고리 만들기</option>
				</select></td>
			</tr>
			<tr>
				<td id="inputTd"><input type="text" name="name" id="newCata" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2"
					placeholder="create your catagory" autofocus="autofocus">
					<input type="button" onclick="insertCata()" class="btn btn-outline-secondary" value="등록">
					<input type="button" onclick="cataReset()" class="btn btn-outline-secondary" value="취소"></td>
			</tr>
			<tr>
				<th>subject</th>
			</tr>
			<tr>
				<td><input type="text" name="subject" autofocus="autofocus"
					id="subject" style="width: 40em;"></td>
			</tr>
		</table>
		<div align="center">
			<a onclick="goDeco()"><img alt=""
				src="${path }/images/decorateDiary2.png"></a>
		</div>
	</form>
</body>
</html>