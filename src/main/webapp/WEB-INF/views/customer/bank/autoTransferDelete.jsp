<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동이체 해지</title>
</head>
<body>
<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("해지에 실패하였습니다. 잠시 후 다시시도해주세요.");
		window.location='autoTransferList';
	</script>
</c:if>

<c:if test="${deleteCnt == 1}">
	<script type="text/javascript">
		alert("해지가 완료되었습니다.");
		window.location='autoTransferList';
	</script>
</c:if>
</body>
</html>