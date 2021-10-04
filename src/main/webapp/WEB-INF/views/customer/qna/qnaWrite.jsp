<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>qnaWrite page</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${rePath}css/user/qnaWrite.css">
<!-- Fonts and icons -->
<script src="${rePath}js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '${rePath}css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>

<!-- CSS Files -->
<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
<link rel="stylesheet" href="${rePath}css/atlantis.min.css">
<link rel="stylesheet" href="${rePath}css/user/qnaList.css">
<link rel="stylesheet" href="${rePath}css/user/qnaWrite.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="${rePath}css/demo.css">
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
								효율적이고, 안전하게 도와드립니다. <br /> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여
								보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.
							</h2>
						</div>
					</div>
				</div>
			</div>
			<section id="main">
				<div class="main__container" style="width: 95%;">
					<h2 class="title">문의 하기</h2>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">문의사항 작성</div>
								</div>
								<div class="card-body">
									<form action="qnaWriteAction" name="qnaform" method="post"
										onsubmit="return qnaCheck();">
										<sec:csrfInput />
										<input type="hidden" value="${sessionScope.customerID}"
											name="customerID"> <input type="hidden"
											value="${pageNum}" name="pageNum">

										<!-- 2018-11-12 수정 : 만 14세 이상 동의 체크박스 추가 및 약관영역 수정 -->

										<table class="table table-bordered">
											<!-- <colgroup>
											<col style="width: 25%;">
											<col style="width: *;">
										</colgroup> -->
											<tbody>
												<tr>
													<th>이용 안내</th>
												</tr>
												<tr>
													<th scope="row">수집하는 개인정보와 문의 사항 및 기타 내용은 고객의 불편사항에 대한
														목적이 달성되면 지체 없이 파기됩니다.</th>
												</tr>

											</tbody>
										</table>

										<table class="qna_table">
											<tr>
												<th><label for="inquiry_title">문의 제목</label></th>
												<td><input type="text" id="inquiry_title"
													name="inquiry_title" maxlength="50"
													placeholder="제목을 입력해 주세요."></td>
											</tr>

											<tr>
												<th><label for="inquiry_content">문의 내용</label></th>
												<td height="300px"><textarea id="inquiry_content"
														class="form-control input-border-bottom"
														name="inquiry_content" placeholder="문의 내용을 입력하세요."
														rows="10" word-break:break-all> </textarea></td>
											</tr>

											<tr>
												<td colspan="2"><br>
													<div class="complete_cancel" align="center">
														<input type="submit" id="qna_submit"
															class="btn btn-primary" value="등록"> <input
															type="reset" id="qna_reset"
															class="btn btn-primary btn-border" value="취소"
															onclick="window.parent.location='qnaList';">
													</div></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		</div>
		<!-- jQuery UI -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>
		
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
	<script>
		Circles.create({
			id : 'circles-1',
			radius : 45,
			value : 60,
			maxValue : 100,
			width : 7,
			text : 5,
			colors : [ '#f1f1f1', '#FF9E27' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		Circles.create({
			id : 'circles-2',
			radius : 45,
			value : 70,
			maxValue : 100,
			width : 7,
			text : 36,
			colors : [ '#f1f1f1', '#2BB930' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		Circles.create({
			id : 'circles-3',
			radius : 45,
			value : 40,
			maxValue : 100,
			width : 7,
			text : 12,
			colors : [ '#f1f1f1', '#F25961' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart')
				.getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type : 'bar',
			data : {
				labels : [ "S", "M", "T", "W", "T", "F", "S", "S", "M", "T" ],
				datasets : [ {
					label : "Total Income",
					backgroundColor : '#ff9e27',
					borderColor : 'rgb(23, 125, 255)',
					data : [ 6, 4, 9, 5, 4, 6, 4, 3, 8, 10 ],
				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				legend : {
					display : false,
				},
				scales : {
					yAxes : [ {
						ticks : {
							display : false
						//this will remove only the label
						},
						gridLines : {
							drawBorder : false,
							display : false
						}
					} ],
					xAxes : [ {
						gridLines : {
							drawBorder : false,
							display : false
						}
					} ]
				},
			}
		});

		$('#lineChart').sparkline([ 105, 103, 123, 100, 95, 105, 115 ], {
			type : 'line',
			height : '70',
			width : '100%',
			lineWidth : '2',
			lineColor : '#ffa534',
			fillColor : 'rgba(255, 165, 52, .14)'
		});
	</script>
</body>
</html>