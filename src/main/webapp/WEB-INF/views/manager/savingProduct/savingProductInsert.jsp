<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 적금 상품 등록</title>
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
				
				<main id="main">
			      <div class="container">
			        <h1 class="title">적금상품등록</h1>
			        <hr>
			        <form action="savingProductInsertAction" method="post" name="savingProductInsertForm" class="main__form" onsubmit="return savingProductInsertCheck();">
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          
			          	<table>
							<tr class="form__row">
								<th>적금상품이름</th>
								<td>
									<input class="input" type="text" name="saving_product_name" >
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금상품 한줄요약</th>
								<td>
									<input class="input" type="text" name="saving_product_summary">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금종류(과목)</th>
								<td>
									<select class="input" name="saving_product_type">
										<option value="0">복리</option>
										<option value="1">단리</option>
									</select>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>금리(%)</th>
								<td>
									<input class="input" type="text" name="saving_product_interRate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소적금기간(6개월~)</th>
								<td>
									<input class="input" type="text" name="saving_product_minDate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최대적금기간(~36개월)</th>
								<td>
									<input class="input" type="text" name="saving_product_maxDate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예치금액</th>
								<td>
									<input class="input" type="text" name="saving_product_minPrice">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금설명</th>
								<td>
									<textarea name="saving_product_explanation" placeholder="적금설명을 입력해주세요."></textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>유의사항</th>
								<td>
									<textarea name="saving_product_notice" placeholder="유의사항을 입력해주세요."></textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>은행코드</th>
								<td>
									<select class="input" name="saving_product_bankCode">
										<option value="0">미기재</option>
										<option value="1">국민은행</option>
										<option value="2">우리은행</option>
										<option value="3">농협은행</option>
										<option value="4">신한은행</option>
										<option value="5">하나은행</option>
										<option value="6">코스모은행</option>
									</select>
								</td>
							</tr>
							
							<tr class="form__row submit">
								<th colspan="2">
									<input class="submit" type="submit" value="상품등록">
									<input class="submit" type="reset" value="초기화">
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