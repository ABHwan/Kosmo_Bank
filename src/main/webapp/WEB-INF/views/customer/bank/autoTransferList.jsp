<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>코스모 뱅크</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">
<script type="text/javascript">
function submitResult() {
	 if (confirm("해당 자동이체를 해지 하시겠습니까??") == true){    //확인
	     return true;
	 } else{   //취소
	     return false;
	 }
}
</script>
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
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br />
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				
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
													<th style="background-color: #ffffff" colspan="2">자동이체 내역 조회</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>

											<div class="card-body">
									<div class="table-responsive">
										<table id="multi-filter-select" class="display table table-striped table-hover" >
											<thead>
												<tr>
													<th>이체기관</th>
													<th>출금계좌</th>
													<th>입금계좌</th>
													<th>금액</th>
													<th>주기</th>
													<th>시작일</th>
													<th>종료일</th>
													<th>종류</th>
													<th>상태</th>
													<th>최근납부</th>
													<th>해지일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="dto" items="${dtos}">
													<tr>
														<td>${dto.auto_inPlace}</td>
														<td>${dto.account_id}</td>
														<td>${dto.auto_senderAccount}</td>
														<td><fmt:formatNumber value="${dto.auto_money}" type="number"/>원</td>
														<td>
															<c:choose>
																<c:when test="${dto.auto_outDate==1}">
																	매달 1일
																</c:when>
																<c:when test="${dto.auto_outDate==4}">
																	매달 4일
																</c:when>
																<c:when test="${dto.auto_outDate==5}">
																	매달 5일
																</c:when>
																<c:when test="${dto.auto_outDate==10}">
																	매달 10일
																</c:when>
																<c:when test="${dto.auto_outDate==15}">
																	매달 15일
																</c:when>
																<c:when test="${dto.auto_outDate==20}">
																	매달 20일
																</c:when>
																<c:when test="${dto.auto_outDate==25}">
																	매달 25일
																</c:when>
															</c:choose>
														</td>
														<td><fmt:formatDate value="${dto.auto_registDate}" pattern="yyyy-MM-dd"/></td>
														<td><fmt:formatDate value="${dto.auto_expirationDate}" pattern="yyyy-MM-dd"/></td>
														<td>
															<c:choose>
																<c:when test="${dto.auto_type==1}">
																	예금
																</c:when>
																<c:when test="${dto.auto_type==2}">
																	적금
																</c:when>
																<c:when test="${dto.auto_type==3}">
																	대출
																</c:when>
																<c:when test="${dto.auto_type==4}">
																	연금
																</c:when>
																<c:when test="${dto.auto_type==5}">
																	공과금
																</c:when>
																<c:when test="${dto.auto_type==6}">
																	기타
																</c:when>
															</c:choose>
														</td>
														<td>
															<c:choose>
																<c:when test="${dto.auto_status == 0}">
																	정상
																</c:when>
																<c:when test="${dto.auto_status == 1}">
																	해지
																</c:when>
																<c:when test="${dto.auto_status == 2}">
																	만료
																</c:when>
															</c:choose>
														</td>
														<td><fmt:formatDate value="${dto.auto_lastDay}" pattern="yyyy-MM-dd"/></td>
														<td>
															<c:if test="${dto.auto_status==0}">
																<div class="form-button-action">
																	<form action="autoTransferDelete" method="post" name="removeForm" onsubmit="return submitResult();">
																		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																		<input type="hidden" name="auto_id" value="${dto.auto_id}">
																		<button class="btn btn-link btn-danger">
																			<i class="fa fa-times">
																			해지
																			</i>
																		</button>
																	</form>
																</div>
															</c:if>
															<c:if test="${dto.auto_status==1}">
																<fmt:formatDate value="${dto.auto_cancle}" pattern="yyyy-MM-dd"/>
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										
									<div class="col-sm-12 col-md-7">			
										<div class="dataTables_pageinate paging_simple_numbers" id="basic-datatables_paginate">
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