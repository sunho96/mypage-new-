<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result>0 }">
	<script type="text/javascript">
		location.href="loginForm";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("ȸ������ ����");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result==-1 }">
	<script type="text/javascript">
		alert("�̸��� �˻� ����");
		history.go(-1);
	</script>
</c:if>
</body>
</html>