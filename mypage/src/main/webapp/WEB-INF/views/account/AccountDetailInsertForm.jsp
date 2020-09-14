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

	<form action="AccountDetailInsert">
		<table>
			<tr>
				<th>거래종류</th>
				<td><input type="text" name="dealType"></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="text" name="amount"></td>
			</tr>
			<tr>
				<th>거래처</th>
				<td><input type="text" name="accounts"></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><input type="text" name="category"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><input type="text" name="memo"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="입력"></th>
			</tr>
		</table>
	</form>

	<%@ include file="AccountMain.jsp"%>

</body>
</html>