<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>다계좌이체</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">
<style>
#td{
	padding:10px;
}
</style>
</head>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/include/headerB.jsp"%>
		<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">

				<div class="page-inner">

					<div class="row">

						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="card-title fw-mediumbold">다계좌이체</div>
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
								<th colspan="2">출금정보</th>
							</tr>
						</thead>
						<tbody>
							<tr class="table-light">
								<td>출금계좌번호</td>
								<td><select class="input" name="transfer_account_num">
										<option value="111-111-111111(신한은행)">111-111-111111(신한은행)</option>
										<option value="222-2222-2222(국민은행)">222-2222-2222(국민은행)</option>
										<option value="33-33333-33333(농협)">33-33333-33333(농협)</option>
								</select>
									<button class="btn btn-primary btn-sm" style="background-color: linen">계좌
										선택</button>
									<button class="btn btn-primary btn-sm" style="background-color: linen">잔액
										조회</button></td>
							<tr class="table-ligh">
								<td>계좌비밀번호</td>
								<td colspan="2"><input type="password"
									required></td>

							</tr>

						</tbody>
					</table>

					<table class="table table-head-bg-primary mt-4">
						<thead>
							<tr class="table-danger">
								<th scope="col">삭제</th>
								<th scope="col">No</th>
								<th scope="col">입금은행</th>
								<th scope="col">입금계좌</th>
								<th scope="col">이체금액</th>
								<th scope="col">받은통장메모</th>
								<th scope="col">내통장메모</th>
							</tr>
						</thead>
						
						<tbody>
							<tr class="table-light">
								<td><input type="checkbox" name="transfer_checker"></td>
								<td>1</td>
								<td><select class="input" name="bank">
										<option value="신한">신한은행</option>
										<option value="국민">국민은행</option>
										<option value="농협">농협</option>
								</select></td>
								<td><input type="text" name="transfer_send_account_num"></td>
								<td><input type="text" name="amount">원</td>
								<td><input type="text" name="send_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
								<td><input type="text" name="my_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
							</tr>
						</tbody>
						
						<tbody>
							<tr class="table-light">
								<td><input type="checkbox" name="transfer_checker"></td>
								<td>2</td>
								<td><select class="input" name="bank">
										<option value="신한">신한은행</option>
										<option value="국민">국민은행</option>
										<option value="농협">농협</option>
								</select></td>
								<td><input type="text" name="transfer_send_account_num"></td>
								<td><input type="text" name="amount">원</td>
								<td><input type="text" name="send_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
								<td><input type="text" name="my_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
							</tr>
						</tbody>
						
						<tbody>
							<tr class="table-light">
								<td><input type="checkbox" name="transfer_checker"></td>
								<td>3</td>
								<td><select class="input" name="bank">
										<option value="신한">신한은행</option>
										<option value="국민">국민은행</option>
										<option value="농협">농협</option>
								</select></td>
								<td><input type="text" name="transfer_send_account_num"></td>
								<td><input type="text" name="amount">원</td>
								<td><input type="text" name="send_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
								<td><input type="text" name="my_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
							</tr>
						</tbody>
						<tbody>
							<tr class="table-light">
								<td><input type="checkbox" name="transfer_checker"></td>
								<td>4</td>
								<td><select class="input" name="bank">
										<option value="신한">신한은행</option>
										<option value="국민">국민은행</option>
										<option value="농협">농협</option>
								</select></td>
								<td><input type="text" name="transfer_send_account_num"></td>
								<td><input type="text" name="amount">원</td>
								<td><input type="text" name="send_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
								<td><input type="text" name="my_memo" style="width: 200px" 
									placeholder="(선택)10자 이내 입력" maxlength="10"></td>
							</tr>
						</tbody>
						
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="table-light">
								<th>총 이체건수</th>
								<td colspan="2">${totla_send_sum}</td>
								<td>총 이체금액</td>
								<td colspan="3">${total_send_money}</td>
							</tr>
						</thead>
					</table>
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
	<%@ include file="/WEB-INF/views/include/footerB.jsp"%>


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