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
<h2><center>글삭제 </center></h2>
	
	<c:if test="${deleteCnt == 0 }">
		<script type="text/javascript">
			errorAlert(updateQnaError);
			window.location="/bank/customer/qnaList"
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0 }">
		<script type="text/javascript">
			alert("게시글이 삭제되었습니다.");
			window.location="qnaList?inquiry_id=${inquiry_id}&pageNum=${pageNum}&number=${number + 1}";
		</script>
	</c:if>
	
</body>
</html>