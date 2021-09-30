<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>account_pwdConfirm</title>
<script src="${rePath}js/transfer_page.js"></script>


</head>
<body onload="account_confirmPwdFocus();">

<form action="account_password" method="post" name="confirmform" onsubmit="return confirmPwdCheck()">
	
	<!-- id 중복 -->
<c:if test="${selectCnt == 1}">
	<table>
		<tr>
			<th colspan="2">
				<span>${account_password}</span>는 사용할 수 없습니다
			</th>
		</tr>
		
		<tr>
			<th> 비밀번호: </th>
			<td>
				<input class="input" type="text" name="id" maxlength="20"
					style="width:150px" autofocus required>
		</tr>
		
		<tr>
			<th colspan="2">
				<input class="inputButton" type="submit" value="확인">
				<input class="inputButton" type="reset" value="취소" onclick="self.close();">
			</th>
		</tr>
		
	</table>
</c:if>

<c:if test="${selectCnt != 1}">
	<!-- 중복이 아닐 때 -->
	<table>
		<tr>
			<td align="center">
				<span>${account_password}</span>는 사용할 수 있습니다
			</td>
		</tr>
		
		<tr>
			<th>
				<input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
			</th>
		</tr>
	</table>
</c:if>
</form>

</body>
</html>