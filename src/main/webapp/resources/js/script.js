/**
 * validation check
 */

// 에러메시지
var insertError = "회원가입에 실패하였습니다. \n확인 후 다시 시도하세요!!";
var updateError = "회원수정에 실패하였습니다. \n확인 후 다시 시도하세요!!";
var deleteError = "회원탈퇴에 실패하였습니다. \n확인 후 다시 시도하세요!!";
var passwordError = "입력하신 비밀번호가 일치하지 않습니다. \n확인 후 다시 시도하세요!!";
var sessionError = "로그아웃 되었습니다. \n확인 후 다시 시도하세요!!";


function errorAlert(errorMsg) {
	alert(errorMsg);
	window.history.back(); // 이전 페이지로 이동
}

//-- 회원가입 페이지
function signIncheck() {
	// 이름
	if(!document.registerform.name.value) {
		alert("이름을 입력하세요!!");
		document.registerform.name.focus();
		return false;
		
	// 생년월일
	} else if(!document.registerform.birth.value) {
		alert("생년월일을 입력하세요!!");
		document.registerform.birth.focus();
		return false;
		
	// 아이디
	} else if(!document.registerform.id.value) {
		alert("아이디를 입력하세요!!");
		document.registerform.id.focus();
		return false;
		
	// 비밀번호
	} else if(!document.registerform.password.value) {
		alert("비밀번호를 입력하세요!!");
		document.registerform.password.focus();
		return false;
		
	// 비밀번호 확인
	} else if(document.registerform.password.value != document.registerform.repassword.value) {
		alert("비밀번호가 일치하지않습니다!!");
		document.registerform.repassword.focus();
		return false;
		
	// 연락처
	} else if(!document.registerform.hp1.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.registerform.hp1.focus();
		return false;
	} else if(!document.registerform.hp2.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.registerform.hp2.focus();
		return false;
	} else if(!document.registerform.hp3.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.registerform.hp3.focus();
		return false;
		
	// 이메일
	} else if(!document.registerform.email1.value) {
		alert("이메일을 입력하세요!!");
		document.registerform.email1.focus();
		return false;
	// 이메일 형식
	} else if(!document.registerform.email2.value && document.registerform.email3.value == 0) {
		alert("이메일 형식에 일치하지 않습니다!!");
		document.registerform.email2.focus();
		return false;
	} else if(document.registerform.address_zipcode.value == "") {
		alert("주소를 입력 해주세요!!");
		document.registerform.address_zipcode.focus();
		return false;	
		
	// id 중복확인 버튼을 클릭하지 않는 경우
	// signIn.jsp - hiddenId : 중복확인 버튼 클릭 여부 체크(0:클릭 안함, 1:클릭함)
	} else if(document.registerform.hiddenId.value == 0) {
		alert("중복 확인을 해주세요!!");
		document.registerform.dupChk.focus();
		return false;
		
	} else if(document.registerform.access_token.value == "") {
		alert("본인 인증을 해주세요!!");
		document.registerform.pass.focus();
		return false;
	} else if(document.registerform.refresh_token.value == "") {
		alert("본인 인증을 해주세요!!");
		document.registerform.pass.focus();
		return false;
	} else if(document.registerform.user_seq_no.value == "") {
		alert("본인 인증을 해주세요!!");
		document.registerform.pass.focus();
		return false;
	}
	
	
}

// 아이디 중복확인 AJAX
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

// 로그인 페이지
function logcheck() {
	if(!document.loginform.id.value) {
		alert("아이디를 입력하세요!!");
		document.loginform.id.focus();
		return false;
	
	// 비밀번호
	} else if(!document.loginform.password.value) {
		alert("비밀번호를 입력하세요!!");
		document.loginform.password.focus();
		return false;
	}
}



//------------------------------------------------------------------------

function nextHp1() {
	if($("#hp1").val().length >= 3) {
		$("#hp2").focus();
	}
}

function nextHp2() {
	if($("#hp2").val().length >= 4) {
		$("#hp3").focus();
	}
}

function nextHp3() {
	if($("#hp3").val().length >= 4) {
		$("input[name=email1]").focus();
	}
}


//이메일 형식
function selectEmailChk() {
	if(document.registerform.email3.value != 0) {
		// 직접입력이 아닌경우 email3.value를 email2.value에 설정
		var email3 = document.registerform.email3.value;
		document.registerform.email2.value = email3;
	} else {
		// 직접입력 - email2 초기화
		document.registerform.email2.value = "";
		document.registerform.email2.focus();
	}
}

//-------------------------------------------------------------------------

function nextHp1_update() {
	if(document.updateform.hp1.value.length >= 3) {
		document.updateform.hp2.focus();
	} 
}

function nextHp2_update() {
	if(document.updateform.hp2.value.length >= 4) {
		document.updateform.hp3.focus();
	}
}

function nextHp3_update() {
	if(document.updateform.hp3.value.length >= 4) {
		document.updateform.email1.focus();
	}
}

//이메일 형식
function selectEmailChk_update() {
	if(document.updateform.email3.value != 0) {
		// 직접입력이 아닌경우 email3.value를 email2.value에 설정
		var email3 = document.registerform.email3.value;
		document.updateform.email2.value = email3;
	} else {
		// 직접입력 - email2 초기화
		document.updateform.email2.value = "";
		document.updateform.email2.focus();
	}
}

//------------------------------------------------------------------------


function confirmMe() {
	
	var popupX = (window.screen.width / 2) - (500 / 2); // 윈도우 픽셀 기준 X축 중간
	var popupY = (window.screen.height / 2) - (750 / 2); // 윈도우 픽셀 기준 Y축 중간
	var url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
    "response_type=code&"+
    "client_id=072579e4-c1b5-4ad1-a6a4-78c69cab659c&"+ 
    "redirect_uri=http://localhost/bank/customer/authResult.do&"+
    "scope=login inquiry transfer&"+
    "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&"+
    "auth_type=0";
	
	window.open(url, "about:blank", "menubar=no, width=550, height=750, left="+popupX +", top="+popupY);
  

}


// 회원 탈퇴
function deleteUser() {
	var popupX = (window.screen.width / 2) - (500 / 2);
	var popupY = (window.screen.height / 2) - (300 / 2);
	var url = "deleteUser.us";
	window.open(url, "deleteUser", "menubar=no, width=500, height=300, left="+popupX + ", top="+popupY);
}

// 회원 탈퇴 확인 처리
function deleteUserAction() {
	opener.window.parent.location = "deleteUserAction.us";
	self.close();
}

// 회원 수정 인증 페이지 비밀번호 체크
function passwordCheck() {
	if(!document.passwordform.password.value) {
		alert("비밀번호를 입력하세요!!");
		document.passwordform.password.focus();
		return false;
	}
}

//-- 회원수정 페이지
function updateCheck() {
	// 비밀번호
	if(!document.updateform.password.value) {
		alert("비밀번호를 입력하세요!!");
		document.updateform.password.focus();
		return false;
		
	// 비밀번호 변경
	} else if(document.updateform.password_change.value) {
		if(document.updateform.password_change.value != document.updateform.repassword_change.value) {
			alert("변경할 비밀번호가 일치하지않습니다!!");
			document.updateform.password_change.focus();
			return false;
	}
		
	// 연락처
	} else if(!document.updateform.hp1.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.updateform.hp1.focus();
		return false;
	} else if(!document.updateform.hp2.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.updateform.hp2.focus();
		return false;
	} else if(!document.updateform.hp3.value) {
		alert("휴대폰 번호를 입력하세요!!");
		document.updateform.hp3.focus();
		return false;
		
	// 이메일
	} else if(!document.updateform.email1.value) {
		alert("이메일을 입력하세요!!");
		document.updateform.email1.focus();
		return false;
	// 이메일 형식
	} else if(!document.updateform.email2.value && document.updateform.email3.value == 0) {
		alert("이메일 형식에 일치하지 않습니다!!");
		document.updateform.email2.focus();
		return false;
		
	}
}

// -------------------------------- 우편번호 ---------------------------------------------
/*
<input type="text" id="address_zipcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="address_addr1" placeholder="도로명주소">
<input type="text" id="address_addr2" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="address_addr3" placeholder="상세주소">
<input type="text" id="address_addr4" placeholder="참고항목">

address_zipcode 우편번호
address_addr1 도로명
address_addr2 지번주소
address_addr3 상세주소
address_addr4 참고항목

*/

//----------------------------------- 회원가입 우편번호 ------------------------------------------
function zipcodeFind() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address_zipcode').value = data.zonecode;
            document.getElementById("address_addr1").value = roadAddr;
            document.getElementById("address_addr2").value = data.jibunAddress;
        }
    }).open({
    	popupName:'postCode',
    });
}

//-----------------------------------------------------------------
// id 찾기/ pw 찾기 
function idFind() {
	if(!document.idFindForm.member_name.value) {
		alert("이름을 입력하세요!!");
		document.idFindForm.member_name.focus();
		return false;
	} else if(!document.idFindForm.member_email.value){
		alert("이메일을 입력하세요!!");
		document.idFindForm.member_email.focus();
		return false;
	} 
}

function pwFind() {
	if(!document.pwFindForm.member_name.value) {
		alert("이름을 입력하세요!!");
		document.pwFindForm.member_name.focus();
		return false;
	} else if(!document.pwFindForm.member_id.value){
		alert("아이디를 입력하세요!!");
		document.pwFindForm.member_id.focus();
		return false;
	} else if(!document.pwFindForm.member_email.value){
		alert("이메일을 입력하세요!!");
		document.pwFindForm.member_email.focus();
		return false;
	} 
}
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// 예금상품등록 유효성 체크
function depositProductInsertCheck() {
	if(!document.depositProductInsertForm.deposit_product_name.value) {
		alert("예금 상품 이름을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_name.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_summary.value) {
		alert("예금 상품 요약을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_summary.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_type.value) {
		alert("예금 종류를 선택해주세요!!");
		document.depositProductInsertForm.deposit_product_type.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_interRate.value) {
		alert("금리를 입력하세요!!");
		document.depositProductInsertForm.deposit_product_interRate.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_maxDate.value) {
		alert("최대 예금 기간을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_maxDate.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_minDate.value) {
		alert("최소 예금 기간을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_minDate.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_minPrice.value) {
		alert("최소 예치 금액을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_minPrice.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_explanation.value) {
		alert("예금 설명을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_explanation.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_notice.value) {
		alert("유의 사항을 입력하세요!!");
		document.depositProductInsertForm.deposit_product_notice.focus();
		return false;
	} else if(!document.depositProductInsertForm.deposit_product_bankCode.value) {
		alert("은행코드를 선택하세요!!");
		document.depositProductInsertForm.deposit_product_bankCode.focus();
		return false;
	}
	
}


//-----------------------------------------------------------------

//민재-----------------------------------------------------------------
//예금
function depositList() {
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var select = $("#selectBank").val();
		
		$.ajax({
			url : 'myDepositSubList.do',
			type : 'POST',
			data : {"select" : select},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			
			success : function(data){
				$('.selectTable').html(data);
			}
		});
}

//적금
function savingList() {
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var select = $("#selectBank").val();
		
		$.ajax({
			url : 'mySavingSubList.do',
			type : 'POST',
			data : {"select" : select},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			
			success : function(data){
				$('.selectTable').html(data);
			}
		});
}


//-----------------------------------------------------------------
