<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
</head>
<body>
<c:if test="${vo.member_id != null }">
	<table>
		<tr>
			<td colspan="2" align="center">
				찾으시는 id는 <span>${vo.member_id}</span>입니다.
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" class="button" value="확인"  onclick="history.back();">
			</td>
		</tr>
	</table>
</c:if>

<c:if test="${vo.member_id == null }">
	<table>
		<tr>
			<td colspan="2" align="center">
				id를 찾지 못했습니다.<br> 
				이름과 이메일을 확인해주세요.<br>
			</td>
		</tr>
		
		<tr>	
			<td colspan="2" align="center">
				<input type="button" class="button" value="확인"  onclick="history.back();">
			</td>
		</tr>
	</table>
</c:if>
</body>
</html>