<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS Files -->
<link rel="stylesheet" href="${rePath}css/user/accountList.css">
</head>
<body>

<c:if test="${cnt != 0}">
<table id="subListTable" border="1">
	<tr>
		<th>
			${boardName}상품이름
		</th>
		<th>
			${boardName}계좌번호
		</th>
		<th>
			${boardName}은행명
		</th>
		<th>
			${boardName}가입날짜
		</th>
		<th>
			${boardName}상태
		</th>
		<th>
			${boardName}금리
		</th>
		<th>
			${boardName}금액
		</th>
		<th>
			${boardName}만기일
		</th>
	</tr>
	
	<hr>
	<c:forEach var="vo" items="${list}">
	
		<tr>
			<td>
				${vo.deposit_product_name}
			</td>
			<td>
				${vo.account_id}
			</td>
			<td>
			<!-- 로고처리할까? 
				-->
				<c:if test="${vo.deposit_product_bankCode == 0}">
					<c:out value="미기재"/>
				</c:if>
				<c:if test="${vo.deposit_product_bankCode == 1}">
					<c:out value="국민은행"/>
				</c:if>
				<c:if test="${vo.deposit_product_bankCode == 2}">
					<c:out value="우리은행"/>
				</c:if>
				<c:if test="${vo.deposit_product_bankCode == 3}">
					<c:out value="농협은행"/>
				</c:if>
				<c:if test="${vo.deposit_product_bankCode == 4}">
					<c:out value="신한은행"/>
				</c:if>
				<c:if test="${vo.deposit_product_bankCode == 5}">
					<c:out value="하나은행"/>
				</c:if>
			</td>
			<td>
				${vo.deposit_joinDate}
			</td>
			<td>
				${vo.deposit_state}
			</td>
			<td>
				${vo.deposit_rate}
			</td>
			<td>
				${vo.deposit_balance}
			</td>
			<td>
				${vo.deposit_endDate}
			</td>
		</tr>

	</c:forEach>
</table>

</c:if>

<c:if test="${cnt == 0}">
	<hr>
	<c:out value="해당 은행에 계좌가 없습니다."></c:out>
</c:if>

</body>
</html>