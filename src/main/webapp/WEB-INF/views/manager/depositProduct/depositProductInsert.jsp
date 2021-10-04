<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 예금 상품 등록</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/insertProduct.css" />
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
			        <h1 class="title">예금상품등록</h1>
			        <form action="depositProductInsertAction" method="post" name="depositProductInsertForm" class="main__form" onsubmit="return depositProductInsertCheck();">
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          
			          	<table>
							<tr class="form__row">
								<th>예금상품이름</th>
								<td>
									<input class="input" type="text" name="deposit_product_name" >
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금상품 한줄요약</th>
								<td>
									<input class="input" type="text" name="deposit_product_summary">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>예금종류</th>
								<td>
									<select class="input" name="deposit_product_type">
										<option value="0">복리</option>
										<option value="1">단리</option>
									</select>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>금리(%)</th>
								<td>
									<input class="input" type="text" name="deposit_product_interRate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예금기간(1개월~)</th>
								<td>
									<input class="input" type="text" name="deposit_product_minDate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최대예금기간(~36개월)</th>
								<td>
									<input class="input" type="text" name="deposit_product_maxDate">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>최소예치금액</th>
								<td>
									<input class="input" type="text" name="deposit_product_minPrice">
								</td>
							</tr>
							
							<tr class="form__row textarea">
								<th>예금설명</th>
								<td>
									<textarea name="deposit_product_explanation" class="deposit_product_explanation"  placeholder="예금설명을 입력해주세요."></textarea>
								</td>
							</tr>
							
							<tr class="form__row textarea">
								<th>유의사항</th>
								<td>
									<textarea name="deposit_product_notice" class="deposit_product_explanation" placeholder="유의사항을 입력해주세요."></textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>은행코드</th>
								<td>
									<select class="input" name="deposit_product_bankCode">
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
	
	
</body>
</html>