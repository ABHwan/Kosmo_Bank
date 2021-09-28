<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 적금 상품 상세조회</title>
<!-- CSS -->
<%-- <link rel="stylesheet" href="${rePath}css/manager/depositProductInfo.css" /> --%>
<script src="${rePath}js/script.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />

		<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
				
				<section id="main">
     			 <div class="main__container">
        			<h1 class="main__title">적금상품 상세조회</h1>
			          	<table>
							<tr class="form__row">
								<th>적금상품이름</th>
								<td>
									${vo.saving_product_name}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금상품 한줄요약</th>
								<td>
									${vo.saving_product_summary}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금종류</th>
								<td>
								   <c:if test="${vo.saving_product_type==0}">
						           	복리
						           </c:if>
						           
						           <c:if test="${vo.saving_product_type!=0}">
						           	단리
						           </c:if>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>금리(%)</th>
								<td>
									${vo.saving_product_interRate}%
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소적금기간(6개월~)</th>
								<td>
									${vo.saving_product_minDate}개월
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최대적금기간(~36개월)</th>
								<td>
									${vo.saving_product_maxDate}개월
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예치금액</th>
								<td>
									<fmt:formatNumber value="${vo.saving_product_minPrice}" type="number"/>원
								</td>
							</tr>
							
							<tr class="form__row">
								<th>적금설명</th>
								<td>
									${vo.saving_product_explanation}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>유의사항</th>
								<td>
									${vo.saving_product_notice}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>은행코드</th>
								<td>
									<c:choose>
				           			<c:when test="${vo.saving_product_bankCode==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==5}">
				           				하나은행
				           			</c:when>
				           			<c:when test="${vo.saving_product_bankCode==6}">
				           				코스모은행
				           			</c:when>
				           		</c:choose>
								</td>
							</tr>
						</table>
						
						<div class="btnList">
							<button><a href="savingProductUpdate?saving_product_name=${vo.saving_product_name}&pageNum=${pageNum}">상품 수정</a></button>
							<button><a href="savingProductList?pageNum=${pageNum}">목록으로</a></button>
						</div>
			      </div>
			    </section>
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