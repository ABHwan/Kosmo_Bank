<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>관리자 - 문의사항</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon" />

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
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="${rePath}css/demo.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">문의내역 관리</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">문의내역 답변하기</div>
								</div>
								<div class="card-body">

									<c:if test="${cnt > 0 }">
										<%-- <c:forEach var="작은 바구니 참조변수" items="${큰 바구니}"> --%>

										<div class="qna_div">
											<form action="qnaAnswer" method="post">
												<sec:csrfInput />
												<input type="hidden" name="pageNum" value="${pageNum}">
												<table class="qna_table">
													<tr class="qna_top">
														<th id="inquiry_id">번호</th>
														<th id="inquiry_title">제목</th>
														<th id="inquiry_regDate">문의글 등록일</th>
														<th>답변하기</th>
													</tr>
													<c:forEach var="dto" items="${dtos}">
														<tr class="hide">
															<!-- 문의 번호 -->
															<td>${number}<c:set var="number"
																	value="${number - 1}" /> <!-- qna_seq 번호 --> <input
																type="hidden" name="inquiry_id"
																value="${dto.inquiry_id}">
															</td>

															<%--    <!-- 상세페이지 -->
						            	<a href="boardDetail.bo?num=${dto.num}&pageNum=${pageNum}&number=${number + 1}">${dto.getSubject()}</a> --%>
															<!-- 문의 제목 [문의유형] 제목 -->
															<td id="inquiry_title">${dto.inquiry_title}</td>

															<!-- 문의 등록일 -->
															<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																	value="${dto.inquiry_regDate}" /></td>
															<td><input type="submit" id="answer" value="답변하기"></td>
														</tr>
													</c:forEach>
												</table>
											</form>
										</div>

									</c:if>


									<!-- 페이지 컨트롤 -->
									<table align="center" style="width: 1000px" align="center">
										<tr>
											<th align="center">
												<!--  게시글이 있으면 --> <c:if test="${cnt > 0 }">
													<!-- 처음[◀◀] / 이전블록[◀] /  -->
													<c:if test="${startPage > pageBlock}">
														<a href="qnaList"> [◀◀] </a>
														<a href="qnaList?pageNum=${startPage - pageBlock}">
															[◀] </a>
													</c:if>

													<!-- 블록 내의 페이지 번호 -->
													<c:forEach var="i" begin="${startPage }" end="${endPage }">
														<c:if test="${i == currentPage}">
															<span><b>[${i}]</b></span>
														</c:if>

														<c:if test="${i != currentPage}">
															<a href="qnaList?pageNum=${i}">[${i}]</a>
														</c:if>
													</c:forEach>

													<!-- 다음블록[▶] // 마지막[▶▶] -->
													<c:if test="${pageCount > endPage }">
														<a href="qnaList?pageNum=${startPage + pageBlock}">[▶]</a>
														<a href="qnaList?pageNum=${pageCount}">[▶▶]</a>
													</c:if>
												</c:if>
											</th>
										</tr>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
</body>
</html>