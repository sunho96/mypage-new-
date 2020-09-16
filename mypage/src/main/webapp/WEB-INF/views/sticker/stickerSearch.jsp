<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function stikerLoad() {
		var keyword = $('#st').val();
		if (!keyword) {
			alert('키워드 입력후에 실행하시오');
			$('#st').focus();
			return false;
		}
		$.post("${path}/sticker/stickerSearch", "keyword="+keyword, function(data) {
			$('#stikerImage').html(data);
		});
	}

</script>
</head>
<body>
	<div class="container" align="center">
		<c:set var="stickerNum" value="${no }"></c:set>

		<!-- 검색 -->
		<tr>
		<th>스티커를 검색하세요.</th>
		</tr>
<%-- 		<form action="${path}/sticker/stickerSearch/pageNum/1"> --%>
			<input type="text" class="form-control form-control-lg" name="keyword" value="${sticker.keyword}" id="st">
			<input type="button" onclick="stikerLoad()" value="확인">
<!-- 		</form> -->
	</div>

<div id="stikerImage"></div>

	<!-- 이미지 출력 테스트 -->
<%-- 
	<div align="center">
		<c:set var="stickerNum" value="${no }"></c:set>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">정보가 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="sticker" items="${list }">
				<c:if test="${sticker.groupName == sticker1.keyword }">
			<img alt="사진" src="../../../images/stickerImage/${sticker.name}">	 <!-- image -> name 바꾸기  -->
			</c:if>	

			</c:forEach>
		</c:if>
	</div> --%>


</body>
</html>