<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>코스모 뱅크</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">
<script>
	function datePickerSet(sDate, eDate, flag) {

		//시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
				&& eDate.length > 0) {
			var sDay = sDate.val();
			var eDay = eDate.val();

			if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

				var edp = eDate.datepicker().data("datepicker");
				edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(eDay)) {
				sDate.datepicker({
					maxDate : new Date(eDay.replace(/-/g, "/"))
				});
			}
			sDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(sDay)) {
				eDate.datepicker({
					minDate : new Date(sDay.replace(/-/g, "/"))
				});
			}
			eDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
			var sDay = sDate.val();
			if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			sDate.datepicker({
				language : 'ko',
				autoClose : true
			});
		}

		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	}
</script>
</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
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
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br />
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="page-inner">

					<div class="row">

						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="card-title fw-mediumbold">자동이체 등록</div>
									<div class="card-list">
										<hr>

										<form action="autoTransferInsertAction" method="post" name="transfer_confirm" onsubmit="return transfer_Info_Check();">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<input type="hidden" name="member_id" value="${sessionScope.customerID}">
											<!-- table  -->
											<div class="container">
												<div class="table-responsive">
													
													<table class="table table-head-bg-primary mt-4">
														<thead>
															<tr class="table-danger">
																<th style="background-color: #ffffff" colspan="2">자동이체정보</th>
															</tr>
														</thead>
														<tbody>
															<tr class="table-light">
																<td>출금계좌번호</td>
																<td>
																	<select class="input" name="account_id">
																		<c:forEach var="dto" items="${dtos}" >
																			<c:choose>
																				<c:when test="${dto.account_bankCode==1}">
																					<option value="${dto.account_id}">${dto.account_id} / 국민은행</option>
																				</c:when>
																				<c:when test="${dto.account_bankCode==2}">
																					<option value="${dto.account_id}">${dto.account_id} / 우리은행</option>
																				</c:when>
																				<c:when test="${dto.account_bankCode==3}">
																					<option value="${dto.account_id}">${dto.account_id} / 농협은행</option>
																				</c:when>
																				<c:when test="${dto.account_bankCode==4}">
																					<option value="${dto.account_id}">${dto.account_id} / 신한은행</option>
																				</c:when>
																				<c:when test="${dto.account_bankCode==5}">
																					<option value="${dto.account_id}">${dto.account_id} / 하나은행</option>
																				</c:when>
																				<c:when test="${dto.account_bankCode==6}">
																					<option value="${dto.account_id}">${dto.account_id} / 코스모은행</option>
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</select>
																</td>
															</tr>
															<tr class="table-light">
																<td>입금계좌번호</td>
																<td colspan="2">
																	<select class="input" name="sendAccountBankCode" style='width: 100px'>
																			<option value="1">국민은행</option>
																			<option value="2">우리은행</option>
																			<option value="3">농협은행</option>
																			<option value="4">신한은행</option>
																			<option value="5">하나은행</option>
																			<option value="6">코스모은행</option>
																	</select>
																	
																	<input type="text" name="auto_senderAccount" style="width: 200px" placeholder="계좌번호를 입력하세요">
																</td>
															<tr>
															
															<tr class="table-light">
																<td>이체금액</td>
																<td colspan="2"><input type="text" name="auto_money" style="width: 200px" required> 원</td>
															</tr>

															<tr class="table-light">
																<td>이체 주기</td>
																<td>
																	<select class="input" name="auto_outDate" style='width: 150px' required>
																		<option value="">선택</option>
																		<option value="1">매달 1일</option>
																		<option value="4">매달 4일</option>
																		<option value="5">매달 5일</option>
																		<option value="10">매달 10일</option>
																		<option value="15">매달 15일</option>
																		<option value="20">매달 20일</option>
																		<option value="25">매달 25일</option>
																	</select>
																</td>
															</tr>
															
															<tr class="table-light">
																<td>이체시작일/이체종료일</td>
																<td><input type="date" name="auto_registDate" id="datepicker1"> ~
																	<input type="date" name="auto_expirationDate" id="datepicker2"></td>
															</tr>

															

															<tr class="table-light">
																<td>자동이체 종류</td>
																<td>
																	<select class="input" name="auto_type" style='width: 150px' required>
																		<option value="">선택</option>
																		<option value="1">예금</option>
																		<option value="2">적금</option>
																		<option value="3">대출</option>
																		<option value="4">연금</option>
																		<option value="5">공과금</option>
																		<option value="6">기타</option>
																	</select>
																</td>
															</tr>

															<tr class="table-light">
																<td>이체기관명(내용)</td>
																<td>
																<input type="text" name="auto_inPlace" style="width: 200px" placeholder="이체기관명(내용) 입력">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											
											<div class="my-info text-center">
												<input class="btn btn-primary" type="submit" value="등록">
												<input class="btn btn-primary btn-border" type="reset" value="초기화">
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



	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
	<script
		src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>
	<script>
		$("#datepicker").datepicker({
			language : 'ko'
		});
	</script>

	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script
		src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script
		src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

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
	<%@ include file="/WEB-INF/views/include/chatbot.jsp"%>


</body>
</html>