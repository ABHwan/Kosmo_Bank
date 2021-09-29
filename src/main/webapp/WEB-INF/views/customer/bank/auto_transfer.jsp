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

				<div class="page-inner">

					<div class="row">

						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="card-title fw-mediumbold">자동 이체</div>
									<div class="card-list">
										<hr>

										<form action="transfer_confirm" method="post"
											name="transfer_confirm"
											onsubmit="return transfer_Info_Check();">

											<!-- table  -->
											<div class="container">
												<div class="table-responsive">
													<table class="table table-head-bg-primary mt-4">
														<thead>
															<tr class="table-danger">
																<th style="background-color: #ffffff" colspan="2">출금정보</th>
															</tr>
														</thead>
														<tbody>
															<tr class="table-light">
																<td>출금계좌번호</td>
																<td><select class="input"
																	name="transfer_account_num">
																		<option value="111-111-111111(신한은행)">111-111-111111(신한은행)</option>
																		<option value="222-2222-2222(국민은행)">222-2222-2222(국민은행)</option>
																		<option value="33-33333-33333(농협)">33-33333-33333(농협)</option>
																</select>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">잔액 조회</button></td>
															<tr class="table-ligh">
																<td>계좌비밀번호</td>
																<td colspan="2"><input type="password"
																	maxlength="4" required></td>
															</tr>
														</tbody>
													</table>

													<table class="table table-head-bg-primary mt-4">
														<thead>
															<tr class="table-danger">
																<th style="background-color: #ffffff" colspan="2">입금정보</th>
															</tr>
														</thead>
														<tbody>
															<tr class="table-light">
																<td>입금은행</td>
																<td colspan="2"><select class="input" name="bank"
																	style='width: 150px' required>
																		<option value="신한">신한은행</option>
																		<option value="국민">국민은행</option>
																		<option value="농협">농협</option>
																</select></td>
															<tr class="table-ligh">
																<td>입금계좌번호</td>
																<td colspan="2"><input type="text"
																	name="transfer_send_account_num" style="width: 200px"
																	required>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">최근입금계좌</button></td>
															</tr>

															<tr class="table-ligh">
																<td>이체금액</td>
																<td colspan="2"><input type="text" name="amount"
																	style="width: 200px" required>원
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">이체한도조회</button> <br>

																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">1만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">3만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">5만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">10만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">50만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">100만원</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen">전액</button>
																	<button class="btn btn-primary btn-sm"
																		style="background-color: linen" type="reset">정정</button></td>
															</tr>

															<tr class="table-ligh">
																<td>이체 주기</td>
																<td><select class="input" name="cycle"
																	style='width: 150px' required>
																		<option value="">선택</option>
																		<option value="1">1개월</option>
																		<option value="2">2개월</option>
																		<option value="3">3개월</option>
																		<option value="6">6개월</option>
																		<option value="12">12개월</option>
																		<option value="월요일">월요일</option>
																		<option value="화요일">화요일</option>
																		<option value="수요일">수요일</option>
																		<option value="목요일">목요일</option>
																		<option value="금요일">금요일</option>
																		<option value="매일">매일</option>
																</select> <br>*매일 이체방식은 영업일에만 이체처리됩니다.<br> (토요일, 일요일,
																	공휴일의 경우 이체처리 되지 않습니다.)</td>
															</tr>
															<tr class="table-ligh">
																<td>이체시작일/이체종료일</td>
																<td><input type="date" id="datepicker1"> ~
																	<input type="date" id="datepicker2"></td>
															</tr>

															<tr class="table-ligh">
																<td>휴일이체구분</td>
																<td><select class="input"
																	name="holidays_auto_transfer" style='width: 150px'
																	required>
																		<option value="휴일익일이체">휴일익일이체</option>
																		<option value="휴일전일이체">휴일전일이체</option>
																</select> 당행이체 자동이체일 경우 선택</td>
															</tr>

															<tr class="table-ligh">
																<td>받는통장 메모</td>
																<td><input type="text" name="send_memo"
																	style="width: 200px" placeholder="(선택)10자 이내 입력"
																	maxlength="10"></td>
															</tr>

															<tr class="table-ligh">
																<td>내통장 메모</td>
																<td><input type="text" name="my_memo"
																	style="width: 200px" placeholder="(선택)10자 이내 입력"
																	maxlength="10"></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="my-info text-center">
												<input type="button" class="btn btn-info"
													style="width: 80px"
													onclick="window.location='index.do'" value="취소">
												<input class="btn btn-info" type="submit" value="다음(최종확인)">
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