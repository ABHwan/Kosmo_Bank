<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>코스모 뱅크</title>
<%-- <link rel="stylesheet" href="${rePath}All_transfer/all_transfer.css"> --%>
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
				<!-- 고정헤더 -->
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div
							class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1>
								<br />
								<h2 class="text-white op-7 mb-2">
									KOSMO BANK에 오신 것을 환영합니다.<br /> 저희는 고객님의 <strong>자산관리</strong>를
									효율적이고, 안전하게 도와드립니다. </br> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게
									통합하여 금융상품을 이용하실 수 있습니다.
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- 고정헤더 -->

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
	<sec:csrfInput />
	<input type="hidden" name="hiddenPassword" value="0">
	<div class="card-body">
		<table class="table table-head-bg-primary mt-4">
			<thead>
				<tr class="table-danger">
					<th style="background-color: #ffffff" colspan="2">출금정보</th>
				</tr>
			</thead>
			<tbody>
				<tr class="table-light">
					<td>출금계좌번호</td>
					<td colspan="2"><select class="input" name="account_id">
							<c:forEach var="dto" items="${dtos}">
								<option value="${dto}">${dto}</option>
							</c:forEach> </select>
						<button class="btn btn-primary btn-sm" style="background-color: linen">잔액 조회</button></td>
				</tr>
			</tbody>
		</table>
		<table class="table table-head-bg-primary mt-4">
			<thead>
				<tr><th style="background-color: #ffffff" colspan="2">입금정보</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>입금은행</td>
					<td colspan="2"><select class="input"
						name="transfer_bankCode" id="transfer_bankCode"
						style='width: 150px'>
							<option value="0">미기재</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">농협</option>
							<option value="4">신한</option>
							<option value="5">하나</option>
							<option value="6">코스모</option>
							
					</select></td>
				</tr>
				<tr>
					<td>입금계좌번호</td>
					<td colspan="2"><input type="text"
						name="transfer_senderAccount"
						id="transfer_senderAccount" style="width: 200px">
						<button class="btn btn-primary btn-sm"
							style="background-color: linen" onclick="">최근입금계좌</button></td>
				</tr>

				<tr>
					<td>이체금액</td>
					<td colspan="2"><input type="text"
						id="transfer_money" name="transfer_money"
						id="transfer_money" style="width: 200px" value="0"
						onclick="">원
						<button class="btn btn-primary btn-sm"
							style="background-color: linen">이체한도조회</button> <br>

						<button class="btn btn-primary btn-sm" onclick=""
							name="10000" id="10000" style="background-color: linen">1만원</button>
						<button class="btn btn-primary btn-sm" name="30000"
							id="30000" style="background-color: linen">3만원</button>
						<button class="btn btn-primary btn-sm" name="50000"
							id="50000" style="background-color: linen">5만원</button>
						<button class="btn btn-primary btn-sm" name="100000"
							id="100000" style="background-color: linen">10만원</button>
						<button class="btn btn-primary btn-sm" name="500000"
							id="500000" style="background-color: linen">50만원</button>
						<button class="btn btn-primary btn-sm" name="1000000"
							id="1000000" style="background-color: linen">100만원</button>
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
				<tr>
					<td><input type="hidden" name="transfer_inOutDate"
						id="transfer_inOutDate">
						<!-- <input type="hidden" name="transfer_senderName"
						id="transfer_senderName">
						<input type="hidden" name="transfer_receiverName"
						id="transfer_receiverName"> -->
				</tr>
			</tbody>
		</table>
	</div>

	<div class="my-info text-center">

		<input class="btn btn-primary" type="submit" value="송금">
		<input type="button" class="btn btn-primary btn-border"
			style="width: 80px" onclick="window.location='index.do'"
			value="취소">
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