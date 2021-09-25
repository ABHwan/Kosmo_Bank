<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 확인 창</title>
<link rel="stylesheet" href="${userPath }account/css/deleteUser.css">
</head>
<body>
	<form action="deleteCustomerAction" method="post" name="deleteform">
		<table class="delete_table">
				<tr align="center">
					<th colspan="2">
						<span id="tx_sub">회원 탈퇴를 진행하시겠습니까?</span>
					</th>
				</tr>
				<tr>
					<td>
						<input id="inputButton" type="button" value="확인" onclick="deleteUserAction();">
						<input id="inputButton" type="button" value="취소" onclick="window.close();">
					</td>
				</tr>
		</table>
	</form>
</body>
</html>