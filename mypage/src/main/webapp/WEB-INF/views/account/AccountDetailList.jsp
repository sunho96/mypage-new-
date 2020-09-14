<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	세션 아이디 : ${sessionScope.memberNum }

	<h2>계좌번호 : ${accountbook }</h2>
	<hr>
	<a href="AccountDetailInsertForm">계좌 상세내역 추가하기</a>
	<hr>
	<table>
		<tr>
			<th>거래종류</th>
			<th>금액</th>
			<th>거래처</th>
			<th>분류</th>
			<th>날짜</th>
			<th>메모</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<!-- 계좌 상세내역 불러옴 -->
		<c:forEach var="detail" items="${AccountBookList}">
			<tr>
				<td>${detail.dealType }</td>
				<td>${detail.amount }</td>
				<td>${detail.accounts }</td>
				<td>${detail.category }</td>
				<td>${detail.regDate }</td>
				<td>${detail.memo }</td>
				<td><a href="AccountDetailUpdateForm?abookNum=${detail.abookNum }">수정</a></td>
				<td><a href="AccountDetailDeleteForm?abookNum=${detail.abookNum }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>

	<%@ include file="AccountMain.jsp"%>

</body>
</html>