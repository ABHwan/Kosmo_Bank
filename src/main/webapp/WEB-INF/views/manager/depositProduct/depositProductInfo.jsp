<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 예금 상품 상세조회</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/depositProductInfo.css" />
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
        			<h1 class="main__title">예금상품 상세조회</h1>
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
									${vo.deposit_product_summary}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금종류</th>
								<td>
								   <c:if test="${vo.deposit_product_type==0}">
						           	복리
						           </c:if>
						           
						           <c:if test="${vo.deposit_product_type!=0}">
						           	단리
						           </c:if>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>금리(%)</th>
								<td>
									${vo.deposit_product_interRate}%
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예금기간(1개월~)</th>
								<td>
									${vo.deposit_product_minDate}개월
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최대예금기간(~36개월)</th>
								<td>
									${vo.deposit_product_maxDate}개월
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예치금액</th>
								<td>
									<fmt:formatNumber value="${vo.deposit_product_minPrice}" type="number"/>원
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금설명</th>
								<td>
									${vo.deposit_product_explanation}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>유의사항</th>
								<td>
									${vo.deposit_product_notice}
								</td>
							</tr>
							
							<tr class="form__row">
								<th>은행코드</th>
								<td>
									<c:choose>
				           			<c:when test="${vo.deposit_product_bankCode==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==5}">
				           				하나은행
				           			</c:when>
				           			<c:when test="${vo.deposit_product_bankCode==6}">
				           				코스모은행
				           			</c:when>
				           		</c:choose>
								</td>
							</tr>
						</table>
						
						<div class="btnList">
							<button class="btn btn-primary" onclick="window.location='depositProductUpdate?deposit_product_name=${vo.deposit_product_name}'">상품 수정</button>
							<button class="btn btn-primary btn-border" onclick="window.location='depositProductList'">목록으로</button>
						</div>
			      </div>
			    </section>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
</body>
</html>