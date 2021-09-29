<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀드 상품 상세조회</title>
<!-- CSS -->
<%-- <link rel="stylesheet" href="${rePath}css/manager/depositProductInfo.css" /> --%>
<script src="${rePath}js/script.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />

		<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
				
				<section id="main">
     			 <div class="main__container">
        			<h1 class="main__title">펀드상품 상세조회</h1>
			          	<table>
							<tr class="form__row">
								<th>펀드상품 한줄요약</th>
								<td>
									${vo.fund_summary}
								</td>
							</tr>
							
							<tr class="form__row">
								<td><img src="${vo.fund_filename}"></td>
							</tr>
							
							<tr class="form__row">
								<th>펀딩 기간</th>
								<td>${vo.fund_start_date} ~ ${vo.fund_end_date}</td>
							</tr>
							
							<tr class="form__row">
								<th>달성도</th>
								<td></td>
							</tr>
							
							<tr class="form__row">
								<th>목표 금액</th>
								<td>${vo.fund_goal_money}</td>
							</tr>
							
							<tr>
								<th>입금 계좌</th>
								<td>
									<c:choose>
				           			<c:when test="${vo.fund_bank_code==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==5}">
				           				하나은행
				           			</c:when>
				           			<c:when test="${vo.fund_bank_code==6}">
				           				코스모은행
				           			</c:when>
				           			</c:choose>
								</td>
								<td>${vo.fund_account}</td>
							</tr>
							
							<tr class="form__row">
								<td>${vo.fund_content}</td>
							</tr>
							
							<tr class="form__row">
								<th>등록자 이름</th>
								<td>
									${vo.fund_mem_name}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>등록자 연락처</th>
								<td>
									${vo.fund_mem_hp}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>등록자 이메일</th>
								<td>${vo.fund_mem_email}</td>
							</tr>
						</table>
						
						<div class="btnList">
							<button onclick="window.location=fundProductUpdate?fund_title=${vo.fund_title}&pageNum=${pageNum}">상품 수정</button>
							<button onclick="window.location=fundProductList?pageNum=${pageNum}">목록으로</button>
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