<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.spring.bank.user.vo.LoanVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모 뱅크</title>
</head>
<body>	
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">대출 원금/이자 조회</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">
										${loan.loan_product_name} (<c:choose>
											<c:when test="${loan.loan_repaymentType == 1}">
												원금균등상환
											</c:when>
											<c:when test="${loan.loan_repaymentType == 2}">
												원리금균등상환
											</c:when>
											<c:when test="${loan.loan_repaymentType == 3}">
												만기일시상환
											</c:when>
										</c:choose>)
									</div>
								</div>
								<div class="card-body">
									<form id="monthlyPrincipalRateform">
										<sec:csrfInput/>
										<table class="table table-hover card-table">
											<thead>
												<tr>
													<th scope="col"></th>
													<th scope="col">대출원금잔액</th>
													<th scope="col">대출이자잔액</th>
													<th scope="col">월상환액</th>
													<th scope="col">월납입원금</th>  
													<th scope="col">월납입이자</th>
													<th scope="col">상환예정일</th>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody id="tblBody">
												<% 
													LoanVO loan = (LoanVO) request.getAttribute("loan");	
												//out.println("loan : " + loan);
													float rate = loan.getLoan_rate() / 100;
													//out.println("rate : " + rate);
													long amount = loan.getLoan_amount();
													//out.println("amount : " + amount);
													int month = loan.getLoan_month();
													//out.println("month : " + month);
													LocalDate loan_startDate = loan.getLoan_startDate().toLocalDate();
													//out.println("loan_startDate : " + loan_startDate);
													DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");


												%>
												<c:if test="${loan.loan_repaymentType == 1}">
													<%
														long first_tran_amount = Math.round(amount / month);
														//out.println("first_tran_amount : " + first_tran_amount);
														long first_tran_interest = Math.round((amount * (rate / 12)));
														//out.println("first_tran_interest : " + first_tran_interest);
														
														long ta = first_tran_amount;
														//out.println("ta : " + ta);
														long ti = first_tran_interest;
														//out.println("ti : " + ti);
														long sum_amount = amount;
														//out.println("sum_amount : " + sum_amount);
														long sum_interest = first_tran_interest;
														//out.println("sum_interest : " + sum_interest);
														for(int i = 1; i <= month; i++) {
															//out.println("i : " + i);
															sum_amount -= ta;
															//out.println("sum_amount : " + sum_amount);
															ti = Math.round((sum_amount * (rate / 12)));
															//out.println("ti : " + ti);
															sum_interest += ti;
															//out.println("sum_interest : " + sum_interest);
														}
										 	 			
														long first_monthlyRepayment = first_tran_amount + first_tran_interest;
														//out.println("first_monthlyRepayment : " + first_monthlyRepayment);
													%>
													<tr>
														<td></td>
														<td>${loan.loan_amount}</td>
														<td><%=sum_interest%></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<%
														sum_amount = amount;
														//out.println("sum_amount : " + sum_amount);
														long monthly = first_monthlyRepayment;
														//out.println("monthly : " + monthly);
														long tran_amount = first_tran_amount;
														//out.println("tran_amount : " + tran_amount);
														long tran_interest = first_tran_interest;
														//out.println("tran_interest : " + tran_interest);
														LocalDate return_date = loan_startDate.plusMonths(1);
														//out.println("return_date : " + return_date);
														String date = return_date.format(formatter);
														for(int i = 1; i <= month; i++) {
															//out.println("i : " + i);
															return_date = loan_startDate.plusMonths(i);
															//out.println("return_date : " + return_date);
															date = return_date.format(formatter);
															sum_amount -= tran_amount;
															//out.println("sum_amount : " + sum_amount);
															sum_interest -= tran_interest;
															//out.println("sum_interest : " + sum_interest);
															monthly = tran_interest + tran_amount;
															//out.println("monthly : " + monthly);
													%>
													<tr>
														<td><%=i%>차</td>
														<td><%=sum_amount%></td>
														<td><%=sum_interest%></td>
														<td><%=monthly%></td>
														<td><%=tran_amount%></td>
														<td><%=tran_interest%></td>
														<td><%=date%><%-- <fmt:formatDate value="<%=return_date%>" pattern="yyyy/MM/dd" /> --%></td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="window.location=''">납부</button>
														</td>
													</tr>
													<% 		
															tran_interest = Math.round((sum_amount * (rate / 12)));
															//out.println("tran_interest : " + tran_interest);
														} 
													%>			
												</c:if>
												<c:if test="${loan.loan_repaymentType == 2}">
													<%
														long first_tran_interest = Math.round((amount * (rate / 12)));
														
														double pow = Math.pow((1 + (rate / 12)), month);
														long monthlyRepayment =  Math.round((amount * (rate / 12) * pow) / (pow - 1));
														
														long first_tran_amount = monthlyRepayment - first_tran_interest;
														
														long sum_amount = amount;
														long sum_interest = Math.round((monthlyRepayment * month) - amount);
													%>
													<tr>
														<td></td>
														<td>${loan.loan_amount}</td>
														<td><%=sum_interest%></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<%
														long tran_amount = first_tran_amount;
														long tran_interest = first_tran_interest;
														LocalDate return_date = loan_startDate.plusMonths(1);
														String date = return_date.format(formatter);
														for(int i = 1; i <= month; i++) {
															return_date = loan_startDate.plusMonths(i);
															date = return_date.format(formatter);
															sum_amount -= tran_amount;
															sum_interest -= tran_interest;
													%>
													<tr>
														<td><%=i%>차</td>
														<td><%=sum_amount%></td>
														<td><%=sum_interest%></td>
														<td><%=monthlyRepayment%></td>
														<td><%=tran_amount%></td>
														<td><%=tran_interest%></td>
														<td><%=date%><%-- <fmt:formatDate value="<%=return_date%>" pattern="yyyy/MM/dd" /> --%></td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="window.location=''">납부</button>
														</td>
													</tr>
													<% 		
															tran_interest = Math.round((sum_amount * (rate / 12)));
															tran_amount = monthlyRepayment - tran_interest;
														} 
													%>		
												</c:if>
												<c:if test="${loan.loan_repaymentType == 3}">
													<%
														long first_tran_amount = 0;
														long first_tran_interest = Math.round((amount * (rate / 12)));
														long sum_amount = amount;
														long sum_interest =  Math.round((amount * (rate / 12)) * month);
														long first_monthlyRepayment = first_tran_amount + first_tran_interest;
													%>
													<tr>
														<td></td>
														<td>${loan.loan_amount}</td>
														<td><%=sum_interest%></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<% 
														long monthly = first_monthlyRepayment;
														long tran_amount = first_tran_amount;
														long tran_interest = first_tran_interest;
														LocalDate return_date = loan_startDate.plusMonths(1);
														String date = return_date.format(formatter);
														for(int i = 1; i <= month; i++) {
															return_date = loan_startDate.plusMonths(i);
															date = return_date.format(formatter);
															sum_amount -= tran_amount;
															sum_interest -= tran_interest;
															monthly = tran_interest + tran_amount;
													%>
													<tr>
														<td><%=i%>차</td>
														<td><%=sum_amount%></td>
														<td><%=sum_interest%></td>
														<td><%=monthly%></td>
														<td><%=tran_amount%></td>
														<td><%=tran_interest%></td>
														<td><%=date%><%-- <fmt:formatDate value="<%=return_date%>" pattern="yyyy/MM/dd" /> --%></td>
														<td>
															<button class="btn btn-primary btn-xs" onclick="window.location=''">납부</button>
														</td>
													</tr>
													<% 		
															if(i == month - 1) tran_amount = amount;
														} 
													%>					
												</c:if>
											</tbody>
										</table>
										<div class="d-flex justify-content-center"><button class="btn btn-primary btn-xs" onclick="window.location='loanPrincipalPayment.do'" type="button">해지하기</button></div>
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