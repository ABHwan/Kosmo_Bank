/**
 * 
 */

// -- 계좌연동
function accountConnectConfirm(bankcode) {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
<<<<<<< HEAD
	var access_token;
	$.ajax({
		type : 'POST',
		url : 'getToken.do',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		}
		
	 }).done(function(rsp) {
	 		// 이후 Business Logic 처리하시면 됩니다.
	 		console.log(rsp.response.token);
	 		access_token = rsp.response.token;
	 });
	
	IMP.certification({
	    merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
	}, function(rsp) {
	    if ( rsp.success ) {
	    	 // 인증성공
	        console.log(rsp.imp_uid);
	        console.log(rsp.merchant_uid);
	        console.log(token);
	        var imp_uid = rsp.imp_uid;
	        $.ajax({
					type : 'get',
					url : 'certifications.do',
					dataType : 'json',
					data : {
						"imp_uid" : imp_uid,
						"access_token" : access_token
					},
					
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					}
					
			 }).done(function(rsp) {
			 		// 이후 Business Logic 처리하시면 됩니다.
			 		console.log(rsp.response);
			 		
			 		var info = rsp.response;
			 		
			 		
			 		var unique_key = info.unique_key;
			 		
			 		// 명의 중복확인
			 		$.ajax({
						type : 'post',
						url : 'duplicate.do',
						dataType : 'text',
						data : {
							"unique_key" : unique_key
						},
						
						beforeSend : function(xhr){
							xhr.setRequestHeader(header, token);
						}
						
					}).done(function(rsp) {
						console.log("요청 성공");
						console.log(rsp);
						var duplicate = parseInt(rsp);
						
						if (duplicate == 0) {
							document.registerform.userName.value = info.name;
					 		document.registerform.userBirth.value = info.birthday;
					 		document.registerform.hp.value = info.phone;
					 		document.registerform.unique_key.value = info.unique_key;
					 		
					 		$("#pass").val("본인인증완료");
					 		$("#pass").attr("diabled", true);
					 		$("#pass").css("color", "black");
					 		
=======
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
>>>>>>> 234a5f596bf320ae67ba0884bf9dac3bb1082ffb
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
					
<<<<<<< HEAD
					})
			 		
			 });
	        	
	    } else {
	    	 // 인증취소 또는 인증실패
	        var msg = '인증에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
}
// 본인인증 ajax 끝

//아이디 중복확인 AJAX
function confirmId() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var member_id = $("#userId").val();
	console.log("member_id : " + member_id);
	setTimeout(function() {
	$.ajax({
		url : "confirmId.do",
		data:  {"member_id":member_id},
		type: "post",
		dataType: 'json',
		
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
=======
					}, error : function() {console.log("요청 실패");}
				});
>>>>>>> 234a5f596bf320ae67ba0884bf9dac3bb1082ffb
		
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
<<<<<<< HEAD
// -- 회원가입이메일인증

=======
>>>>>>> 234a5f596bf320ae67ba0884bf9dac3bb1082ffb
