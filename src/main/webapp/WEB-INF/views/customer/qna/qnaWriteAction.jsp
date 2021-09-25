<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>qnaWriteAction</title>
</head>
<body>
	<!-- 글쓰기 실패 -->
	<c:if test="${insertCnt == 0 }">
		<script type="text/javascript">
			errorAlert(insertError);
		</script>
	</c:if>
	<!-- 글쓰기 성공 -->
	<c:if test="${insertCnt != 0 }">
		<script type="text/javascript">
			alert("글이 작성되었습니다");
			window.location = 'qnaList?pageNum=${pageNum}';
		</script>
	</c:if>
</body>
</html>