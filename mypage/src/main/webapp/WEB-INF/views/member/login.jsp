<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==1 }">
<script type="text/javascript">	
	location.href="main";
</script>
</c:if>
<c:if test="${result==0 }">
<script type="text/javascript">
	alert("비밀번호를 다시 입력해주세요");
	history.go(-1);
</script>
</c:if>
<c:if test="${result==-1 }">
<script type="text/javascript">
	alert("이메일과 비밀번호를 다시 입력해주세요");
	history.go(-1);
</script>
</c:if>
</body>
</html>