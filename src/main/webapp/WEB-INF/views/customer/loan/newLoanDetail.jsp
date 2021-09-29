<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모 뱅크</title>
</head>
<body>	
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				
				<div class="page-inner">
					<div class="page-title">
						[<c:choose>
							<c:when test="${loanProduct.loan_product_bankCode == 0}">
								미기재
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 1}">
								국민
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 2}">
								우리
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 3}">
								농협
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 4}">
								신한
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 5}">
								하나
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 6}">
								코스모
							</c:when>
						</c:choose>]&nbsp;${loanProduct.loan_product_name}
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body ">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-primary bubble-shadow-small">
												<i class="flaticon-graph-1"></i>
											</div>
										</div>
										<div class="col col-stats ml-3 ml-sm-0">
											<div class="numbers">
												<p class="card-category">금리</p>
												<h4 class="card-title">${loanProduct.loan_product_rate}&nbsp;%</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-info bubble-shadow-small">
												<i class="flaticon-coins"></i>
											</div>
										</div>
										<div class="col col-stats ml-3 ml-sm-0">
											<div class="numbers">
												<p class="card-category">최대 대출금액</p>
												<h4 class="card-title"><fmt:formatNumber value="${loanProduct.loan_product_maxPrice}" pattern="#,###.##" />&nbsp;원</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-success bubble-shadow-small">
												<i class="flaticon-calendar"></i>
											</div>
										</div>
										<div class="col col-stats ml-3 ml-sm-0">
											<div class="numbers">
												<p class="card-category">대출기간</p>
												<h4 class="card-title">${loanProduct.loan_product_minDate}&nbsp;~&nbsp;${loanProduct.loan_product_maxDate}&nbsp;년</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div class="icon-big text-center icon-secondary bubble-shadow-small">
												<i class="flaticon-success"></i>
											</div>
										</div>
										<div class="col col-stats ml-3 ml-sm-0">
											<div class="numbers">
												<p class="card-category">중도상환수수료요율</p>
												<h4 class="card-title">${loanProduct.loan_product_prepaymentRate}&nbsp;%</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">
										<div class="d-flex justify-content-center">
											${loanProduct.loan_product_name}			
										</div>
									</div>
								</div>
								
								<div class="card-body">
									<table class="table table-hover card-table">
										<tbody>	
											<tr>
												<th scope="col" style="text-align:right;">개요&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;KOSMO BANK 가입 고객을 위한 ${loanProduct.loan_product_name}</td>
											</tr>
											<tr>
												<th scope="col" style="text-align:right;">대출대상&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;KOSMO BANK 가입 고객</td>
											</tr>
											<tr>
												<th scope="col" style="text-align:right;">대출한도&emsp;&emsp;</th>
												<td style="text-align:left;" class="text-danger">
													&emsp;개인별 최대&nbsp;<fmt:formatNumber value="${loanProduct.loan_product_maxPrice}" pattern="#,###.##" />&nbsp;원
													&emsp;※ 최소 금액은 <fmt:formatNumber value="${loanProduct.loan_product_minPrice}" pattern="#,###.##" />&nbsp;원
												</td>
											</tr>
											<tr>
												<th scope="col" rowspan="2" style="text-align:right;">대출기간&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;만기일시상환 및 한도대출(마이너스통장 방식) : 최장 ${loanProduct.loan_product_maxDate}년까지 약정가능</td>
											</tr>
											<tr>
												<td style="text-align:left;">&emsp;원(리)금분할상환대출 : 최장 ${loanProduct.loan_product_maxDate}년까지 약정가능</td>
											</tr>
											<tr>
												<th scope="col" style="text-align:right;">기본금리&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;기준금리 : 기간별 고정금리, 연체이자율 적용 없음</td>
											</tr>
											<tr>
												<th scope="col" rowspan="2" style="text-align:right;">상환방법&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;만기일시상환, 통장식상환 : 대출만기일에 전액 상환</td>
											</tr>
											<tr>
												<td style="text-align:left;">&emsp;원(리)금 균등분할 상환 : 매달 원(리)금을 분할하여 상환</td>
											</tr>
											<tr>
												<th scope="col" style="text-align:right;">담보&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;.</td>
											</tr>
											<tr>
												<th scope="col" rowspan="2" style="text-align:right;">고객부담비용&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;【대출 신규취급시】인지세 : 대출약정시 납부세금(인지세법) <br>&emsp;※ 은행과 고객이 각각 50% 부담(대출금액별 상이)</td>
											</tr>
											<tr>
												<td style="text-align:left;">&emsp;【대출 상환시】중도상환해약금 : 대출 취급후 ${loanProduct.loan_product_minDate}년 이내 상환시 발생 <br>&emsp;※ 대출 취급후 ${loanProduct.loan_product_minDate}년 경과 또는 만기 1개월 이내 : 면제</td>
											</tr>
											<tr>
												<th scope="col" style="text-align:right;">이용시간&emsp;&emsp;</th>
												<td style="text-align:left;">&emsp;신청가능시간 : 24시간, 365일 가능</td>
											</tr>
										</tbody>
									</table>
									<div class="d-flex justify-content-center">
										<button class="btn btn-primary btn-round" onclick="window.location='newLoanSign.do?loan_product_name=${loanProduct.loan_product_name}'">대출 신청</button>
									</div>
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
</body>
</html>