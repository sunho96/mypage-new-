<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty loginUser}">
			<c:choose>
				<c:when test="${loginUser.email == 'admin@mypage.com' }">
					<script type="text/javascript">
						alert("mainheader");
						location.href = "admin/adminMain"
					</script>
				</c:when>

				<c:when test="${loginUser.email != 'admin@mypage.com' }">
					<script type="text/javascript">
					alert("mainheader2");
						location.href = "main"
					</script>
				</c:when>

			</c:choose>
		</c:when>
	</c:choose>



</body>
</html>