<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>코스모 뱅크</title>
<style>
.input{
	height: 40px;
}
</style>
<%-- <link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css"> --%>
<script src="${rePath}js/utility.js"></script>
</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
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
				<div class="page-inner">
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">
										<div class="d-flex justify-content-between mt-2">지방세
											</div>
									</div>
								</div>
<!-- table  -->
<div class="card-body"> 
	<table class="table table-hover card-table">
		<thead>
			<tr>
				<th scope="col">전자납부번호</th>
				<th scope="col">납부 계좌번호</th>
				<th scope="col">납부할 지방세</th>
				<th scope="col">선택</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${cnt > 0}">
				<c:forEach var="li" items="${list}">
					<tr class="local_item${li.utility_num}">

						<td>${li.utility_num}</td>
						<td>
							<select class="input" name="account_id">
								<c:forEach var="dto" items="${dtos}">
									<option value="${dto}">${dto}</option>
								</c:forEach>
							</select>
						</td>
						<td>${li.utility_money}
							<input type="hidden" id="utility_money" name="utility_money" value="${li.utility_money}">
						</td>
						
						<td>
							<button type="button"
								class="btn btn-link btn-primary btn-lg"
								onclick="local_summit(${li.utility_num})">
								<i class="fas fa-coins">납부</i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="4">납부할 공과금이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script
		src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script
		src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="${rePath}js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="${rePath}js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="${rePath}js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="${rePath}js/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="${rePath}js/setting-demo.js"></script>
	<script src="${rePath}js/demo.js"></script>
	<%@ include file="/WEB-INF/views/include/chatbot.jsp"%>

</body>
</html>