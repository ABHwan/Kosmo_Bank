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
									<div class="card-title">신규 대출 신청</div>
								</div>
								<div class="card-body">
									<form action="newLoanSignAction.do" name="newLoanSignform" method="post">
					 					<sec:csrfInput />
										<table class="table table-hover card-table">
										<!--  -->
										
										
											<tr>
												<th><label for="loan_product_name">대출 상품명</label></th>
												<td><input type="text" value="${loanProduct.loan_product_name}" id="loan_product_name" name="loan_product_name" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="member_id">아이디</label></th>
												<td><input type="text" value="${loanMember.member_id}" id="member_id" name="member_id" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="member_name">이름</label></th>
												<td><input type="text" value="${loanMember.member_name}" id="member_name" name="member_name" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="account_id">계좌번호</label></th>
												<td style="display:flex;">
													<select class="form-control form-control" style="width:30%;" name="account_id_select" onchange="setAccount();">
														<option value="0">계좌생성</option>
														<c:forEach var="j" items="${loanAccount}">
															<option value="${j.account_id}">${j.account_id}</option>
														</c:forEach>
													</select>
													<input type="text" id="account_id" name="account_id" style="width:70%;" class="form-control input-border-bottom">
												</td>
											</tr>
											<tr>
												<th><label for="loan_month">대출기간</label></th>
												<td style="display:flex;">
													<select class="form-control form-control" style="width:40%;" name="loan_month" onchange="setEndDate();">
														<c:forEach var="i" begin="${loanProduct.loan_product_minDate * 12}" step="6" end="${loanProduct.loan_product_maxDate * 12}">
															<option value="${i}">${i}&nbsp;개월&nbsp;&nbsp;(${i/12}&nbsp;년)</option>
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="loan_startDate">대출실행일</label></th>
												<td><input type="text" id="loan_startDate" name="loan_startDate" class="form-control input-border-bottom datepicker-here" data-language="ko" data-position="top left" onmouseover="setEndDate();" onmouseout="setEndDate();" onblur="setEndDate();" onfocus="setEndDate();"/></td>
											</tr>
											<tr>
												<th><label for="loan_endDate">대출만기일</label></th>
												<td><input type="text" id="loan_endDate" name="loan_endDate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_repaymentType">상환방법</label></th>
												<td>
													<select class="form-control form-control" name="loan_repaymentType">
														<option value="1">원금균등상환</option>
														<option value="2">원리금균등상환</option>
														<option value="3">만기일시상환</option>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="loan_amount">대출원금</label></th>
												<td><input type="text" id="loan_amount" name="loan_amount" class="form-control input-border-bottom" required placeholder="원 단위로 입력하세요."></td>
											</tr>
											<tr>
												<th><label for="loan_rate">대출금리</label></th>
												<td><input value="${loanProduct.loan_product_rate}" type="text" id="loan_rate" name="loan_rate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_prepaymentRate">중도상환수수료요율</label></th>
												<td><input type="text" value="${loanProduct.loan_product_prepaymentRate}" id="loan_prepaymentRate" name="loan_prepaymentRate" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr style="height:100px;">
												<th colspan="2">
												<button class="btn btn-secondary" type="button" onclick="setCash();">
													<span class="btn-label">
														<i class="fa fas fa-calculator"></i>
													</span>
													상환액 계산
												</button>
												</th>
											</tr>
											<tr>
												<th><label for="loan_interest">총 이자</label></th>
												<td><input type="text" id="loan_interest" name="loan_interest" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th><label for="loan_return">총 상환금액</label></th>
												<td><input type="text" id="loan_return" name="loan_return" class="form-control input-border-bottom" readonly></td>
											</tr>
											<tr>
												<th colspan="2"><label for="loan_tranAmount" style="width:20%">1차 납입원금</label>&emsp;&emsp;+&emsp;&emsp;<label for="loan_tranInterest" style="width:20%">1차 납입이자</label>&emsp;&emsp;=&emsp;&emsp;<label for="loan_monthlyRepayment" style="width:20%">1차 상환액</label></th>
											</tr>
											<tr>
												<th colspan="2">
													<label style="width:20%"><%-- <fmt:formatNumber id="loan_tranAmount_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_tranAmount" name="loan_tranAmount" class="form-control input-border-bottom" readonly></label>&nbsp;원&emsp;&emsp;+&emsp;&emsp;
													<label style="width:20%"><%-- <fmt:formatNumber id="loan_tranInterest_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_tranInterest" name="loan_tranInterest" class="form-control input-border-bottom" readonly></label>&nbsp;원&emsp;&emsp;=&emsp;&emsp;
													<label style="width:20%"><%-- <fmt:formatNumber id="loan_monthlyRepayment_fmt" value="" pattern="#,###.##" /> --%><input type="text" id="loan_monthlyRepayment" name="loan_monthlyRepayment" class="form-control input-border-bottom" readonly></label>&nbsp;원
												</th>
											</tr>
											
										<!--  -->
											
										</table>
										<div align="center"><br>
											<!-- <button class="btn btn-success">
												<span class="btn-label">
													<i class="fa fa-check"></i>
												</span>
												약관 동의 완료
											</button> -->
											<button type="button" id="termsBtn" onclick="openTerms();" class="btn btn-warning">
												<span class="btn-label">
													<i id="termsI" class="fa fa-exclamation-circle"></i>
												</span>
												약관 동의하기
											</button>
										</div>
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
	    
 	<script type="text/javascript">
	 	$('#loan_startDate').datepicker({
	 		minDate: new Date() // Now can select only dates, which goes after today
	 	})
	 	
	 	function setCash() {
	 		if(document.newLoanSignform.loan_amount.value != null) {
		 		var rate = parseFloat(document.newLoanSignform.loan_rate.value) / 100; // 금리
	 			var month = parseInt(document.newLoanSignform.loan_month.value); // 기간
	 			var amount = parseInt(document.newLoanSignform.loan_amount.value); // 대출원금
	 			var sum_interest = document.newLoanSignform.loan_interest; // 총 이자
	 			var tranInterest = document.newLoanSignform.loan_tranInterest; // 1차 납입이자
	 			var tranAmount = document.newLoanSignform.loan_tranAmount; // 1차 납입원금
	 			var monthlyRepayment = document.newLoanSignform.loan_monthlyRepayment; // 1차 상환액
	 			var returnSum = document.newLoanSignform.loan_return; // 1차 상환액

				
				if(document.newLoanSignform.loan_repaymentType.value == 1) { //원금균등상환
					//Math.round() 반올림
					//1차 납입원금
					tranAmount.value = Math.round(amount / month);

					//1차 납입이자
					tranInterest.value = Math.round((amount * (rate / 12)));
		 			
					var ta = parseInt(tranAmount.value);
					var ti = parseInt(tranInterest.value);
					var amSum = amount;
					var inSum = ti;
					for(var i = 1; i <= month; i++) {
						amSum -= ta;
						ti = Math.round((amSum * (rate / 12)));
						inSum += ti;
					}
					
					//총 이자
	 	 			sum_interest.value = inSum;
	 	 			
					//1차 상환액
					monthlyRepayment.value = parseInt(tranInterest.value) + parseInt(tranAmount.value);
					
					//총 상환금액
					returnSum.value = parseInt(sum_interest.value) + amount;
					
		 		} else if(document.newLoanSignform.loan_repaymentType.value == 2) { //원리금균등상환
					//1차 납입이자
					tranInterest.value = Math.round((amount * (rate / 12)));
					
			 		//Math.pow(값, 제곱승)
			 		var pow = Math.pow((1 + (rate / 12)), month);
			 		console.log(pow);
			 		
					//1차 상환액
					monthlyRepayment.value = Math.round((amount * (rate / 12) * pow) / (pow - 1));
					
					//1차 납입원금
					tranAmount.value = parseInt(monthlyRepayment.value) - parseInt(tranInterest.value);
					
		 			//총 이자
	 	 			sum_interest.value = Math.round((parseInt(monthlyRepayment.value) * month) - amount);
		 		
					//총 상환금액
					returnSum.value = parseInt(sum_interest.value) + amount;
					
		 		} else if(document.newLoanSignform.loan_repaymentType.value == 3) { //만기일시상환
	 	 			//총 이자
	 	 			sum_interest.value = Math.round((amount * (rate / 12)) * month);
		 		
					//1차 납입원금
					tranAmount.value = "0";
					
					//1차 납입이자
					tranInterest.value = Math.round((amount * (rate / 12)));
					
					//1차 상환액
					monthlyRepayment.value = parseInt(tranInterest.value) + parseInt(tranAmount.value);
					
					//총 상환금액
					returnSum.value = parseInt(sum_interest.value) + amount;
		 		} 

	 			document.querySelector("#loan_tranInterest_fmt").value = parseInt(tranInterest.value);
	 			document.querySelector("#loan_tranAmount_fmt").value = parseInt(tranAmount.value);
	 			document.querySelector("#loan_monthlyRepayment_fmt").value = parseInt(monthlyRepayment.value);
	 			
	 		}
	 	}
	 	
	 	function setEndDate() {
	 		if(document.newLoanSignform.loan_month.value != null && document.newLoanSignform.loan_startDate.value != null) {
	 			var startDate = document.newLoanSignform.loan_startDate.value.split('/');
	 			var month = document.newLoanSignform.loan_month.value;

	 			startDate[0] = parseInt(startDate[0]);
	 			startDate[1] = parseInt(startDate[1]);
	 			startDate[2] = parseInt(startDate[2]);
	 			
	 			startDate[1] += parseInt(month);
	 			startDate[0] += ((startDate[1] - startDate[1] % 12) / 12);
	 			startDate[1] = startDate[1] % 12;

	 			if(startDate[1] < 10) {startDate[1] = "0" + startDate[1];}
	 			if(startDate[2] < 10) {startDate[2] = "0" + startDate[2];}
	 			
	 			document.newLoanSignform.loan_endDate.value = startDate[0] + "/" + startDate[1] + "/" + startDate[2];
	 		}
	 	}
	 	
	 	function setAccount() {
	 		if(document.newLoanSignform.account_id_select.value != 0) {
	 			// 직접입력이 아닌경우 
	 			document.newLoanSignform.account_id.value = document.newLoanSignform.account_id_select.value;
	 		} else {
	 			// 직접입력
	 			document.newLoanSignform.account_id.value = "";
	 			document.newLoanSignform.account_id.focus();
	 		}
	 		
	 	}
 		function openTerms() {
 			var popupX = (window.screen.width / 2) - (800 / 2); // 윈도우 픽셀 기준 X축 중간
 			var popupY = (window.screen.height / 2) - (1000 / 2); // 윈도우 픽셀 기준 Y축 중간
 			var url = "http://localhost:8092/bank/customer/terms.do";
 			window.open(url, "about:blank", "width=800, height=1000, left="+popupX + ",top="+popupY);
 			var btn = document.querySelector("#termsBtn");
 			btn.classList.remove('btn-warning');  // 대상 요소의 클래스 목록에서 클래스 btn-warning 제외
 			btn.classList.add('btn-success');  // 대상 요소의 클래스 목록에 클래스 btn-success 추가
 			btn.innerHTML = '<span class="btn-label"><i id="termsI" class="fa fa-check"></i></span>약관 동의 완료';
 			//btn.textContent
 		}
 	</script>
 
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