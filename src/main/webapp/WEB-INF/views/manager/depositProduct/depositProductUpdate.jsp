<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/insertProduct.css" />
<title>관리자 페이지 - 예금 상품 수정</title>
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
				
				<main id="main">
			      <div class="container">
			        <h1 class="title">예금상품 수정</h1>
			        <form action="depositProductUpdateAction" method="post" name="depositProductUpdateForm" class="main__form">
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          <input type="hidden" name="pageNum" value="${pageNum}">
			          <input type="hidden" name="deposit_product_name" value="${vo.deposit_product_name}">
			          	<table>
							<tr class="form__row">
								<th>예금상품이름</th>
								<td>
									${vo.deposit_product_name}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금상품 한줄요약</th>
								<td>
									<input class="input" type="text" name="deposit_product_summary" value="${vo.deposit_product_summary}">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금종류</th>
								<td>
									<select class="input" name="deposit_product_type">
										<c:if test="${vo.deposit_product_type==0}">
											<option value="0" selected>복리</option>
											<option value="1">단리</option>
										</c:if>
										<c:if test="${vo.deposit_product_type==1}">
											<option value="0">복리</option>
											<option value="1" selected>단리</option>
										</c:if>
									</select>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>금리(%)</th>
								<td>
									<input class="input" type="text" name="deposit_product_interRate" value="${vo.deposit_product_interRate}">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예금기간(1개월~)</th>
								<td>
									<input class="input" type="text" name="deposit_product_minDate" value="${vo.deposit_product_minDate}">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최대예금기간(~36개월)</th>
								<td>
									<input class="input" type="text" name="deposit_product_maxDate" value="${vo.deposit_product_maxDate}">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예치금액</th>
								<td>
									<input class="input" type="text" name="deposit_product_minPrice" value="${vo.deposit_product_minPrice}">
								</td>
							</tr>
		                     
							<tr class="form__row">
								<th>예금설명</th>
								<td>
									<textarea type="text" name="deposit_product_explanation">${vo.deposit_product_explanation}</textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>유의사항</th>
								<td>
									<textarea type="text" name="deposit_product_notice">${vo.deposit_product_notice}</textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>은행코드</th>
								<td>
									<select class="input" name="deposit_product_bankCode">
										<c:choose>
											<c:when test="${vo.deposit_product_bankCode==0}">
												<option value="0" selected>미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==1}">
												<option value="0" >미기재</option>
												<option value="1" selected>국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==2}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2" selected>우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==3}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3" selected>농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==4}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4" selected>신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==5}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5" selected>하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.deposit_product_bankCode==6}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6" selected>코스모은행</option>
											</c:when>
										</c:choose>
									</select>
								</td>
							</tr>
							
							<tr class="form__row submit">
								<th colspan="2">
									<input class="submit" type="submit" value="상품수정">
									<input class="submit" type="reset" value="초기화">
									<input class="submit" type="button" value="수정취소" onclick="window.history.back()">
								</th>
							</tr>
					   </table>
			        </form>
			      </div>
			    </main>
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