/**
 * 
 */


// 본인인증 ajax
function confirm() {
	IMP.init('iamport');
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
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
					 		
						} else {
							alert("이미 가입된 계정이 존재합니다.");
							return false;
						}
						
					}).fail(function() {
						alert("요청 실패");
					
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
		
		success : function(data) {
			console.log("성공");
			$("#id_check").text("");
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#userId").css("border-color", "red");
					
					$("input[name=hiddenId]").val(0);
					console.log($("input[name=hiddenId]").val());
					
				} else {
					// 0 : 사용가능
					$("#id_check").text("사용 가능한 아이디입니다.");
					$("#id_check").css("color","green");
					$("#userId").css("border-color", "#d7d7d7");
					$("input[name=hiddenId]").val(1);
					console.log($("input[name=hiddenId]").val());
					
					// input 입력 값 없을 시  id_check 초기화
					if(member_id == "") {
						$("#id_check").text("");
					}
				} 
			
			}, error : function() {console.log("실패");}
		});
	}, 10);
}

//회원가입 이메일 인증
function emailChk() {
	
	console.log("emailChk - ON");
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var dice;
	var sss;
	var click=0;
	var userEmail;
	var counter;
	
	$('#mail1').click(function() {
		$("#dice").val('');
		
		userEmail1 = $("input[name=email1").val();
		userEmail2 = $("input[name=email2").val();
		userEmail = userEmail1 + "@" + userEmail2;
		console.log("이메일 : " + userEmail);
		// var idJ = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(userEmail1 == ""){
			alert("형식에 맞게 이메일을 입력해 주세요!");
			return;
		} else if(userEmail2 == "") {
			alert("형식에 맞게 이메일을 입력해 주세요!");
			return;
		}
		click++;
		$('#dice_check').css('display','');
		
		if(click>=1){
			$("#mail1").css('display','none').css('margin-top','0px').css('border','1px solid').css('cursor','pointer')
			$("#mail2").css('display','')
			$("#dice_check1").css('display','');
			
		}
		
		var stop = false;
		var mm=5;
		var ss=59;
		// 인증번호 카운터
		counter = setInterval(function(){
			if(!stop){
			var time_text =  mm+':'+ss+'초';
			$("#dice_check").text(time_text);
			$("#dice_check").css('color','red').css('display','inline-block');
			$("input[name=counter]").val(1);
			ss--;
			if(ss==-1){
				if(mm < 1){
					mm=0;
					if(ss<0){
						clearInterval(counter);
						$("#dice_check").text('');
						$("#dice_check1").css('display','none');
						
						$("#mail1").css('display','').css('margin-top','0px').css('border','1px solid').css('cursor','pointer');
						$("#mail2").css('display','none');
					}
				}
				else{mm--;}
				ss=10;
			}
			if(ss<=9){
				ss = '0'+ss;
			}
			}
			else{
				clearInterval(counter);
			}
		},1000);
		
		$.ajax({
			url : "usermailCheck.do",
			type: "POST",
			data:  {"userEmail":userEmail},
			dataType: 'json',
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				dice = data.dice;
			}, error : function() {console.log("실패");}		
		})
		
		
		// 다시 보내기 버튼
		$('#mail2').click(function() {
			
			mm=5;
			ss=59;
			
			userEmail1 = $("input[name=email1").val();
			userEmail2 = $("input[name=email2").val();
			userEmail = userEmail1 + "@" + userEmail2;
			console.log("이메일 : "+userEmail);
			
			$("input[name=emailChk]").val(0);
			$("#dice").val('');
			
			
			$.ajax({
				url : "usermailCheck.do",
				type: "POST",
				data:  {"userEmail":userEmail},
				dataType: 'json',
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					dice = data.dice;				
				}, error : function() {console.log("실패");}		
			})
			
		})
	});


	var suc;
	$("#btn_dice").click(function(){
		console.log("인증번호 확인버튼 누름");
		if(dice==$("#dice").val()){
			alert('성공');
			clearInterval(counter);
			suc =1;
			$("#dice_check").html("") ;
			//$("#dice_check").css("color","green");
			$("#dice_check1").css('display','none');
			$("#mail2").html("인증완료");
			// pointer-events - none : a 태그 클릭 비활성화
			$("#mail2").css("pointer-events", "none").css("color", "green");
			
			$("#dice").css('display','none');
			$("#btn_dice").css('display','none');
			$("input[name=emailChk]").val("1");
			console.log("이메일인증" + $("input[name=emailChk]").val());
			mm=0;
			ss=0;
			
		}
		else{
			alert('인증번호를 확인해주세요');
		}
	});

}
// -- 회원가입이메일인증




