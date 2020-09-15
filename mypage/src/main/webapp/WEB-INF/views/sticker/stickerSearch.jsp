<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<c:set var="stickerNum" value="${no }"></c:set>
	<a href="../../../main">메인돌아가기</a>


		<!-- 검색 -->
		<form action="${path}/sticker/stickerSearch/pageNum/1">
			 <input type="text" name="keyword" value="${sticker.keyword}">
			<input type="submit" value="확인">
		</form>
	</div>



	<!-- 이미지 출력 테스트 -->

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
	</div>


</body>
</html>