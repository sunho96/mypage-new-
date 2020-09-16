<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		$(".hashInsertForm").click(function() {
			$('#hash').load("hash/hashInsertForm");
		});
	})
</script>
</head>
<body>
	<!-- 이미지 출력 리스트 -->

	<div align="center" id="image">
		<c:set var="stickerNum" value="${no }"></c:set>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">정보가 없습니다</th>
			</tr>
		</c:if>

		
		<c:if test="${not empty list}">
			<c:forEach var="sticker" items="${list }">
				<c:if test="${sticker.groupName == sticker1.keyword }">
					<table>
						<tr>
							<th><img alt="사진"
								src="${path}/images/stickerImage/${sticker.name}" width="100px"
								height="100px"></th>
							<!-- image -> name 바꾸기  -->

							<!-- 해시 태그 추가 리스트 -->
							<th>test 해시 태그 추가하면 리스트가 뜨도록 함</th>

							<!-- 해시태그 추가 -->
							<th><a class="hashInsertForm">추가</a></th>
							<th><a id="hashupdate">수정</a></th>
							<th><a id="hashdelete">삭제</a></th>
						</tr>
					</table>
				</c:if>

			
					<tr>
						<td>
							<div id="hash" align="center"></div>

						</td>
					</tr>
			


			</c:forEach>
		</c:if>
	</div>


</body>
</html>