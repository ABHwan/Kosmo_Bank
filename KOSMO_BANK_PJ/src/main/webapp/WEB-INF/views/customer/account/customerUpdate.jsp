<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${rePath}css/user/userUpdate.css">
</head>
<body>
	<h2> 회원수정 - 인증화면 </h2>
	<form action="userDetailAction" method="post" name="passwordform"
			onsubmit="return passwordCheck();">
			<sec:csrfInput/>
		<table class="userUpdate_table">
			<tr>
				<th class=tx_sub colspan="2">
					비밀번호를 입력해주세요.
				</th>
			</tr>
			<tr>
				<th class="tbl_th"> 비밀번호 </th>
				<td>
					<input class="input" type="password" name="password" maxlength="20" autofocus>
				</td>
			</tr>
			<tr>
				<th class="tbl_input" colspan="2">
					<input class="inputButton" type="submit" value="확인">
					<input class="inputButton" type="reset" value="취소"
						onclick="window.history.back();">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>