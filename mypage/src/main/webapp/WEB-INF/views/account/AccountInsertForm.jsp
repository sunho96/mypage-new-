<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript">
	function accchk() {
		alert(frm.accountNum.value);
		
		$("#accountNumChk").html(frm.accountNum.value);
		$.post('accountNumChk', 'accountNum='+frm.accountNum.value, function(data) {
			$('#accountNumChk').html(data);
		});
	}
</script>
</head>
<body>
	세션 아이디 : ${sessionScope.memberNum }
	<form action="AccountInsert" method="post" name="frm">
		<input type="hidden" name="memberNum" value="${sessionScope.memberNum }"> <input type="hidden" name=total value="0">
		<table>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="accountNum" value="11"> <input type="button" onclick="accchk()" value="중복체크">
					<div id="accountNumChk"></div></td>
			</tr>
			<tr>
				<th>은행</th>
				<td><input type="text" name="bank"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="입력"></th>
			</tr>
		</table>
	</form>

	<%@ include file="AccountMain.jsp"%>

</body>
</html>