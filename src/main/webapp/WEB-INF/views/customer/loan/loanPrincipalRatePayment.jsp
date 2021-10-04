<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모 뱅크</title>
<style type="text/css">
	label.text{
    transform: translateY(-90%);
	}
	
	table th.thCss{
		text-align: left !important;
		padding-left: 90px !important;
		width: 50% !important;
	}
</style>
</head>
<body>	
	<div class="wrapper">
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
				<!-- 고정헤더 -->
				<div class="page-inner">
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">[<c:choose>
							<c:when test="${loanProduct.loan_product_bankCode == 0}">
								미기재
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 1}">
								국민
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 2}">
								우리
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 3}">
								농협
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 4}">
								신한
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 5}">
								하나
							</c:when>
							<c:when test="${loanProduct.loan_product_bankCode == 6}">
								코스모
							</c:when>
						</c:choose>]&nbsp;${loanProduct.loan_product_name}&emsp;:&emsp;${cnt + 1}회차 납부</div>
								</div>
								<div class="card-body">
									<form action="newLoanSignAction.do" name="newLoanSignform" method="post">
					 					<sec:csrfInput />
										<table class="table table-hover card-table" >
										<!--  -->
										
										
											<tr>
												<th class="thCss"><label for="loan_product_name">대출 상품명</label></th>
												<td><input type="text" value="${loan.loan_product_name}" id="loan_product_name" name="loan_product_name" class="form-control " readonly style="border:none; background-color:transparent !important; height: 40px !important; width: 50%; float: left;" ></td>
											</tr>
											<tr>
												<th class="thCss"><label for="account_id">계좌번호</label></th>
												<td style="display:flex;">
													<%-- <select class="form-control form-control" style="width:30%;" name="account_id_select" onchange="setAccount();">
														<option value="0">계좌생성</option>
														<c:forEach var="j" items="${loanAccount}">
															<option value="${j.account_id}">${j.account_id}</option>
														</c:forEach>
													</select> --%>
													<input type="text" id="account_id"  value="${loan.account_id}"  name="account_id" class="form-control" readonly style="border:none; background-color:transparent !important; height: 40px !important; width: 50%; float: left; align-self: center;">
												</td>
											</tr>
											<tr>
												<td colspan="2" class="thCss"><label for="loan_tranAmount" style="width:20%">${cnt + 1}차 납입원금</label>&emsp;&emsp;+&emsp;&emsp;<label for="loan_tranInterest" style="width:20%">${cnt + 1}차 납입이자</label>&emsp;&emsp;=&emsp;&emsp;<label for="loan_monthlyRepayment" style="width:20%">${cnt + 1}차 상환액</label></td>
											</tr>
											<tr>
												<td colspan="2">
													<label style="width: 18%;"><%-- <fmt:formatNumber id="loan_tranAmount_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_tranAmount" name="loan_tranAmount" value="${loan.loan_tranAmount}" class="form-control " readonly style="border:none; background-color:transparent !important; height: 40px !important; float: left;" ></label><label class="text">&nbsp;원&emsp;&emsp;+&emsp;&emsp;</label>
													<label style="width: 18%;"><%-- <fmt:formatNumber id="loan_tranInterest_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_tranInterest" name="loan_tranInterest" class="form-control " value="${loan.loan_tranInterest}" readonly style="border:none; background-color:transparent !important; height: 40px !important; float: left;" ></label><label class="text">&nbsp;원&emsp;&emsp;=&emsp;&emsp;</label>
													<label style="width: 18%;"><%-- <fmt:formatNumber id="loan_monthlyRepayment_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_monthlyRepayment" name="loan_monthlyRepayment" class="form-control " value="${loan.loan_monthlyRepayment}" readonly style="border:none; background-color:transparent !important; height: 40px !important; float: left;" ></label><label class="text">&nbsp;원</label>
												</td>
											</tr>
											
											<tr>
												<th class="thCss"><label for="loan_interest">총 이자</label></th>
												<td style="text-align: left;"><label style="width: 40%;"><input type="text" id="loan_interest" name="loan_interest" class="form-control " readonly style="border:none; background-color:transparent !important; height: 40px !important; float: left;" ></label><label class="text">&nbsp;원</label></td>
											</tr>
											<tr>
												<th class="thCss"><label for="loan_return">총 상환금액</label></th>
												<td><input type="text" id="loan_return" name="loan_return" class="form-control " readonly style="border:none; background-color:transparent !important; height: 40px !important; width: 50%; float: left;" ><label style="display: flex;transform: translateY(50%);">&nbsp;원</label></td>
											</tr>
											<tr>
												<th class="thCss"><label for="loan_startDate">${cnt + 1}차 납부 기준일</label></th>
												<td><input type="text" id="loan_startDate" name="loan_startDate" placeholder="실행일을 입력하세요." class="form-control  datepicker-here" data-language="ko" data-position="top left" onmouseover="setEndDate();" onmouseout="setEndDate();" onblur="setEndDate();" onfocus="setEndDate();" style="background-color:transparent !important; height: 40px !important; width: 50%; float: left;"/></td>
											</tr>
											<tr>
												<th class="thCss"><label for="loan_endDate">납부일 기준 연체여부</label></th>
												<td><input type="text" id="loan_endDate" name="loan_endDate" class="form-control " readonly style="border:none; background-color:transparent !important; height: 40px !important; width: 50%; float: left;" ></td>
											</tr>
											
										<!--  -->
											
										</table>
										<div align="center"><br><br>
											<input type="submit" class="btn btn-primary" value="신청">&emsp;
											<input type="reset"	class="btn btn-primary" value="초기화">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>	
					</div>	
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