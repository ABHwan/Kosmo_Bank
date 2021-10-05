<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 예금 신청 상세</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
</head>
<body>
<!-- <div class="wrapper">
		<div class="main-header"> -->
		
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
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
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br/>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
			
				<section id="main">
			      <div class="main__container"  style="width: 95%;">
					<h2 class="title">예금 가입 정보 입력 </h2>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">${dto.deposit_product_name}</div>
								</div>
								<div class="card-body">
									 <form action="depositProductAction" method="post" name="depositProductForm" onsubmit="return joinInCheck()">
								         <input type="hidden" name="pageNum" value="${pageNum}">
								         <input type="hidden" name="number" value="${number}">
								         <input type="hidden" name ="unique_key" value="${unique_key}">
										 <sec:csrfInput />
						        <table class="table table-bordered">
						          <tr>
						          	<th>신청자</th>
						          	<td>${sessionScope.customerID}</td>
						          </tr>
						        
						          <tr>
						            <th>상품명</th>
						             <td>${dto.deposit_product_name} 
						             <input type="hidden" name="deposit_product_name" class="user_check" value="${dto.deposit_product_name}">
						             </td>
						          </tr>
						          <tr>
						            <th>상품 요약</th>
						            <td>${dto.deposit_product_summary}</td>
						          </tr>
						          <tr>
						            <th>금리</th>
						              <td>${dto.deposit_product_interRate}%
						               <input type="hidden" name="deposit_product_interRate" class="user_check" value="${dto.deposit_product_interRate}">
						              </td>
						          </tr>
						          <tr>
						          	 <th>종류</th>
						          	 <td>
						          	 <c:if test="${dto.deposit_product_type==1}">
								           	복리
								           </c:if>
								           
								           <c:if test="${dto.deposit_product_type!=1}">
								           	단리
								           </c:if>
								           <input type="hidden" value="${dto.deposit_product_type}" name ="deposit_product_type">
						          	 </td>
						           </tr>
						           <tr>
							           <th>예치 기간 </th>
							           <td>
											<!-- //<input type="date" id="currentMonth" name="endDate"> -->
						           		<!-- <script>
						           			document.getElementById('currentMonth').value= new Date().toISOString().substring(0,10);
						           		</script> -->				
						           		<select class="form-control form-control" id="term" style="width:30%;" name="deposit_term" onchange="setEndDate();">
												<option value="">선택해주세요</option>
											<c:forEach var="i" begin="12" step="6" end="120">
												<option value="${i}">${i}&nbsp;개월&nbsp;&nbsp;(${i/12}&nbsp;년)</option>
											</c:forEach>
										</select>
							           </td>
						           </tr>
						           
						           <tr>
						           		<th>예치금</th>
						           		<td>
						           		<input type="number" name="account_balance" id="account_balance" step="10" min="${dto.deposit_product_minPrice}">원
						           		<br><font size="2em" color="red">*<fmt:formatNumber value="${dto.deposit_product_minPrice}" type="number"/>원 이상</font></td>
						           		<!-- deposit_balance -->
						           </tr>
						      		
						      		<tr>
						      			<th>은행코드</th>
						      			<td>
							           		<c:choose> 
							           			<c:when test="${dto.deposit_product_bankCode==0}">
							           				미기재
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==1}">
							           				국민은행
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==2}">
							           				우리은행
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==3}">
							           				농협은행
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==4}">
							           				신한은행
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==5}">
							           				하나은행
							           			</c:when>
							           			<c:when test="${dto.deposit_product_bankCode==6}">
							           				코스모 은행
							           			</c:when>
							           		</c:choose>
							           		<input type="hidden" value="${dto.deposit_product_bankCode}" name ="account_bankCode">
							           </td>
						      		</tr>
						      		<tr>
						      			<th>계좌번호 확인</th>
						      			<td>${account_id}
						      				<input type="hidden" value="${account_id}" name ="account_id">
						      			</td>
						      		</tr>
						      		
						      		<tr>
										<th>계좌 비밀번호 <small>*4자리 숫자로 입력</small></th>
										<td><input type="password" id="account_password" name="account_password" maxlength="4"
											placeholder="비밀번호 입력">
										</td>
									</tr>
					
									<tr>
										<th>계좌 비밀번호 확인</th>
										<td><input type="password" id="REaccount_password" name="REaccount_password" maxlength="4"
											placeholder="비밀번호 확인">
										</td>
									</tr>
									<tr>
						      			 <th>유의사항 </th>
						      			 <td>${dto.deposit_product_notice}
						      			 	</td>
						      		</tr>
						      		
						        </table>
						        <div align ="center">
						          	<input type="submit" class="btn btn-primary" value="가입 ">
						       		<input type="button" class="btn btn-primary btn-border" onclick="window.history.back()" value="돌아가기">
						        </div>
						        
			        </form>
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>
	<script src="${rePath}js/deposit.js"></script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>