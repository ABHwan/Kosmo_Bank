<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>코스모 뱅크</title>
<link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css">
<script src="${rePath}js/transfer_page.js"></script>
<script>

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
									<div class="card-title fw-mediumbold">이체</div>
									<div class="card-list">
										<hr>
										
<form action="transfer_confirm" method="post"
	name="transferform" onsubmit="return transferCheck();">
	<!-- table  -->
	<sec:csrfInput />
	
	<!-- hiddenPassword : 게좌 비밀번호 확인 버튼 클릭여부 체크(0: 클릭 안함, 1: 클릭함) -->
	<input type="hidden" name="hiddenPassword" value="0">
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
						<td colspan="2"><select class="input"
							name="account_id">
								<c:forEach var="dto" items="${dtos}">
									<option value="">${dto}</option>
								</c:forEach>
						</select>
							<button class="btn btn-primary btn-sm"
								style="background-color: linen">잔액 조회</button></td>
					</tr>
					<tr class="table-ligh">
						<td>계좌비밀번호</td>
						
						<td colspan="2"><input type="password"
							name="account_password" maxlength="4">
							<input class="btn btn-primary btn-sm" type="button" name="dupChk" value="확인"
					onclick="account_confirmPwd();"></td>
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
						<td colspan="2"><select class="input" name="account_bank"
							style='width: 150px'>
								<option value="신한" value="1">신한</option>
								<option value="KB국민" value="2">국민</option>
								<option value="농협" value="3">농협</option>
								<option value="한국씨티" value="4">한국씨티</option>
								<option value="SC제일" value="5">SC제일</option>
								<option value="광주" value="6">광주</option>
								<option value="IBK기업" value="7">IBK기업</option>
								<option value="KEB하나" value="8">KEB하나</option>
								<option value="BNK부산">BNK부산</option>
								<option value="우리">우리</option>
								<option value="SH수협">SH수협</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="KDB산업">KDB산업</option>
								<option value="DGB대구">DGB대구</option>
								<option value="전북">전북</option>
								<option value="제주">제주</option>
								<option value="케이뱅크">케이뱅크</option>
						</select></td>
					</tr>
					<tr class="table-ligh">
						<td>입금계좌번호</td>
						<td colspan="2"><input type="text"
							name="transfer_senderAccount" style="width: 200px">
							<button class="btn btn-primary btn-sm"
								style="background-color: linen" onclick="">최근입금계좌</button></td>
					</tr>
				
					<tr class="table-ligh">
						<td>이체금액</td>
						<td colspan="2"><input type="text"
							id="transfer_money" name="transfer_money"
							style="width: 200px" value="0" onclick="addPrice">원
							<button class="btn btn-primary btn-sm"
								style="background-color: linen">이체한도조회</button> <br>

							<button class="btn btn-primary btn-sm" onclick="addPrice" name="10000"
								style="background-color: linen">1만원</button>
							<button class="btn btn-primary btn-sm" name="30000"
								style="background-color: linen">3만원</button>
							<button class="btn btn-primary btn-sm" name="50000"
								style="background-color: linen">5만원</button>
							<button class="btn btn-primary btn-sm" name="100000"
								style="background-color: linen">10만원</button>
							<button class="btn btn-primary btn-sm" name="500000"
								style="background-color: linen">50만원</button>
							<button class="btn btn-primary btn-sm" name="1000000"
								style="background-color: linen">100만원</button>
							<button class="btn btn-primary btn-sm"
								style="background-color: linen">전액</button>
							<button class="btn btn-primary btn-sm"
								style="background-color: linen" type="reset">정정</button></td>
					</tr>
					<tr class="table-ligh">
						<td>내통장 메모</td>
						<td><input type="text" name="transfer_inComment"
							style="width: 200px" placeholder="(선택)10자 이내 입력"
							maxlength="10" value=""></td>
					</tr>
					<tr class="table-ligh">
						<td>받는통장 메모</td>
						<td><input type="text" name="transfer_outComment"
							style="width: 200px" placeholder="(선택)10자 이내 입력"
							maxlength="10" value=""></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>

	<div class="my-info text-center">

		<input type="button" class="btn btn-info"
			style="width: 80px" onclick="window.location='index.do'"
			value="취소"> <input class="btn btn-info"
			type="submit" value="송금">
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