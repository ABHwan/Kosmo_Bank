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
function joinInCheck() {
	var currentMonth = $("#currentMonth").val().replaceAll('-','');
	var account_limit = $("#account_limit").val();
	var date03 = convertDateFormat(new Date());
	
	console.log('currentMonth', currentMonth);
	if(!account_limit){
		alert("가입금액을 입력하세요");
		return false;
	}
	
	if(date03 > currentMonth){
		alert("가입기간을 다시 확인해주세요");
		return false;
		
	}
	return true;
}


function convertDateFormat(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    
    month = month >= 10 ? month : '0' + month;
    
    var day = date.getDate();
    
    day = day >= 10 ? day : '0' + day;
    
    return [year, month, day].join('');
}
