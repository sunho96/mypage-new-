<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" name="hashName" value="${hashName}">
		<div class="container" align="center">	
			해시 입력
			<input class="form-control form-control-lg" type="text"
				placeholder="#Hashtag" autofocus="autofocus" required="required" name="hashName"> 
 <input type="submit" value="확인">	
		</div>






</body>
</html>