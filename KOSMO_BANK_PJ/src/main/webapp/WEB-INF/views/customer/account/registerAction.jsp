<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>
	<h2>회원가입 처리 페이지</h2>

	<!-- insert 실패 -->
	<c:if test="${insertCnt == 0}" >
		<script type="text/javascript">
			errorAlert(insertError);
		</script>
	</c:if>
	<c:if test="${insertCnt != 0}" >
		<script>
			alert("회원가입이 정상 처리되었습니다!");
		</script>
		<c:redirect url="login.do?selectCnt=${insertCnt}" />
	</c:if>
	
</body>
</html>