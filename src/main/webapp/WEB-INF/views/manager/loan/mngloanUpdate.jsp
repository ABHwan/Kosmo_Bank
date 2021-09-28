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
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">대출상품 관리</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">대출상품 등록</div>
								</div>
								<div class="card-body">
									<form action="loanUpdateAction" name="loanInsertform" method="post">
					 					<sec:csrfInput />
										<input type="hidden" name="hiddenId" value="0">
										<table class="table table-hover card-table">
											<tr>
												<th><label for="loan_product_name">대출 상품명</label></th>
												<td><input type="text" id="loan_product_name" name="loan_product_name" class="form-control input-border-bottom" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_rate">대출 금리(%)</label></th>
												<td><input type="text" id="loan_product_rate" name="loan_product_rate" class="form-control input-border-bottom" placeholder="예) 5.0" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_minPrice">최소 대출 금액(만 원)</label></th>
												<td><input type="text" id="loan_product_minPrice" name="loan_product_minPrice" class="form-control input-border-bottom" placeholder="예) 500" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_maxPrice">최대 대출 금액(만 원)</label></th>
												<td><input type="text" id="loan_product_maxPrice" name="loan_product_maxPrice" class="form-control input-border-bottom" placeholder="예) 500000" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_minDate">최소 대출 기간(년)</label></th>
												<td><input type="text" id="loan_product_minDate" name="loan_product_minDate" class="form-control input-border-bottom" placeholder="예) 1" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_maxDate">최대 대출 기간(년)</label></th>
												<td><input type="text" id="loan_product_maxDate" name="loan_product_maxDate" class="form-control input-border-bottom" placeholder="예) 10" autofocus></td>
											</tr>
											<tr>
												<th><label for="loan_product_bankCode">은행</label></th>
												<td><select class="form-control form-control" name="loan_product_bankCode">
														<option value="1">우리</option>
														<option>국민</option>
														<option>농협</option>
														<option>하나</option>
														<option>기업</option>
														<option>신한</option>
												</select></td>
											</tr>
											<tr>
												<th><label for="loan_product_summary">대출 상품 설명</label></th>
												<td><textarea id="loan_product_summary" name="loan_product_summary" class="form-control input-border-bottom" placeholder="상세 설명 (2000자 제한)" autofocus></textarea></td>
											</tr>
										</table>
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