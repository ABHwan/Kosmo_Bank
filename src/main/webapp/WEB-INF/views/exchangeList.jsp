<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환율 리스트</title>
<script type="text/javascript" src="${rePath}js/exchange/exchange.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">환율 리스트</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">나라별 환율</div>
										<div class="card-body">
										<form action="" id="exchange" class="exchange">
											<table>
												<tr>
													<th>통화명</th>
													<th>매매기준율</th>
													<th>현찰 사실 때</th>
													<th>현찰 파실 때</th>
													<th>전신환보낼 때</th>
													<th>전신환받을 때</th>
												</tr>
												<c:forEach var="i" items="${list}">
												<tr>
													<td class="exchange"><a href="javascript:void(0);" onclick="exchangeVal(this);" attr-a="${i.exchange_country}">${i.exchange_country}</a></td>
													<td>${i.exchange_rate}</td>
													<td>${i.exchange_buy}</td>
													<td>${i.exchange_sell}</td>
													<td>${i.exchange_transfer}</td>
													<td>${i.exchange_recive}</td>
												</tr>
												</c:forEach>
											</table>
										</form>
									</div>
								</div>
							</div>
						</div>	
					</div>	
				</div>
			</div>
		</div>								
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footerB.jsp" /> 
 
	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

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
</body>
</html>