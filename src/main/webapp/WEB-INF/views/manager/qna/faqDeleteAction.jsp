<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제처리</title>
</head>
<body> 
<h2><center>삭제</center></h2>
	
	<c:if test="${deleteCnt == 0 }">
		<script type="text/javascript">
			errorAlert(updateQnaError);
			window.location="/bank/manager/faq"
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0 }">
		<script type="text/javascript">
			alert("게시글이 정상 삭제 되었습니다.");
			window.location="faq?faq_id=${faq_id}&pageNum=${pageNum}&number=${number + 1}";
		</script>
	</c:if> 


</body>
</html>