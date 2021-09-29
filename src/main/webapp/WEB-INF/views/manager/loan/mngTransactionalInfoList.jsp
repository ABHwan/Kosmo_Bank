<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모 뱅크</title>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<script type="text/javascript">
	function takeTrans() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var member_name = $("#member_name").val();
		var fintech_use_num = "";
		setTimeout(function() {
			$.ajax({
				url : "transList.do",
				data:  {"member_name":member_name},
				type: "post",
				dataType: 'json',
				
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				
				success : function(json_data) {
					console.log("성공");
					var json = JSON.stringify(json_data);
					console.log(json);
						
					// String 으로 받아온 데이터를 json 으로 변환한다.
					var obj = JSON.parse(json);
					
					if(obj.rsp_code) {
						alert("핀테크 요청이 거부되었습니다.");
					} else {
						alert("핀테크 요청 성공");
						fintech_use_num = obj.fintech_use_num;
					 	setTimeout(function() {
							$.ajax({
								url: "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num",
								data: {"bank_tran_id":"M202113198U4BC34239Z"},
										{"fintech_use_num":fintech_use_num}, 
										{"inquiry_type":"A"}, 
										{"inquiry_base":"D"}, 
										{"from_date":"20200101"},
										{"to_date":"20210922"}, 
										{"sort_order":"D"}
										{"tran_dtime":"20210922110000"},
								headers: {"Authorization":${header}}
								type: "get",
								dataType: 'json',
								
								beforeSend : function(xhr){
									xhr.setRequestHeader(header, token);
								},
								
								success : function(json_data) {
									console.log("성공");
									var trans = JSON.stringify(json_data);
									console.log(trans);
										
									// String 으로 받아온 데이터를 json 으로 변환한다.
									var obj2 = JSON.parse(trans);
									
									if(obj2.rsp_code) {
										alert("거래내역 요청이 거부되었습니다.");
									} else {
										alert("거래내역 요청 성공");
										for(let i = 0; i < obj2.res_list.length; i++) {
											var tblHtml = "<tr>" +
												"<td>" + obj2.res_list[i]['tran_date'] + "</td>" +
												"<td>" + obj2.res_list[i]['tran_time'] + "</td>" +
												"<td>" + obj2.res_list[i]['inout_type'] + "</td>" +
												"<td>" + obj2.res_list[i]['tran_type'] + "</td>" +
												"<td>" + obj2.res_list[i]['printed_content'] + "</td>" +
												"<td>" + obj2.res_list[i]['tran_amt'] + "</td>" +
												"<td>" + obj2.res_list[i]['after_balance_amt'] + "</td>" +
												"<td>" + obj2.res_list[i]['branch_name'] + "</td>" +
											"</tr>";
											$("#printList").append(tblHtml);
										}
										
									} 
								}, error : function() {console.log("실패");}
							});
						}, 10);
					}
				}, error : function() {console.log("실패");}
			});
		}, 10); 
	}
	/*
	function takeTrans() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var userNum = $("#userNum").html();
	var accToken = $("#userNum").val(); 
	alert(userNum + " , " + accToken);
	var header2 = "Bearer" + accToken;
	console.log("userNum : " + userNum);
	setTimeout(function() {
		$.ajax({
			url : "https://developers.kftc.or.kr/proxy/user/me",
			data:  {"userNum":userNum},
			headers: {"Authorization":header2},
			type: "get",
			dataType: 'json',
			
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			
			success : function(json_data) {
				console.log("성공");
				var json = JSON.stringify(json_data);
				console.log(json);
					
				// String 으로 받아온 데이터를 json 으로 변환한다.
				var obj = JSON.parse(json);
				
				if(obj.rsp_code) {
					alert("핀테크 요청이 거부되었습니다.");
				} else {
					alert("핀테크 요청 성공");
					window.document.finform.fin.value = obj.fintech_use_num;
				}
			}, error : function() {console.log("실패");}
		});
	}, 10); 
}
function getTrans() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var target = $("#fin").val();

	console.log("fin : " + fin);
	setTimeout(function() {
		$.ajax({
			url : "https://developers.kftc.or.kr/proxy/account/transaction_list/fin_num",
			data: {"bank_tran_id":"T991613380U4BC142326%20%28%EB%B3%B8%20%ED%99%94%EB%A9%B4%EC%97%90%EC%84%9C%EB%8A%94%20%EC%9E%90%EB%8F%99%EC%B1%84%EB%B2%88%29"}, 
					{"fintech_use_num":target}, {"inquiry_type":"A"}, 
					{"inquiry_base":"D"}, {"to_date":"20210922"}, 
					{"tran_dtime":"20210922110000"},
			type: "post",
			dataType: 'json',
			
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			
			success : function(json_data) {
				console.log("성공");
				var trans = JSON.stringify(json_data);
				console.log(trans);
					
				// String 으로 받아온 데이터를 json 으로 변환한다.
				var obj2 = JSON.parse(trans);
				
				if(obj2.rsp_code) {
					alert("거래내역 요청이 거부되었습니다.");
				} else {
					alert("거래내역 요청 성공");
					for(let i = 0; i < obj2.res_list.length; i++) {
						var tblHtml = "<tr>" +
							"<td>" + obj2.res_list[i]['tran_date'] + "</td>" +
							"<td>" + obj2.res_list[i]['tran_time'] + "</td>" +
							"<td>" + obj2.res_list[i]['inout_type'] + "</td>" +
							"<td>" + obj2.res_list[i]['tran_type'] + "</td>" +
							"<td>" + obj2.res_list[i]['printed_content'] + "</td>" +
							"<td>" + obj2.res_list[i]['tran_amt'] + "</td>" +
							"<td>" + obj2.res_list[i]['after_balance_amt'] + "</td>" +
							"<td>" + obj2.res_list[i]['branch_name'] + "</td>" +
						"</tr>";
						$("#printList").append(tblHtml);
					}
					
				} 
			}, error : function() {console.log("실패");}
		});
	}, 10);
}*/
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">계좌 거래내역 관리</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">거래내역 조회&emsp;
										<select id="member_name" onchange="takeTrans();">
											<c:forEach var="i" items="${userList}">
												<option value="${i.member_name}">${i.member_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="card-body">
									<sec:csrfInput />
									<table class="table table-hover card-table">
										<thead>
											<tr>
												<th scope="col">거래일</th>
												<th scope="col">거래시간</th>
												<th scope="col">입/출금</th>
												<th scope="col">거래유형</th>
												<th scope="col">통장식별내용</th>
												<th scope="col">거래금액</th>
												<th scope="col">거래후잔액</th>
												<th scope="col">거래점명</th>
											</tr>
										</thead>
										<tbody id="printList">
											<%-- <c:forEach var="t" items="trans">
											<tr>
												<td>${t.tran_date}</td>
												<td>${t.tran_time}</td>
												<td>${t.inout_type}</td>
												<td>${t.tran_type}</td>
												<td>${t.print_content}</td>
												<td>${t.tran_amt}&nbsp;원</td>
												<td>${t.after_balance_amt}&nbsp;원</td>
												<td>${t.branch_name}</td>
											</tr>
											</c:forEach> --%>
										</tbody>
									</table>
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
	
</body>
</html>