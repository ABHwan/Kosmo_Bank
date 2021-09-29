<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금상품등록</title>
</head>
<body>
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("상품등록에 실패하였습니다. 입력하신 정보를 확인해주세요");
		window.location='savingProductInsert';
	</script>
</c:if>

<c:if test="${insertCnt == 1}">
	<script type="text/javascript">
		alert("적금상품이 등록되었습니다");
		window.location='savingProductList';
	</script>
</c:if>
</body>
</html>