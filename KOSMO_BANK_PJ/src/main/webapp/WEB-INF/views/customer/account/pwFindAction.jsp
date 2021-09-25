<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기페이지</title>
</head>
<body>
<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
		alert("비밀번호 찾기에 실패하였습니다. 입력하신 정보를 확인해주세요");
		window.location='pwFind.do';
	</script>
</c:if>

<c:if test="${updateCnt == 1}">
	<script type="text/javascript">
		alert("입력하신 이메일로 임시비밀번호를 전송하였습니다. 확인해주세요");
		window.location='login.do';
	</script>
</c:if>
</body>
</html>