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
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br/>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>

						</div>
					</div>
				</div>
				<div class="page-inner mt--5">

					<div class="row" style="margin-bottom: 250px;">
						<c:if test="${sessionScope.customerID == null && sessionScope.adminID == null }">
						<div class="col-md-4" style="margin-left: 32%;">
							<div class="card card-info card-annoucement card-round" 
								style="background: #e8ecf1 !important; top: 100; border-radius: 100px; border: 4px solid #e8ecf1;">
								<div class="card-body text-center" style="padding: 30px 25px;">
									<div class="card-opening" style="color: black; font-size: 30px; font-weight: 600;">Welcome KOSMO BANK,</div>
									<div class="card-desc" style="color: black; font-weight: 500; font-size: 20px;">
										환영합니다! 더 많은 서비스를 이용하고 싶다면,<br>
										 <Strong>로그인</Strong>을 해주세요!
									</div>
									<div class="card-detail">
										<div class="login-btn-wrap">
											<button type="button" class="login-btn" onclick="window.location='${custPath}login.do'"
											onmouseover="style='background-color: lightseagreen !important;'"
											onmouseout="style='background-color: cadetblue !important;'">
												로그인 후 이용해주세요!
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					
					
						<c:if test="${sessionScope.customerID != null}">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
								
									<div class="card-title fw-mediumbold" style="display:flex;">보유중인 계좌
										<div class="account_link" style="margin-left: auto; margin-top: -3px;">
											<a href="accountConnect">
												<button class="btn btn-icon btn-primary btn-round btn-xs">
													<i class="fa fa-plus"></i>
												</button>
												<small>연동추가</small>
											</a>
										</div>
									</div>
									<div class="card-list">
										<div class="item-list">
											<div class="info-user ml-3">
											<c:choose>
											<c:when test="${sessionScope.customerID == null }">
												<div class="login-btn-wrap"><button type="button" class="login-btn" onclick="window.location='login.do'">로그인 후 이용해주세요!</button></div>
												<div class="status"> </div>
											</c:when>
											<c:when test="${vo.account_default == 1 }">
												<div class="status">대표계좌</div>
												<div class="username"><h2><fmt:formatNumber value="${vo.account_balance}"/>원</h2></div>
												<div class="status">${vo.account_id} </div>
											</c:when>	
											
											<c:otherwise>
												<div class="status">대표계좌</div>
												<div class="username"><h2 style="color:#4d7edc; font-weight:500;">대표를 계좌를 설정해주세요!</h2></div>
											</c:otherwise>
											
											</c:choose>
											
											</div>
										
										</div><br>
										<c:forEach var="dto" items="${dtos}" >
										<div class="item-list">
											<div class="avatar">
												<img src="${dto.account_bankImg}" alt="..." class="avatar-img rounded-circle">
											</div>
											<div class="info-user ml-3">
												<div class="username"><fmt:formatNumber value="${dto.account_balance }" />원</div>
												<div class="status">${dto.account_id}&nbsp;[${dto.account_stateContent}] </div>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="col-md-4">
							<div class="card">
								<div class="card-header">
									<div class="card-title">거래내역</div>
								</div>
								<div class="card-body">
									<table class="table table-hover card-table">
										<thead>
											<tr>
												<th scope="col">*</th>
												<th scope="col">금액</th>
												<th scope="col">잔액</th>
												<th scope="col">일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
											<tr>
												<td>카페</td>
												<td>10,000원</td>
												<td>10원</td>
												<td>2021-9-15</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="card full-height">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">추천 상품</div>
										<div class="card-tools">
											<ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
												<li class="nav-item">
													<a class="nav-link" id="pills-today" data-toggle="pill" href="#pills-today" role="tab" aria-selected="false">체크카드</a>
												</li>
												<li class="nav-item">
													<a class="nav-link active" id="pills-week" data-toggle="pill" href="#pills-week" role="tab" aria-selected="true">신용카드</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="d-flex">
										<div class="avatar">
											<img src="${rePath}images/card/taptap.png" alt="..." width="65px">
										</div>
										<div class="flex-1 ml-4 pt-1">
											<h6 class="fw-bold mb-1">삼성 taptap O<span class="text-warning pl-3">BEST</span></h6>
											<span class="text-muted">직접 선택하는 혜택, 탭탭오 옵션형!</span>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar">
											<img src="${rePath}images/card/hipoint.png" alt="..." width="65px">
										</div>
										<div class="flex-1 ml-4 pt-1">
											<h6 class="fw-bold mb-1">신한 Hi-Point</h6>
											<span class="text-muted">포인트! 백화점 상품권으로 돌려받자! 포인트 최고 5%적립</span>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar">
											<img src="${rePath}images/card/yolo.png" alt="..." width="65px">
										</div>
										<div class="flex-1 ml-4 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">신한 YOLO(미니언즈)<span class="text-danger pl-3">HIT</span></h6>
											<span class="text-muted">할인율과 디자인을 내 마음대로!! 나의 맞춤카드를 원하신다면, "YOLO"오세요~</span>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex">
										<div class="avatar">
											<img src="${rePath}images/card/toctoc.png" alt="..." width="65px">
										</div>
										<div class="flex-1 ml-4 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">국민 청춘대로 톡톡카드</h6>
											<span class="text-muted">Simple하게 즐기자! 혜택 톡톡!</span>
										</div>
									</div>
									<div class="separator-dashed"></div>
									<div class="d-flex"> 
										<div class="avatar">
											<img src="${rePath}images/card/city.png" alt="..." width="65px">
										</div>
										<div class="flex-1 ml-4 pt-1">
											<h6 class="text-uppercase fw-bold mb-1">씨티 리워드 카드</h6>
											<span class="text-muted">높은 수준의 씨티포인트 적립</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					</div>
						
					<!-- 외환정보 -->
					<div class="row row-card-no-pd">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<h4 class="card-title">실시간 환율</h4>
										<div class="card-tools">
											<button class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card"><span class="fa fa-sync-alt"></span></button>
										</div>
									</div>
									<p class="card-category">통화명을 클릭하시면 일자 별 상세정보를 확인하실 수 있습니다.</p>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6">
											<div class="table-responsive table-hover table-sales">
												<table class="table">
													<tbody>
													<c:forEach var="i" items="${list}">
														<tr>
															<td>
																<div class="flag">
																	<c:choose>
																		<c:when test="${i.exchange_country == '미국 USD'}">
																			<img src="${rePath}images/img/flags/us.png" alt="미쿸">
																		</c:when>
																		<c:when test="${i.exchange_country == '일본 JPY 100'}">
																			<img src="${rePath}images/img/flags/jp.png" alt="일본">
																		</c:when>
																		<c:when test="${i.exchange_country == '유로 EUR'}">
																			<img src="${rePath}images/img/flags/europeanunion.png" alt="유로">
																		</c:when>
																		<c:when test="${i.exchange_country == '중국 CNY'}">
																			<img src="${rePath}images/img/flags/cn.png" alt="중국">
																		</c:when>
																		<c:when test="${i.exchange_country == '홍콩 HKD'}">
																			<img src="${rePath}images/img/flags/hk.png" alt="홍콩">
																		</c:when>
																		<c:otherwise>
																			<img src="${rePath}images/img/flags/th.png" alt="태국">
																		</c:otherwise>
																	</c:choose>
																</div>
															</td>
															
															<td>${i.exchange_country}</td>
															<td class="text-right">
																${i.exchange_rate}
															</td>
															
															<c:choose>
															<c:when test="${i.exchange_com < 0}">
																<td class="text-danger" style="color:blue !important;">
																	${i.exchange_com}%
																</td>
															</c:when>
															
															<c:when test="${i.exchange_com > 0}">
																<td class="text-danger" style="color:red !important;">
																	${i.exchange_com}%
																</td>
															</c:when>
															<c:otherwise>
																<td class="text-danger" style="color:black !important;">
																	${i.exchange_com}%
																</td>	
															</c:otherwise>
															</c:choose>
														</tr>	
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-md-6">
											<div class="mapcontainer">
												<div id="map-example" class="vmap"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 외환정보 끝-->
					
						
					<div class="row">
						
						<div class="col-md-6">
							<div class="card card-primary bg-primary-gradient">
								<div class="card-body">
									<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">공지사항</h4>
									<p>저희 사이트 공지사항 안내입니다</p>
									<a class="text-info" href="#">더보기</a>
									<br>
									<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">실시간 문자 서비스</h4>
									<p>입출금내역이나 거래 등 변동사항 발생시 문자발송서비스입니다.</p>
									<a class="text-info" href="#">신청하기</a>
									<br>
									<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">24시간 챗봇 상담</h4>
									<p>업무시간 외에도 챗봇을 통해 간단한 상담이 가능합니다.</p>
									<a class="text-info" href="#">상담하러 가기</a>
									<br>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card full-height">
								<div class="card-header">
									<div class="card-title">금융 매거진</div>
								</div>
								<div class="card-body">
									<ol class="activity-feed">
										<li class="feed-item feed-item-secondary">
											<time class="date" datetime="9-25">금융|저축|직장인|노년준비|지출관리</time>
											<span class="text"><a href="https://www.banksalad.com/contents/%EC%A7%81%EC%9E%A5%EC%9D%B8%EC%9D%B4-%EC%B5%9C%EC%86%8C%ED%95%9C%EC%9D%98-%EA%B2%BD%EC%A0%9C%EC%A0%81-%EC%9E%90%EC%9C%A0%EB%A5%BC-%EC%96%BB%EA%B8%B0-%EC%9C%84%ED%95%9C-3%EA%B0%80%EC%A7%80-%EB%B0%A9%EB%B2%95--0020">직장인이 최소한의 경제적 자유를 얻기 위한 3가지 방법 ①</a></span>
										</li>
										<li class="feed-item feed-item-success">
											<time class="date" datetime="9-24">카드|금융|20대|30대</time>
											<span class="text"><a href="https://www.banksalad.com/cards/themes/%ED%98%84%EA%B8%88%EC%9C%BC%EB%A1%9C-%EB%8F%8C%EB%A0%A4%EB%B0%9B%EB%8A%94-%EC%BA%90%EC%8B%9C%EB%B0%B1-%EC%B9%B4%EB%93%9C-BEST-msUBU">현금으로 돌려받는 캐시백 카드 BEST</a></span>
										</li>
										<li class="feed-item feed-item-info">
											<time class="date" datetime="9-23">금융|저축|지출|투자</time>
											<span class="text"><a href="https://www.banksalad.com/contents/%EA%B2%BD%EC%A0%9C%EC%A0%81-%EC%9E%90%EC%9C%A0%EB%A5%BC-%EC%96%BB%EA%B3%A0-%EC%8B%B6%EB%8B%A4%EB%A9%B4-%EB%8B%B9%EC%9E%A5-%EC%8B%A4%ED%96%89%ED%95%B4%EC%95%BC-%ED%95%A0-5%EA%B0%80%EC%A7%80-af01">경제적 자유를 얻고 싶다면 당장 실행해야 할 5가지</a></span>
										</li>
										<li class="feed-item feed-item-warning">
											<time class="date" datetime="9-21">금융|저축|직장인|지출관리</time>
											<span class="text"><a href="https://www.banksalad.com/contents/%EC%83%9D%ED%99%9C%EA%B8%88%EC%9C%B5-100%EB%8B%A8-%EC%A0%80%EC%B6%95%EC%9D%84-%EA%B0%80%EB%A1%9C%EB%A7%89%EB%8A%94-%EC%A7%80%EC%B6%9C-%EC%8A%B5%EA%B4%80%EC%97%90%EC%84%9C-%ED%83%88%EC%B6%9C%ED%95%98%EA%B8%B0-f7CWe">저축을 가로막는 지출 습관 탈출!</a></span>
										</li>
										<li class="feed-item feed-item-danger">
											<time class="date" datetime="9-18">금융|신용관리|대출|사회초년생</time>
											<span class="text"><a href="https://www.banksalad.com/contents/%EC%B4%88%EB%B3%B4%EC%9E%90%EB%A5%BC-%EC%9C%84%ED%95%9C-%EC%8B%A0%EC%9A%A9%EB%93%B1%EA%B8%89-%EA%B4%80%EB%A6%AC-%EA%B0%9C%EB%A1%A0-da8b">초보자를 위한 신용등급 관리 개론</a></span>
										</li>
										<li class="feed-item">
											<time class="date" datetime="9-17">금융|1인가구|주부|짠테크|지출관리</time>
											<span class="text"><a href="https://www.banksalad.com/contents/%EC%A0%84%EA%B8%B0%EC%84%B8%EB%A5%BC-%EC%95%84%EB%81%BC%EB%8A%94-%EB%98%90-%EB%8B%A4%EB%A5%B8-%EB%B0%A9%EB%B2%95%EB%93%A4-ba76">전기세를 아끼는 또 다른 방법들</a></span>
										</li>
									</ol>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>

		
		</div>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
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