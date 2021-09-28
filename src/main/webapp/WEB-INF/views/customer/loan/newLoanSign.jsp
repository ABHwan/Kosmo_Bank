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
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<!-- 고정헤더 -->
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
				<!-- 고정헤더 -->
				<div class="page-inner">
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">신규 대출 신청</div>
								</div>
								<div class="card-body">
									<form action="newLoanSignAction.do" name="newLoanSignform" method="post">
					 					<sec:csrfInput />
										<table class="table table-hover card-table">
										<!--  -->
										
										
											<tr>
												<th><label for="loan_product_name">대출 상품명</label></th>
												<td><input type="text" id="loan_product_name" name="loan_product_name" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="member_id">아이디</label></th>
												<td><input type="text" id="member_id" name="member_id" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="">이름</label></th>
												<td><input type="text" id="" name="" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="account_id">계좌번호</label></th>
												<td>
													<select class="form-control form-control" name="account_id">
														<option value="0"><input ty]></option>
														<option value="1">db에서 꺼내올 것</option>
														<option value="2">원리금균등상환</option>
														<option value="3">만기일시상환</option>
													</select>
													<!-- <input type="text" id="account_id" name="account_id" class="form-control input-border-bottom" readonly> -->
												</td>
											</tr>
											<tr>
												<th><label for="loan_month">대출기간</label></th>
												<td><input type="text" id="loan_month" name="loan_month" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_startDate">대출실행일</label></th>
												<td><input type="text" id="loan_startDate" name="loan_startDate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_endDate">대출만기일</label></th>
												<td><input type="text" id="loan_endDate" name="loan_endDate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_repaymentType">상환방법</label></th>
												<td>
													<select class="form-control form-control" name="loan_repaymentType">
														<option value="1">원금균등상환</option>
														<option value="2">원리금균등상환</option>
														<option value="3">만기일시상환</option>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="loan_amount">대출원금</label></th>
												<td><input type="text" id="loan_amount" name="loan_amount" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_rate">대출금리</label></th>
												<td><input type="text" id="loan_rate" name="loan_rate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_monthlyRepayment">익월 상환액</label></th>
												<td><input type="text" id="loan_monthlyRepayment" name="loan_monthlyRepayment" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_tranAmount">익월 납입원금</label></th>
												<td><input type="text" id="loan_tranAmount" name="loan_tranAmount" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_tranInterest">익월 납입이자</label></th>
												<td><input type="text" id="loan_tranInterest" name="loan_tranInterest" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_interest">총 이자</label></th>
												<td><input type="text" id="loan_interest" name="loan_interest" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_prepaymentRate">중도상환수수료요율</label></th>
												<td><input type="text" id="loan_prepaymentRate" name="loan_prepaymentRate" class="form-control input-border-bottom" readonly></td>
											</tr>
											
										<!--  -->
											
										</table>
										<div align="center"><br>
											<!-- <button class="btn btn-success">
												<span class="btn-label">
													<i class="fa fa-check"></i>
												</span>
												약관 동의 완료
											</button> -->
											<button type="button" id="termsBtn" onclick="openTerms();" class="btn btn-warning">
												<span class="btn-label">
													<i id="termsI" class="fa fa-exclamation-circle"></i>
												</span>
												약관 동의하기
											</button>
										</div>
										<div align="center"><br><br>
											<input type="submit" class="btn btn-primary" value="완료">&emsp;
											<input type="reset"	class="btn btn-primary" value="초기화">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>	
					</div>	
				</div>
			</div>
		</div>
		 
	<jsp:include page="/WEB-INF/views/include/footerB.jsp" /> 
 
 	<script type="text/javascript">
 		function openTerms() {
 			var popupX = (window.screen.width / 2) - (800 / 2); // 윈도우 픽셀 기준 X축 중간
 			var popupY = (window.screen.height / 2) - (1000 / 2); // 윈도우 픽셀 기준 Y축 중간
 			var url = "http://localhost:8092/bank/customer/terms.do";
 			window.open(url, "about:blank", "width=800, height=1000, left="+popupX + ",top="+popupY);
 			var btn = document.querySelector("#termsBtn");
 			btn.classList.remove('btn-warning');  // 대상 요소의 클래스 목록에서 클래스 btn-warning 제외
 			btn.classList.add('btn-success');  // 대상 요소의 클래스 목록에 클래스 btn-success 추가
 			btn.innerHTML = '<span class="btn-label"><i id="termsI" class="fa fa-check"></i></span>약관 동의 완료';
 			//btn.textContent
 		}
 	</script>
 
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