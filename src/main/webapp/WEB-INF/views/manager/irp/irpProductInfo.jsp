<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 연금 상품 상세조회</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
<script src="${rePath}js/script.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />

		<!-- 메인 콘텐츠 -->
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
				
				<section id="main">
     			 <div class="main__container">
        			<h2 class="title">연금상품 상세조회</h2>
        				<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">${vo.irp_product_name}</div>
								</div>
								<div class="card-body">
			          	<table class="admin__table">
							<tr>
								<th class="table__head">연금상품이름</th>
								<td>
									${vo.irp_product_name}
								</td>
							</tr>
							
							<tr>
								<th class="table__head">연금상품 한줄요약</th>
								<td>
									${vo.irp_product_summary}
								</td>
							</tr>
							<tr>
								<th class="table__head">금리(%)</th>
								<td>
									${vo.irp_product_interRate}%
								</td>
							</tr>
							
							<tr>
								<th class="table__head">연금 금액</th>
									 <td><fmt:formatNumber value="${vo.irp_product_money}" type="number"/>원</td>
							</tr>
							
							<tr>
								<th class="table__head">연금 납입(가입) 기간</th>
								<td>
									${vo.irp_product_expiryTerm}개월
								</td>
							</tr>
							
							<tr>
								<th class="table__head">연금 설명</th>
								<td>
									${vo.irp_product_explanation}
								</td>
							</tr>
							
							<tr>
								<th class="table__head">유의사항</th>
								<td>
									${vo.irp_product_notice}
								</td>
							</tr>
							
							<tr>
								<th class="table__head">은행코드</th>
								<td>
									<c:choose>
				           			<c:when test="${vo.irp_product_bankCode==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==5}">
				           				하나은행
				           			</c:when>
				           			<c:when test="${vo.irp_product_bankCode==6}">
				           				코스모은행
				           			</c:when>
				           		</c:choose>
								</td>
							</tr>
						</table>
						
						<div align="right">
							<button class="btn btn-primary btn-border" onclick="window.location='irpProductUpdate?irp_product_name=${vo.irp_product_name}&pageNum=${pageNum}'">상품 수정하기</button>
							<button class="btn btn-primary btn-border" onclick="window.location='IrpProductList?pageNum=${pageNum}'">목록으로</button>
						</div>
			      </div>
			      </div>
			      </div>
			      </div>
			      </div>
			    </section>
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