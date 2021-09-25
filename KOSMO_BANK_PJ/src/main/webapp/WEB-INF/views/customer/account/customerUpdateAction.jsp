<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 처리</title>
</head>
<body>
	<h2>회원정보 수정 처리</h2>
	
	<c:if test="${updateCnt == 0}" >
		<script type="text/javascript">
			errorAlert(updateError);
		</script>
	</c:if>

	<c:if test="${updateCnt != 0}" >
	<%
		request.getSession().invalidate();
	%>
		<script type="text/javascript">
			setTimeout(function() {
				alert("회원 정보 수정이 정상 처리 되었습니다!!");
				window.parent.location="login"; // selectCnt == 4 : 환영합니다. 출력
			}, 10);
		
		</script>
	</c:if>
</body>
</html>