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
				<div class="page-inner">
					<h4 class="page-title">대출 상품 목록</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">대출 상품 조회</div>
								</div>
								<div class="card-body">
									<sec:csrfInput/>
									<table class="table table-hover card-table">
										<thead>
											<tr>
												<th scope="col">상품명</th>
												<th scope="col">금리</th>
												<th scope="col">최소 대출금액</th>
												<th scope="col">최대 대출금액</th>
												<th scope="col">최소 대출기간</th>
												<th scope="col">최대 대출기간</th>
												<th scope="col">은행</th> 
												<th scope="col">상품 등록일</th>   
												<!-- <th scope="col">설명</th>  -->
												<th scope="col"></th>  
											</tr>
										</thead>
										<tbody> 
											<!--
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td>.</td>
												<td><button class="btn btn-primary btn-xs" onclick="window.location='newLoanDetail.do'">상세</button></td>
												 -->
											<c:forEach var="p" items="${loanProducts}">
												<tr>
												<%-- <td>
													<input type="checkbox" id="" value="${p.loan_product_name}">
												</td> --%>
												<td>${p.loan_product_name}</td>
												<td>${p.loan_product_rate}&nbsp;%</td>
												<td>${p.loan_product_min_price}&nbsp;만 원</td>
												<td>${p.loan_product_max_price}&nbsp;만 원</td>
												<td>${p.loan_product_min_date}&nbsp;년</td>
												<td>${p.loan_product_max_date}&nbsp;년</td>
												<td>${p.loan_product_bankCode}</td>
												<td><fmt:formatDate value="${p.loan_product_base_date}" pattern="yyyy-MM-dd"/></td>
												<%-- <td>
													<details>
														<summary></summary>
														${p.loan_product_summary} 
													</details> 
												</td> --%>
												<td><button class="btn btn-primary btn-xs" onclick="window.location='newLoanSign.do'">대출신청</button></td>
												</tr>
												</c:forEach> 
														
										</tbody>
									</table>
									<ul class="pagination pg-primary mt-5" style="">
										<li class="page-item">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true">«</span>
												<span class="sr-only">Previous</span>
											</a>
										</li>
										<li class="page-item active">
											<a class="page-link" href="#">1</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#" aria-label="Next">
												<span aria-hidden="true">»</span>
												<span class="sr-only">Next</span>
											</a>
										</li>
									</ul>
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