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
	<!-- CSS Files -->
	<link rel="stylesheet" href="${rePath}css/user/accountList.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. </br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card">
				<div class="select">	
					<p> &nbsp;&nbsp;&nbsp;${member_name}님의 ${boardName}리스트 </p>
<%-- 					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/icon.ico"></button>
					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/국민.PNG"></button>
					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/우리.PNG"></button>
					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/농협.PNG"></button>
					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/신한.PNG"></button>
					<button type="button" class="btn_image"><img id="bank_logo" src="${rePath}images/img/하나.PNG"></button>
				<!-- account_type만 선택시 해당 전체리스트
					account_bank로 sub select시 bank에 따른 쿼리
				 -->
				 	<br> <p>버튼은 보류</p> --%>
				 	<br>
				</div>
				
				<div class="selectTable">
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
									${vo.irp_product_name}
								</td>
								<td>
									${vo.account_id}
								</td>
								<td>
								<!-- 로고처리할까? 
									-->
									<c:if test="${vo.irp_product_bankCode == 0}">
										<c:out value="미기재"/>
									</c:if>
									<c:if test="${vo.irp_product_bankCode == 1}">
										<c:out value="국민은행"/>
									</c:if>
									<c:if test="${vo.irp_product_bankCode == 2}">
										<c:out value="우리은행"/>
									</c:if>
									<c:if test="${vo.irp_product_bankCode == 3}">
										<c:out value="농협은행"/>
									</c:if>
									<c:if test="${vo.irp_product_bankCode == 4}">
										<c:out value="신한은행"/>
									</c:if>
									<c:if test="${vo.irp_product_bankCode == 5}">
										<c:out value="하나은행"/>
									</c:if>
								</td>
								<td>
									${vo.irp_joinDate}
								</td>
								<td>
									${vo.irp_state}
								</td>
								<td>
									${vo.irp_rate}
								</td>
								<td>
									${vo.irp_balance}
								</td>
								<td>
									${vo.irp_endDate}
								</td>
							</tr>
					
						</c:forEach>
					</table>
					
					</c:if>
					
					<c:if test="${cnt == 0}">
						<hr>
						<c:out value="해당 은행에 계좌가 없습니다."></c:out>
					</c:if>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
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