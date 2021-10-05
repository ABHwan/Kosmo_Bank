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
<title>관리자 페이지 - 연금 상품 수정</title>
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
				
				<main id="main"  align="center">
			      <div class="main__container" style="width: 95%;">
			        <h1 class="title"></h1>
			        <div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">
									<strong>${vo.irp_product_name}</strong></div>
								</div>
								<div class="card-body">
			        <form action="irpProductUpdateAction" method="post" name="irpProductUpdateForm" class="main__form" onsubmit="return irpProductInsertCheck()">
			        <sec:csrfInput/>
			          <input type="hidden" name="pageNum" value="${pageNum}">
			          <input type="hidden" name="irp_product_name" value="${vo.irp_product_name}">
			          	<table class="table table-bordered">
							<tr>
								<th>연금상품이름</th>
								<td>
								<input class="form-control form-control-sm" type="text" style="width: 50%;"  name="irp_product_name" value="${vo.irp_product_name}">
								</td>
							</tr>
							
							<tr>
								<th>연금상품 한줄요약</th>
								<td>
									<input class="form-control form-control-sm" type="text" style="width: 50%;"  name="irp_product_summary" value="${vo.irp_product_summary}">
								</td>
							</tr>
							
							<tr>
								<th>금리(%)</th>
								<td>
									<input class="form-control form-control-sm" type="text" style="width: 50%;" name="irp_product_interRate" value="${vo.irp_product_interRate}">
								</td>
							</tr>
							
							<tr>
								<th>연금 납입(가입) 기간</th>
								<td>
									<input class="form-control form-control-sm" type="text" style="width: 50%;" name="irp_product_expiryTerm" value="${vo.irp_product_expiryTerm}">
								</td>
							</tr>
							
							<tr>
								<th>연금설명</th>
								<td>
									<textarea class="form-control" name="irp_product_explanation">${vo.irp_product_explanation}</textarea>
								</td>
							</tr>
							
							<tr>
								<th>연금 금액</th>
								<td>
									<input class="form-control form-control-sm" type="number" min="100000" name="irp_product_money" value="${vo.irp_product_money}"> 원
								</td>
							</tr>
							
							<tr>
								<th>유의사항</th>
								<td>
									<textarea  class="form-control" name="irp_product_notice">${vo.irp_product_notice}</textarea>
								</td>
							</tr>
							
							<tr>
								<th>은행코드</th>
								<td>
									<select  class="form-control form-control-sm" style="width: 50%;" name="irp_product_bankCode">
										<c:choose>
											<c:when test="${vo.irp_product_bankCode==0}">
												<option value="0" selected>미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==1}">
												<option value="0" >미기재</option>
												<option value="1" selected>국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==2}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2" selected>우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==3}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3" selected>농협은행</option>
												<option value="4">신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==4}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4" selected>신한은행</option>
												<option value="5">하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==5}">
												<option value="0">미기재</option>
												<option value="1">국민은행</option>
												<option value="2">우리은행</option>
												<option value="3">농협은행</option>
												<option value="4">신한은행</option>
												<option value="5" selected>하나은행</option>
												<option value="6">코스모은행</option>
											</c:when>
											
											<c:when test="${vo.irp_product_bankCode==6}">
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
							 </table>
							 
							<div align="center">
									<input class="btn btn-primary" type="submit" value="상품수정">
									<input class="btn btn-primary btn-border" type="reset" value="초기화">
								</div>
					  
			        </form>
			      </div>
			      </div>
			      </div>
			      </div>
			      </div>
			    </main>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>