<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../member/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="communityNav.jsp" %>
list : 	 ${list }
	<img alt="" src="resources/community/images/temp1.jpg">
	
	<div class="thumbnail ">
		<div class="row">
		<c:forEach items="${commList }" var="com" varStatus="i">
			<div class="col-sm-4"><img alt="" src="resources/community/images/temp${i.index+1}.jpg"></div>
		</c:forEach>
	  	</div>
	</div>

</body>
</html>