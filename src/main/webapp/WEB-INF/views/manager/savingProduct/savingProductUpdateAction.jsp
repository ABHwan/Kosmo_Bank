<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 상품 수정 처리</title>
</head>
<body>
<c:if test="${updateCnt==1}">
	<script type="text/javascript">
		alert("수정이 완료되었습니다.");
		window.location="savingProductList?pageNum=${pageNum}"
	</script>
</c:if> 
<c:if test="${updateCnt!=1}">
	<script type="text/javascript">
		alert("수정에 실패하였습니다. 입력하신 정보를 확인해주세요");
		window.history.back();
	</script>
</c:if> 
</body>
</html>