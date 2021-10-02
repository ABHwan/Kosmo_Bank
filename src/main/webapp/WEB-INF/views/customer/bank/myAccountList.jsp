<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 연동</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	
	
	<!-- 메인 폼-->
	<div class="main-panel">
		<div class="content">
			<!-- 고정헤더 -->
			<div class="panel-header bg-primary-gradient" style="height: 300px;">
				<div class="page-inner py-5">
					<div
						class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
						<div>
							<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1>
							<br />
							<h2 class="text-white op-7 mb-2">
								KOSMO BANK에 오신 것을 환영합니다.<br /> 저희는 고객님의 <strong>자산관리</strong>를
								효율적이고, 안전하게 도와드립니다. </br> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게
								통합하여 금융상품을 이용하실 수 있습니다.
							</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- 고정헤더 -->
	
			<div class="card">
				<div class="card-header">
					<div class="card-title">제 1금융권</div>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">은행명</th>
								
								
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								
								
							</tr>
							<tr>
								<td>2</td>
								<td>Jacob</td>
								
								
							</tr>
							<tr>
								<td>3</td>
								<td colspan="2">Larry the Bird</td>
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/footerJS.jsp" />
	
	

</body>
</html>