<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${selectCnt == 0 }">
		<script type="text/javascript">
			alert("인증실패!");
			window.location = "qnaModifyCheck?inquiry_id=${inquiry_id}&pageNum=${pageNum}"
		</script>
	</c:if>
	
	<c:if test="${selectCnt != 0 }">
		<script type="text/javascript">
			alert("인증성공!");
			window.location = "qnaModifyDetail?inquiry_id=${inquiry_id}&pageNum=${pageNum}"
		</script>
	</c:if>
	
</body>
</html>