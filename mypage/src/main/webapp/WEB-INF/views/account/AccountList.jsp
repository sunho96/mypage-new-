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
	<table>
		<tr>
			<th>계좌번호</th>
			<th>은행</th>
			<th>잔액</th>
		</tr>
		<!-- 등록한 계좌가 없을 때 -->
		<c:if test="${empty AccountList}">
			<tr>
				<th colspan="3">등록한 계좌가 없습니다</th>
			</tr>
		</c:if>
		<!-- 등록한 계좌가 있을 때 -->
		<c:if test="${not empty AccountList}">
			<!-- list를 불러옴 -->
			<c:forEach var="account" items="${AccountList}">
				<!-- 계좌번호 -->
				<tr>
					<td><a href="AccountDetailList?accountNum=${account.accountNum }">${account.accountNum }</a></td>
					<!-- 은행 -->
					<td>${account.bank }</td>
					<!-- 잔액 -->
					<td>${account.total }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<%@ include file="AccountMain.jsp"%>

</body>
</html>