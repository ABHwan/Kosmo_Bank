<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동이체 신청</title>
</head>
<body>
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("자동이체등록에 실패하였습니다. 입력하신정보를 확인해주시거나 잠시 후 다시시도해주세요.");
		window.location='autoTransferInsert';
	</script>
</c:if>

<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("자동이체등록이 완료되었습니다!");
		window.location='autoTransferList';
	</script>
</c:if>
</body>
</html>