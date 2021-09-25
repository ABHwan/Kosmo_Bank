<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 처리</title>
</head>
<body>
<!-- 
	selectCnt : 아이디 비밀번호 일치:1, 불일치:0
	deleteCnt : 삭제성공:1, 삭제실패:0
-->
	<!-- 아이디와 비밀번호 불일치 : 0 -->
	<c:if test="${sessionScope.userID == null}" >
		<script type="text/javascript">
			errorAlert(sessionError);
		</script>
	</c:if>
	<!-- 아이디와 비밀번호 일치 : 1 -->
	<c:if test="${sessionScope.userID != null}" >
		<!-- 탈퇴 실패 -->
		<c:if test="${deleteCnt == 0}" >
			<script type="text/javascript">
				errorAlert(deleteError);
			</script>
		</c:if>
		
		<!-- 탈퇴 성공 - 세션 삭제, selectCnt =2(환영합니다)로 주고, main.jsp로 이동 -->
		<c:if test="${deleteCnt != 0}" >
		<%
			request.getSession().invalidate(); // 모든 세션 삭제
		%>
			<script type="text/javascript">
				setTimeout(function() {
					alert("회원 탈퇴가 정상 처리 되었습니다!!");
					window.location="index"; // selectCnt == 2 : 환영합니다. 출력
				}, 1000);
			</script>
		</c:if>
	</c:if>
	
	
</body>
</html>