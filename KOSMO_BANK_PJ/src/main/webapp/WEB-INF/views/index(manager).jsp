<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>코스모 뱅크</title>
</head>
<body>
	<div class="wrapper">

		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		
		<!-- 메인 폼-->

		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">관리자</h4>
					<div class="page-category"></div>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">카드 가입자 비율</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="pieChartCard" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">상품 가입자 비율</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="pieChartGift" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>		
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">은행별 고객 비율</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="pieChartBank" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>										
						<div class="col-md-6">	
							<div class="card">
								<div class="card-header">
									<div class="card-title">신규 가입자 수</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="barChart"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="card full-height">
								<div class="card-header">
									<div class="card-title">대출 신청 목록</div>
								</div>
								<div class="card-body">
									<ol class="activity-feed">
										<li class="feed-item feed-item-secondary">
											<time class="date" datetime="9-15">21/09/15 <b>김탁곤</b> 님</time>
											<span class="text"><a href="#">주택구입자금 : 500,000,000 원</a></span>
										</li>
										<li class="feed-item feed-item-success">
											<time class="date" datetime="9-14">21/09/14 <b>안복환</b> 님</time>
											<span class="text"><a href="#">주거목적 임차자금 : 100,000,000 원</a></span>
										</li>
										<li class="feed-item feed-item-info">
											<time class="date" datetime="9-13">21/09/13 <b>진지현</b> 님</time>
											<span class="text"><a href="#">생활자금 : 50,000,000 원</a></span>
										</li>
										<li class="feed-item feed-item-warning">
											<time class="date" datetime="9-13">21/09/13 <b>정지은</b> 님</time>
											<span class="text"><a href="#">부채상환 : 10,000,000 원</a></span>
										</li>
										<li class="feed-item feed-item-danger">
											<time class="date" datetime="9-11">21/09/11 <b>김유성</b> 님</time>
											<span class="text"><a href="#">이주비 : 5,000,000 원</a></span>
										</li>
									</ol>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card card-primary bg-primary-gradient">
								<div class="card-body">
									<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">공지사항</h4>
									<p>명절 보이스피싱 관련 대비 자료</p>
									<a class="text-info" href="#">더보기</a>
									<p class="mt-3 b-b1 pb-2 mb-4 fw-bold"></p>
									<br>
									<p>저희 사이트 공지사항 안내입니다</p>
									<a class="text-info" href="#">더보기</a>
									<p class="mt-3 b-b1 pb-2 mb-4 fw-bold"></p>
									<br>
									<p>저희 사이트를 가입해주시고 항상 이용해 주신분들에게 감사드립니다.</p>
									<a class="text-info" href="#">더보기</a>
									<br>
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
	<script>
	/* 카드별 차트 */
	var myPieChart = new Chart(pieChartCard, {
		type: 'pie',
		data: {
			datasets: [{
				data: [50, 35, 25, 60, 15],
				backgroundColor :["#1d7af3","#f3545d","#fdaf4b", "#00c652", "#fff176"],
				borderWidth: 0
			}],
			labels: ['삼성 tabtab O', '신한 Hi-Point', '신한 YOLO', '국민 청춘대로', '씨티 리워드'] 
		},
		options : {
			responsive: true, 
			maintainAspectRatio: false,
			legend: {
				position : 'bottom',
				labels : {
					fontColor: 'rgb(154, 154, 154)',
					fontSize: 11,
					usePointStyle : true,
					padding: 20
				}
			},
			pieceLabel: {
				render: 'percentage',
				fontColor: 'white',
				fontSize: 14,
			},
			tooltips: false,
			layout: {
				padding: {
					left: 20,
					right: 20,
					top: 20,
					bottom: 20
				}
			}
		}
	});
	/* 상품별 차트 */
	var myPieChart = new Chart(pieChartGift, {
		type: 'pie',
		data: {
			datasets: [{
				data: [50, 35, 15],
				backgroundColor :["#1d7af3","#f3545d","#fdaf4b"],
				borderWidth: 0
			}],
			labels: ['예금', '적금', '연금'] 
		},
		options : {
			responsive: true, 
			maintainAspectRatio: false,
			legend: {
				position : 'bottom',
				labels : {
					fontColor: 'rgb(154, 154, 154)',
					fontSize: 11,
					usePointStyle : true,
					padding: 20
				}
			},
			pieceLabel: {
				render: 'percentage',
				fontColor: 'white',
				fontSize: 14,
			},
			tooltips: false,
			layout: {
				padding: {
					left: 20,
					right: 20,
					top: 20,
					bottom: 20
				}
			}
		}
	});
	/* 은행별 차트 */
	var myPieChart = new Chart(pieChartBank, {
		type: 'pie',
		data: {
			datasets: [{
				data: [50, 35, 15, 25, 42],
				backgroundColor :["#1d7af3","#f3545d","#fdaf4b", "#00c652", "#fff176"],
				borderWidth: 0
			}],
			labels: ['국민', '신한', '기업', '우리', '하나'] 
		},
		options : {
			responsive: true, 
			maintainAspectRatio: false,
			legend: {
				position : 'bottom',
				labels : {
					fontColor: 'rgb(154, 154, 154)',
					fontSize: 11,
					usePointStyle : true,
					padding: 20
				}
			},
			pieceLabel: {
				render: 'percentage',
				fontColor: 'white',
				fontSize: 14,
			},
			tooltips: false,
			layout: {
				padding: {
					left: 20,
					right: 20,
					top: 20,
					bottom: 20
				}
			}
		}
	});	
	var myBarChart = new Chart(barChart, {
		type: 'bar',
		data: {
			labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			datasets : [{
				label: "가입자수",
				backgroundColor: 'rgb(23, 125, 255)',
				borderColor: 'rgb(23, 125, 255)',
				data: [3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4],
			}],
		},
		options: {
			responsive: true, 
			maintainAspectRatio: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero:true
					}
				}]
			},
		}
	});
	
	var myHtmlLegendsChart = new Chart(htmlLegendsChart, {
		type: 'line',
		data: {
			labels: ["09:00", "10:00", "11:00", "12:00", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			datasets: [ {
				label: "Subscribers",
				borderColor: gradientStroke2,
				pointBackgroundColor: gradientStroke2,
				pointRadius: 0,
				backgroundColor: gradientFill2,
				legendColor: '#f3545d',
				fill: true,
				borderWidth: 1,
				data: [154, 184, 175, 203, 210, 231, 240, 278, 252, 312, 320, 374]
			}, {
				label: "New Visitors",
				borderColor: gradientStroke3,
				pointBackgroundColor: gradientStroke3,
				pointRadius: 0,
				backgroundColor: gradientFill3,
				legendColor: '#fdaf4b',
				fill: true,
				borderWidth: 1,
				data: [256, 230, 245, 287, 240, 250, 230, 295, 331, 431, 456, 521]
			}, {
				label: "Active Users",
				borderColor: gradientStroke,
				pointBackgroundColor: gradientStroke,
				pointRadius: 0,
				backgroundColor: gradientFill,
				legendColor: '#177dff',
				fill: true,
				borderWidth: 1,
				data: [542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900]
			}]
		},
		options : {
			responsive: true, 
			maintainAspectRatio: false,
			legend: {
				display: false
			},
			tooltips: {
				bodySpacing: 4,
				mode:"nearest",
				intersect: 0,
				position:"nearest",
				xPadding:10,
				yPadding:10,
				caretPadding:10
			},
			layout:{
				padding:{left:15,right:15,top:15,bottom:15}
			},
			scales: {
				yAxes: [{
					ticks: {
						fontColor: "rgba(0,0,0,0.5)",
						fontStyle: "500",
						beginAtZero: false,
						maxTicksLimit: 5,
						padding: 20
					},
					gridLines: {
						drawTicks: false,
						display: false
					}
				}],
				xAxes: [{
					gridLines: {
						zeroLineColor: "transparent"
					},
					ticks: {
						padding: 20,
						fontColor: "rgba(0,0,0,0.5)",
						fontStyle: "500"
					}
				}]
			}, 
			legendCallback: function(chart) { 
				var text = []; 
				text.push('<ul class="' + chart.id + '-legend html-legend">'); 
				for (var i = 0; i < chart.data.datasets.length; i++) { 
					text.push('<li><span style="background-color:' + chart.data.datasets[i].legendColor + '"></span>'); 
					if (chart.data.datasets[i].label) { 
						text.push(chart.data.datasets[i].label); 
					} 
					text.push('</li>'); 
				} 
				text.push('</ul>'); 
				return text.join(''); 
			}  
		}
	});
	</script>
</body>
</html>