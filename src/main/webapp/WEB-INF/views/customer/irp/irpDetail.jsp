<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연금 상세 보기</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
<script>
	var msg = "<%=request.getAttribute("msg") %>";
	if(msg != 'null'){
		 alert(msg);
	}
</script>
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
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. </br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<section id="main">
			      <div class="main__container" style="width: 95%;">
					<h2 class="title">연금상품 상세</h2>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">${dto.irp_product_name}</div>
								</div>
								<div class="card-body">
									 <form action="irpProductJoin" name="irpProductForm" method="post">
									 	<sec:csrfInput/>
								         <input type="hidden" name="pageNum" value="${pageNum}">
								         <input type="hidden" name="number" value="${number}">
						         <input type="hidden" name="irp_product_summary" value="${dto.irp_product_summary}">
						        <table class="table table-bordered">
						          <tr>
						            <th>상품명</th>
						             <td>${dto.irp_product_name} 
						             <input type="hidden" name="irp_product_name" class="user_check" value="${dto.irp_product_name}">
						             </td>
						          </tr>
						          <tr>
						            <th>상품 설명</th>
						            <td>${dto.irp_product_explanation}
						            <input type="hidden" name="irp_product_explanation" class="user_check" value="${dto.irp_product_explanation}">
						            </td>
						          </tr>
						          <tr>
						            <th>금리</th>
						              <td>${dto.irp_product_interRate}%
						              <input type="hidden" name="irp_product_interRate" class="user_check" value="${dto.irp_product_interRate}">
						              </td>
						          </tr>
						          
						           <tr>
						           		<th>연금 금액</th>
						           		<td><fmt:formatNumber value="${dto.irp_product_money}" type="number"/>
						           		<input type="hidden" name="irp_product_money" value="${dto.irp_product_money}">원
						           </tr>		
						           
						            <tr>
						           		<th>연금 납입(가입) 기간</th>
						           		<td>${dto.irp_product_expiryTerm}개월
						           		<input type="hidden" name="irp_product_expiryTerm" class="user_check" value="${dto.irp_product_expiryTerm}">
						           		</td>
						           </tr>
						           
						      	   <tr>
						                <th>유의사항</th>
						                <td>${dto.irp_product_notice}
						                <input type="hidden" name="irp_product_notice" class="user_check" value="${dto.irp_product_notice}">
						                </td>
						           </tr>
						      		
						      		<tr>
						      			<th>은행코드</th>
						      			<td>
							           		<c:choose>
							           			<c:when test="${dto.irp_product_bankCode==0}">
							           				미기재
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==1}">
							           				국민은행
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==2}">
							           				우리은행
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==3}">
							           				농협은행
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==4}">
							           				신한은행
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==5}">
							           				하나은행
							           			</c:when>
							           			<c:when test="${dto.irp_product_bankCode==6}">
							           				코스모은행
							           			</c:when>
							           		</c:choose>
							           		<input type="hidden" name="irp_product_bankCode" class="user_check" value="${dto.irp_product_bankCode}">
							           </td>
						      		</tr>
						      		
						      		<tr>
						      			 <th>등록일</th>
						      			 <td><fmt:formatDate value="${dto.irp_product_date}" pattern="YYYY-MM-dd"/>
						      			 <input type="hidden" name="irp_product_date" class="user_check" value="${dto.irp_product_date}">
						      			 </td>
						      		</tr>
						        </table>
						        <div align ="right">
						          	<input type="submit" class="btn btn-primary" value="연금상품 신청하러 가기" >
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>