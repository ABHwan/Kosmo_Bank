<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>코스모 뱅크</title>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<%@ include file="/WEB-INF/views/include/setting.jsp" %>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />		
		</sec:authorize>
		
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="notice">
					<!-- 관리자 공지사항 -->
					<div class="card">
						<div class="card-header">
							<div class="card-title">공지사항</div>
						</div>
						<div class="card-body">
							<table class="table mt-3">
								<thead>
									<tr align="center">
										<th scope="col" colspan="3"> ${vo.notice_subject} </th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<td>작성자&emsp;:&emsp;${vo.notice_writer}</td>
										<td>조회수&emsp;:&emsp;${vo.notice_readCnt}</td>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_USER')">
										<td></td>
										<td></td>
										</sec:authorize>
										<td>작성일&emsp;:&emsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.notice_date}"/></td>
									</tr>
									<tr height="600">
										<td colspan="3">
											${vo.notice_content}										
										</td>
									</tr>
									<tr style="text-align:center; border-spacing:0 20px">
									<th colspan="3">
										<sec:authorize access="hasRole('ROLE_ADMIN')">
										<input type="button" value="글수정" class="btn btn-primary"
											onclick="window.location='${mngPath}mngNoticeModify?notice_num=${vo.notice_num}&pageNum=${pageNum}'">
										<input type="button" value="글삭제" class="btn btn-primary"
											onclick="window.location='${mngPath}mngNoticeDelete?notice_num=${vo.notice_num}&pageNum=${pageNum}'">
										</sec:authorize>
										<input type="button" value="목록" class="btn btn-primary btn-border"
											onclick="window.location='noticeList.do?pageNum=${pageNum}'">
									</th>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

	
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
	<script>
		Circles.create({
			id:'circles-1',
			radius:45,
			value:60,
			maxValue:100,
			width:7,
			text: 5,
			colors:['#f1f1f1', '#FF9E27'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-2',
			radius:45,
			value:70,
			maxValue:100,
			width:7,
			text: 36,
			colors:['#f1f1f1', '#2BB930'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-3',
			radius:45,
			value:40,
			maxValue:100,
			width:7,
			text: 12,
			colors:['#f1f1f1', '#F25961'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type: 'bar',
			data: {
				labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
				datasets : [{
					label: "Total Income",
					backgroundColor: '#ff9e27',
					borderColor: 'rgb(23, 125, 255)',
					data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
				}],
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false,
				},
				scales: {
					yAxes: [{
						ticks: {
							display: false //this will remove only the label
						},
						gridLines : {
							drawBorder: false,
							display : false
						}
					}],
					xAxes : [ {
						gridLines : {
							drawBorder: false,
							display : false
						}
					}]
				},
			}
		});

		$('#lineChart').sparkline([105,103,123,100,95,105,115], {
			type: 'line',
			height: '70',
			width: '100%',
			lineWidth: '2',
			lineColor: '#ffa534',
			fillColor: 'rgba(255, 165, 52, .14)'
		});
	</script>
<jsp:include page="/WEB-INF/views/include/chatbot.jsp" />
 
</body>
</html>