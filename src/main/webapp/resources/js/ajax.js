/**
 * 
 */

// -- 계좌연동
function accountConnectConfirm(bankcode) {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var account_bankCode = $("#account_bankCode"+bankcode).val();
	console.log("account_bankCode : " + account_bankCode);
	
	var bankName = "";
	switch(bankcode) {
		case 1 : bankName="국민은행";
			break;
		case 2 : bankName="우리은행";
			break;
		case 3 : bankName="농협은행";
			break;
		case 4 : bankName="신한은행";
			break;
		case 5 : bankName="하나은행";
			break;
		default : bankName="코스모뱅크";
			break;
	}
	
	swal({
		// Confirm 제목
		title: bankName + '을 연동 하시겠습니까?',
		// Confirm 내용
		text: "다시 연동해제할 수 있습니다!",
		// 아이콘 type
		type: 'info',
		buttons:{
			// 수락 버튼
			confirm: {
				text : '네, 연동을 진행하겠습니다!',
				className : 'btn btn-success'
			},
			// 취소 버튼
			cancel: {
				visible: true,
				text : '아니오, 취소하겠습니다!',
				className: 'btn btn-danger'
			}
		}
	// 버튼을 누른 후 로직
	}).then((check) => {
		// 수락을 눌렀을 때
		if (check) {
			$.ajax({
				url : "accountConnectAction",
				data:  {"account_bankCode":account_bankCode},
				type: "post",
				dataType: 'json',
				
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				dataSrc: '',
				success : function(result) {
					console.log("요청 성공");
					console.log("성공여부 : " + result);
					if (result > 0) {
							// 1 : 연동완료
							swal("계좌 연동에 성공하였습니다!", "아래 버튼을 클릭해주세요!", {
								icon : "success",
								buttons: {
									confirm: {
										className : 'btn btn-success'
									}
								},
							});
							setTimeout(function() {
								window.location = "accountConnect";
							}, 1000);
						} else {
							// 0 : 연동실패
							swal("계좌 연동에 실패하였습니다!", "아래 버튼을 클릭해주세요!", {
								icon : "error",
								buttons: {
									confirm: {
										className : 'btn btn-danger'
									}
								},
							});
							setTimeout(function() {
								window.location = "accountConnect";
							}, 1000);
							
						} 
					
					}, error : function() {console.log("요청 실패");}
				});
		
		// 취소하였을 때
		} else {
			swal("취소하였습니다!", {
				buttons : {
					confirm : {
						className: 'btn btn-success'
					}
				}
			});
			// 취소 로직처리
			
		}
	});
	
		
}



//-- 계좌연동해제
function accountDisConnectConfirm(bankcode) {
	
	var bankName = "";
	switch(bankcode) {
		case 1 : bankName="국민은행";
			break;
		case 2 : bankName="우리은행";
			break;
		case 3 : bankName="농협은행";
			break;
		case 4 : bankName="신한은행";
			break;
		case 5 : bankName="하나은행";
			break;
		default : bankName="코스모뱅크";
			break;
	}
	
	swal({
		// Confirm 제목
		title: bankName + '을 연동해제 하시겠습니까?',
		// Confirm 내용
		text: "다시 연동할 수 있습니다!",
		// 아이콘 type
		type: 'warning',
		buttons:{
			
			// 수락 버튼
			confirm: {
				text : '네, 연동해제를 진행하겠습니다!',
				className : 'btn btn-success'
			},
			// 취소 버튼
			cancel: {
				visible: true,
				text : '아니오, 취소하겠습니다!',
				className: 'btn btn-danger'
			}
			
		}
	// 버튼을 누른 후 로직
	}).then((check) => {
		// 수락을 눌렀을 때
		if (check) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var account_bankCode = $("#account_bankCode"+bankcode).val();
			console.log("account_bankCode : " + account_bankCode);
			$.ajax({
				url : "accountDisConnectAction",
				data:  {"account_bankCode":account_bankCode},
				type: "post",
				dataType: 'json',
				
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				dataSrc: '',
				success : function(result) {
					console.log("요청 성공");
					console.log("성공여부 : " + result);
					if (result > 0) {
							// 1 : 연동완료
							swal("계좌 연동해제에 성공하였습니다!", "아래 버튼을 클릭해주세요!", {
								icon : "success",
								buttons: {
									confirm: {
										className : 'btn btn-success'
									}
								},
							});
							setTimeout(function() {
								window.location = "accountConnectedList";
							}, 1000);
						} else {
							// 0 : 연동실패
							swal("계좌 연동해제에 실패하였습니다!", "아래 버튼을 클릭해주세요!", {
								icon : "error",
								buttons: {
									confirm: {
										className : 'btn btn-danger'
									}
								},
							});
							setTimeout(function() {
								window.location = "accountConnectedList";
							}, 1000);
							
						} 
					
					}, error : function() {console.log("요청 실패");}
				});
		
		// 취소하였을 때
		} else {
			swal("취소하였습니다!", {
				buttons : {
					confirm : {
						className: 'btn btn-success'
					}
				}
			});
			// 취소 로직처리
			
		}
	});
}
