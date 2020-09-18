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
<div id="logo" align="center"
		style="margin-top: 10px; margin-bottom: 30px">
		<a href="${path }/main"><span
			style="font-family: 'Dynalight'; font-size: 50px; color: black">My
				Page</span></a>
	</div>
<table>
	<tr><th>제목</th><td>${notice.subject }</td></tr>
	<tr><th>게시일</th><td>${notice.regDate }</td></tr>
	<tr><th>내용</th><td><pre>${notice.content }</pre></td></tr>
</table>
<button onclick="location.href='${path}/main#notice'">리스트 가기</button>
<button onclick="location.href='updateForm?noticeNum=${notice.noticeNum}'">수정하기</button>
<button onclick="location.href='delete?noticeNum=${notice.noticeNum}'">삭제하기</button>
</body>
</html>