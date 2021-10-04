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



//-- 예금 가입 페이지
function joinInCheck() {
//	var currentMonth = $("#currentMonth").val().replaceAll('-','');
//	var account_limit = $("#account_limit").val();
//	var sysdate = convertDateFormat(new Date());
//	
//	console.log('currentMonth', currentMonth);
	
	var account_balance =$("#account_balance").val();
	
	if(!document.depositProductForm.term.value){
		alert("예치 기간을 다시 확인해주세요");
		document.depositProductForm.term.focus();
		return false;
	// 한도금액
	}else if(!document.depositProductForm.account_balance.value){
		alert("예치 금액을 입력해주세요");
		document.depositProductForm.account_balance.focus();
		return false;
	// 비밀번호
	} else if(!document.depositProductForm.account_password.value) {
		alert("비밀번호를 입력하세요!!");
		document.depositProductForm.account_password.focus();
		return false;
		
	// 비밀번호 확인
	} else if(document.depositProductForm.account_password.value != document.depositProductForm.REaccount_password.value) {
		alert("비밀번호가 일치하지않습니다!!");
		document.depositProductForm.REaccount_password.focus();
		return false;
	}
	
}
//irpProductionJoin 값 check

function irpJoinInCheck(){

var sysdate = convertDateFormat(new Date());
	
	if(!document.irpProductForm.account_balance.value){
		alert("연금 금액을 입력해주세요");
		document.irpProductForm.account_balance.focus();
		return false;
	// 비밀번호
	} else if(!document.irpProductForm.account_password.value) {
		alert("비밀번호를 입력하세요!!");
		document.irpProductForm.account_password.focus();
		return false;
	// 비밀번호 확인
	} else if(document.irpProductForm.account_password.value != document.irpProductForm.REaccount_password.value) {
		alert("비밀번호가 일치하지않습니다!!");
		document.irpProductForm.REaccount_password.focus();
		return false;
	}
}



function convertDateFormat(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    
    month = month >= 10 ? month : '0' + month;
    
    var day = date.getDate();
    
    day = day >= 10 ? day : '0' + day;
    
    return [year, month, day].join('');
}
