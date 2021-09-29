<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>코스모 뱅크</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon"/>
	
	<!-- Fonts and icons -->
	<script src="${rePath}js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['${rePath}css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
	
	<!-- CSS Files -->
	<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
	<link rel="stylesheet" href="${rePath}css/atlantis.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="${rePath}css/demo.css">
	
	<script type="text/javascript">
	
	function insertCheck() {
		
		// 계좌 생성자
		if(document.testDataForm.unique_key.value == "") {
			alert("생성자를 선택해주세요!!");
			document.testDataForm.unique_key.focus();
			return false;
			
		// 비밀번호
		} else if(!document.testDataForm.account_password.value) {
			alert("비밀번호를 입력하세요!!");
			document.testDataForm.account_password.focus();
			return false;
			
		// 비밀번호 확인
		} else if(document.testDataForm.account_password.value != document.testDataForm.REaccount_password.value) {
			alert("비밀번호가 일치하지않습니다!!");
			document.testDataForm.REaccount_password.focus();
			return false;
			
		// 계좌잔액
		} else if(!document.testDataForm.account_balance.value) {
			alert("계좌 잔액을 입력하세요!!");
			document.testDataForm.account_balance.focus();
			return false;
			
		// 계좌종류
		} else if(!document.testDataForm.account_type.value) {
			alert("계좌 종류를 입력하세요!!");
			document.testDataForm.account_type.focus();
			return false;
			
		// 계좌종류
		} else if(document.testDataForm.account_type.value > 0 && document.testDataForm.account_type.value > 1 ) {
			alert("잘못된 계좌 종류입니다!!");
			document.testDataForm.account_type.value = "";
			document.testDataForm.account_type.focus();
			return false;
			
		// 계좌상태
		} else if(!document.testDataForm.account_state.value) {
			alert("계좌상태를 입력하세요!!");
			document.testDataForm.account_state.focus();
			return false;
		
		// 계좌상태
		} else if(document.testDataForm.account_state.value > 0 && document.testDataForm.account_state.value > 1 ) {
			alert("잘못된 계좌 상태입니다!!");
			document.testDataForm.account_state.value = "";
			document.testDataForm.account_state.focus();
			return false;
			
		// 계좌상태설명
		} else if(!document.testDataForm.account_stateContent.value) {
			alert("계좌상태를 입력하세요!!");
			document.testDataForm.account_stateContent.focus();
			return false;
			
		// 일일한도
		} else if(!document.testDataForm.account_limit.value) {
			alert("일일한도를 입력하세요!!");
			document.testDataForm.account_limit.focus();
			return false;
		}
		
	}
	
	</script>
	
<link rel="stylesheet" href="${rePath}css/user/register.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${rePath}js/script.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />

		
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- img 시작 -->
				<div class="page-inner mt--5"> 
						<div class="row"> 
							<div class="col">
								<div class="card">
									<div class="card-body">

	<div class="register_form_div ml-5">

		<form action="testAccountInsert" name="testDataForm" method="post" onsubmit="return insertCheck();" >			
			<sec:csrfInput />
			
			<h3>TEST 계좌 생성</h3>
			<table class="register_table">
				<tr>
					<th><label for="account_bankCode">은행</label></th>
					<td>
						<select id="account_bankCode" name="account_bankCode">
							<option value="0">미선택</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">농협</option>
							<option value="4">신한</option>
							<option value="5">하나</option>
							<option value="6">코스모</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="unique_key">생성자 고유번호</label></th>
					<td>
						<select id="unique_key" name="unique_key">
							<option value="">선택</option>
							<option value="TSl2f1DC5C/enSZx2MPm3FiHY4nl271kURnmAOctiiazpUaTBQpKPOCnLbh/TYw1ZI2kUbMKYVZkKe3LVU67A==">안복환</option>
							<option value="yKYW2rC9OCopd5PvOr1NxmbWSn0j92ynYu6KHD3rtPgLOBdEC8nPd1JTu+v6KcpnDpiV7Bb5jqVK9FyLwNivGA==">김탁곤</option>
							<option value="DkytN6pvvw00xcTD5wr5s4brP4AZCLQ44YBkeOaZqCWZ8t2fbDGurXf0NfUdGp0q65h3SG77EGcbeIWYL+2UBg==">정지은</option>
							<option value="yMtwjsm4kwxffnt9LJgoCNHn46j8Z8JCVVyQ/mv+aqmUpdersF3uPGP0ZBqDLl85+6VaCbfTBVSafuO+1ZHdXQ==">김민재</option>
							<option value="OlAFTe5A9dxT82Npqz9+6egaWVIJzbdVe8eQ2eFuvOcHxZx/k6DKescoyk7kMRlqHoIauTJnbmo3CjzlVLoAOA==">진지현</option>
							<option value="KgkCyqnaTLMfL76peGtJsfePKhm7vLAPeTuPboJ7/V5YhpMCbjGVQj7bLR0PqINHXhq8nMgFcZGA4U3fo/vj1w==">노지호</option>
							<option value="K6arDm2DqL5Z0EmBU3tcgQkh33E/V1NHSeuVSuMMXhef/PoCWVV6+e5u24MXIVaxBQsUj5n4iqqNWpNU1vBbYQ==">김유성</option>
						</select>
					</td>
				</tr>

				<tr>
					<th><label for="account_password">계좌 비밀번호＊</label></th>
					<td><input type="password" id="account_password" name="account_password" maxlength="4"
						placeholder="비밀번호 입력">
					</td>
				</tr>

				<tr>
					<th><label for="REaccount_password">계좌 비밀번호 확인＊</label></th>
					<td><input type="password" id="REaccount_password" name="REaccount_password" maxlength="4"
						placeholder="비밀번호 확인">
					</td>
				</tr>
				
				<!-- 
				<tr>
					<th><label for="member_name">고객이름＊</label></th>
					<td>
						<input type="text" id="member_name" class="member_name" name="member_name" placeholder="이름을 입력해주세요.">   
					</td>
				</tr>
 				 -->
 				 
				<tr>
					<th><label for="account_balance">계좌잔액＊</label></th>
					<td>
						<input type="number" id="account_balance" name="account_balance" min="0" value="0" style="width: 155px;"> 
					</td>
						
				</tr>
				
				<tr>
					<th><label for="account_type">계좌종류＊</label></th>
					<td><input type="number" id="account_type" name="account_type" min="0" max="1" value="1" style="width: 155px;"></td>
				</tr>
				
				<tr>
					<th><label for="account_state">계좌상태＊</label></th>
					<td><input type="number" id="account_state" name="account_state" min="0" max="1" value="1" style="width: 155px;"></td>
				</tr>

				<tr>
					<th><label for="account_stateContent">계좌상태설명</label></th>
					<td>
						<input type="text" id="account_stateContent" name="account_stateContent">
					</td>
				</tr>
				
				<tr>
					<th><label for="account_limit">일일한도</label></th>
					<td>
						<input type="number" id="account_limit" name="account_limit" min="0" value="0" style="width: 155px;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><br>
						<div class="complete_cancel" align="center">
							<input type="button"  id="submit" value="완료" onclick="testInsertData();">
							<input type="reset"	id="reset" value="취소">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
									</div>
								</div>  
							</div>
						</div>		
					</div>
					<!-- img 끝 -->
		
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp"/>
		<!-- End Sidebar -->
		
		</div>
		
	
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
	
	<script type="text/javascript" >
	function testInsertData() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		console.log("AJAX-ON");
		
		var queryString = $("form[name=testDataForm]").serialize();
		
		$.ajax({
			type : 'post',
			url : 'testAccountInsert',
			dataType : 'text',
			data : queryString,
			
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
			
		}).done(function(rsp) {
			console.log("요청 성공");
			console.log(rsp);
			var insertCnt = parseInt(rsp);
			
			if (insertCnt == 1) {
				alert("계좌 등록에 성공하였습니다.");
				location.reload();
			} else {
				alert("계좌 등록에 실패하였습니다.");
				return false;
			}
			
		}).fail(function() {
			alert("요청 실패");
		
		});
		
	}
	
	
	</script>

	
</body>
</html>