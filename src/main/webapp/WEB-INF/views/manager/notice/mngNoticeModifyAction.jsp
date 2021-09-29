<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모 뱅크</title>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
</head>
<body>

<!-- 글쓰기 실패 -->
<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
		alert("공지사항 수정실패");
		window.history.go(-1);
	</script>
</c:if>

<!-- 글쓰기 성공 -->
<c:if test="${updateCnt != 0 }">
	<script type="text/javascript">
		alert("공지사항 수정완료");
		window.location='${custPath}noticeList.do?pageNum=${pageNum}';
	</script>
</c:if>

</body>
</html>