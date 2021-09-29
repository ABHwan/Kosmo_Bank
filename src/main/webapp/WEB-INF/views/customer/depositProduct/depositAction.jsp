<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 - 예금 상품 추가 처리 페이지</title>
	
	<c:if test="${insertCnt == 0 && insertDeposit ==0}">
		<script type="text/javascript">
			errorAlert(updateQnaError);
			window.location="/bank/customer/deposit.do"
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0 && insertDeposit !=0}">
		<script type="text/javascript">
			alert("가입이 완료되었습니다!");
			window.location="index.do";
		</script>
	</c:if>
</head>
<body>

</body>
</html>