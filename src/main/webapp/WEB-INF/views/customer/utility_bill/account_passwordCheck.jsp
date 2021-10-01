<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>account_pwdConfirm</title>
<link rel="stylesheet" href="${rePath}css/user/userUpdate.css">
<script src="${rePath}js/transfer_page.js"></script>


</head>
<body>

<form action="utilityConfirm" method="post" name="passwordform"
			onsubmit="return passwordCheck();">
			<sec:csrfInput/>
			<input type="hidden" name="account_id" value="${account_id}">
			<input type="hidden" name="utility_num" value="${utility_num}">
			<input type="hidden" name="utility_money" value="${utility_money}">
			
		<table class="userUpdate_table">
			<tr>
				<th class=tx_sub colspan="2">
					비밀번호를 입력해주세요.
				</th>
			</tr>
			<tr>
				<th class="tbl_th"> 비밀번호 </th>
				<td>
					<input class="input" type="password" name="account_password" maxlength="20" autofocus>
				</td>
			</tr>
			<tr>
				<th class="tbl_input" colspan="2">
					<input class="inputButton" type="submit" value="확인">
					
				</th>
			</tr>
		</table>
	</form>

</body>
</html>