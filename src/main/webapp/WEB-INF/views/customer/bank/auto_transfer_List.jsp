<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>코스모 뱅크</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">

</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
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
									효율적이고, 안전하게 도와드립니다. </br> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게
									통합하여 금융상품을 이용하실 수 있습니다.
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- 고정헤더 -->
				<div class="page-inner">

					<div class="row">

						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="card-title fw-mediumbold">자동이체 내역</div>
									<div class="card-list">
										<hr>

										<table class="table table-head-bg-primary mt-4">
											<thead>
												<tr class="table-danger">
													<th style="background-color: #ffffff" colspan="2">거래내역 조회</th>
												</tr>
											</thead>
											<tbody>
												<tr class="table-light">
													<td>출금계좌번호</td>
													<td colspan="2"><select class="input"
														name="transfer_account_num">
															<option value="111-111-111111(신한은행)">111-111-111111(신한은행)</option>
															<option value="222-2222-2222(국민은행)">222-2222-2222(국민은행)</option>
															<option value="33-33333-33333(농협)">33-33333-33333(농협)</option>
													</select>
												</tr>
											</tbody>
										</table>

											<div class="card-body">
									<div class="table-responsive">
										<table id="multi-filter-select" class="display table table-striped table-hover" >
											<thead>
												<tr>
													<th>이체기관명</th>
													<th>입금계좌번호</th>
													<th>이체금액</th>
													<th>이체 주기</th>
													<th>이체일</th>
													<th>선택</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>{받는사람계좌}</td>
													<td>{출금일자}</td>
													<td>{이체주기}</td>
													<td>{이체금액}</td>
													<td>{이체기관명}</td>
													<td>
														<div class="form-button-action">
															<button type="button" class="btn btn-link btn-primary btn-lg">
																<i class="fa fa-edit">
																수정
																</i>
															</button>
															
															<button type="button" class="btn btn-link btn-danger">
																<i class="fa fa-times">
																삭제
																</i>
															</button>
														</div>
													</td>
												</tr>
												
											</tbody>
										</table>
										
				<div class="col-sm-12 col-md-7">			
					<div class="dataTables_pageinate paging_simple_numbers" id="basic-datatables_paginate">
						<%-- <tr>
							<!-- 게시글이 있으면 -->
							<c:if test="${cnt > 0}">

								<!-- 처음[◀◀] / 이전블록[◀] -->
								<c:if test="${startPage > pageBlock}">
									<a href="#">[◀◀]</a>
									<a href="#">[◀]</a>
								</c:if>

								<!-- 블록내의 페이지번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>

									<c:if test="${i != currentPage}">
										<a href="#">[${i}]</a>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶▶] / 마지막[▶] -->
								<c:if test="${pageCount > endPage}">
									<a href="#">[▶]</a>
									<a href="#">[▶▶]</a>
								</c:if>

							</c:if>
						</tr> --%>
					</div>
				</div>
			
									</div>
								</div>
							</div>
						</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
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
	<%@ include file="/WEB-INF/views/include/chatbot.jsp"%>


</body>
</html>