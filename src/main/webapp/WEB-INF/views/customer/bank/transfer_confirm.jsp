<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>코스모 뱅크</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">

</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">

				<div class="page-inner">

					<div class="row">

						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="card-title fw-mediumbold">이체 확인</div>
									<div class="card-list">
										<hr>
										
										
		<!-- table  -->
		<div class="container">
			<div class="table-responsive">
				<table class="table table-head-bg-primary mt-4">
					<thead>
						<tr class="table-danger">
							<th scope="col">출금계좌</th>
							<th scope="col">입금은행<br>입금계좌
							</th>
							<th scope="col">받은분</th>
							<th scope="col">이체금액(원)</th>
							<th scope="col">날짜</th>
							<th scope="col">내통장<br>메모
							</th>
							<th scope="col">받는통장<br>메모
							</th>
						</tr>
					</thead>
		
					<tbody>
						<tr class="table-light">
							<td>{출금계좌번호}</td>
							<td>{입금은행}<br>{입금계좌}
							</td>
							<td>{받는분}</td>
							<td>{이체금액}</td>
							<td>{날짜}</td>
							<td>{내통장메모}</td>
							<td>{받은통장메모}</td>
						</tr>
					</tbody>
				</table>
		
				<table class="table table-head-bg-primary mt-4">
					<tbody>
						<tr class="table-light">
							<td>{이체건수}</td>
							<td>{이체금액}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

											<div class="my-info text-center">

												<table>
													<tr>
												</table>
												<input class="btn btn-info" data-toggle="modal"
													data-target="#sendMoney" type="submit"
													data-target="#sendMoney" value="확인" onclick="window.location='index.do'">
											</div>
										
									</div>
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