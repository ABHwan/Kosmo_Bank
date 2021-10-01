<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납부 확인</title>
<script src="${rePath}js/utility.js"></script>
</head>
<body>

<!-- 계좌 비밀번호가 틀리면 -->
<%-- <c:if test="${selectCnt == -1}">
	<script type="text/javascript">
		setTimeout(function(){
			errorAlert(passwordError);
			window.location.bakc();
		}, 10);
	</script>
</c:if> --%>

<!-- 계좌 비밀번호가 맞으면 -->

	<!-- 잔액이 부족하면 -->
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			errorAlert("${msg}");
		</script>
	</c:if>
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("${msg}");
			window.location = 'utility_List';
		</script>
	</c:if>


</body>
</html>