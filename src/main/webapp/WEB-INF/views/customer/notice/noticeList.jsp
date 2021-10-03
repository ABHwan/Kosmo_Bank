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
				<div class="page-inner">
					<div class="page-header">
							<h4 class="page-title"> 고객센터 </h4>
							
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">공지사항</a>
							</li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">공지사항관리</a>
							</li>
							</sec:authorize>
							
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<h4 class="card-title">공지사항</h4>
								</sec:authorize>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<!-- 관리자 공지사항 -->
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<table id="basic-datatables" class="display table table-striped table-hover" >
											<thead>
												<tr>
													<th style="width:15%"> 글번호 </th>
													<th style="width:45%"> 글제목 </th>
													<th style="width:10%"> 작성자 </th>
													<th style="width:15%"> 작성일 </th>
													<th style="width:10%"> 조회수 </th>
												</tr>
											</thead>
											<tbody>
												<!-- 게시글이 있으면 -->
												<c:if test="${cnt>0}">
													<c:forEach var="vo" items="${list}">
														<tr>
															<td> ${number} 
																<c:set var="number" value="${number -1 }" />
															</td>									
															<td> 
																<a href="../customer/noticeDetail.do?notice_num=${vo.notice_num}&pageNum=${pageNum}&number=${number +1}">
																	${vo.notice_subject}
																</a>
															</td>
															<td> ${vo.notice_writer} </td>
															<td> 
																<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.notice_date}"/>
															</td>
															<td> ${vo.notice_readCnt} </td>
														</tr>
													</c:forEach> 
												</c:if>
												<tr>
													<td colspan="5">
														조회수는 고객이 눌렀을 때만 작동합니다.
													</td>
												</tr>
											</tbody>
											<!-- 게시글이 없으면 -->
											<tbody>
												<c:if test="${cnt==0}">
													<tr>
														<td colspan="5" align="center">
															게시글이 없습니다. 글을 작성해주세요!!
														</td>
													</tr>
												</c:if>
											</tbody>
										</table>
										
										<button class="btn btn-primary" type="button" onclick="location.href='${mngPath}mngNoticeWrite?pageNum=${pageNum}'"> 글쓰기 </button>
									</sec:authorize>
					
									<!-- 고객 공지사항 -->
									<sec:authorize access="hasRole('ROLE_USER')">
										<table id="basic-datatables" class="display table table-striped table-hover" >
											<thead>
												<tr>
													<th style="width:15%"> 글번호 </th>
													<th style="width:55%"> 글제목 </th>
													<th style="width:15%"> 작성일 </th>
												</tr>
											</thead>
											<!-- 게시글이 있으면 -->
											<tbody>
												<c:if test="${cnt>0}">
													<c:forEach var="vo" items="${list}">
														<tr>
															<td> ${number} 
																<c:set var="number" value="${number -1 }" />
															</td>									
															<td> 
																<a href="noticeDetail.do?notice_num=${vo.notice_num}&pageNum=${pageNum}&number=${number +1}">
																	${vo.notice_subject}
																</a>
															</td>
															<td> 
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.notice_date}"/>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
											<!-- 게시글이 없으면 -->
											<c:if test="${cnt==0}">
												<tr>
													<td colspan="3" align="center">
														공지사항 게시글이 없습니다.
													</td>
												</tr>
											</c:if>
										</table>
									</sec:authorize>
									
									<!-- 페이지 컨트롤 -->
									<table style="width:1000px; align:center">
								    	<tr>
								        	<th align="center">
								            	<!-- 게시글이 있으면 -->
								            	<c:if test="${cnt > 0}">
								            		<!-- 처음[◀◀] / 이전블록[◀]  -->
								            		<c:if test="${startPage > pageBlock}">
								            			<a href="${custPath}noticeList.do"> [◀◀] </a>
								            			<a href="${custPath}noticeList.do?pageNum=${startPage - pageBlock}"> [◀] </a>
								            		</c:if>
								            		
				            		<!-- 블록내의 페이지번호 -->
				            		<c:forEach var="i" begin="${startPage}" end="${endPage}">
				            			<c:if test="${i == currentPage}">
				            				<span><b>[${i}]</b></span>
				            			</c:if>
				            			
				            			<c:if test="${i != currentPage}">
				            				<a href="${custPath}noticeList.do?pageNum=${i}"> [${i}] </a>
				            			</c:if>
				            		</c:forEach>
				            		
				            		<!-- 다음블록[▶] / 마지막[▶▶]  -->
				            		<c:if test="${pageCount > endPage}">
				            			<a href="${custPath}noticeList.do?pageNum=${startPage + pageBlock}"> [▶] </a>
				            			<a href="${custPath}noticeList.do?pageNum=${pageCount}"> [▶▶] </a>
				            		</c:if>
				            	</c:if>
				        	</th>
				    	</tr>
					</table>
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