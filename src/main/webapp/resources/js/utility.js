

// 에러메시지
var updateError = "납부 실패하였습니다. \n 확인 후 다시 시도하세요";
var lackBalance = "금액이 부족합니다. \n 다시한번 확인해주세요";


function errorAlert(errorMsg) {
	alert(errorMsg);
	window.history.back(); // 이전 페이지로 이동
}

function apt_summit(utility_num){
	var $aptList = $('tr.apt_item' + utility_num);
	var account_id = $aptList.find('select[name="account_id"]')[0].value;	//find = 하위선택자(tr 안)
	var utility_money = $aptList.find('input[name="utility_money"]').val();
	//alert(utility_money);
	//alert(utility_num);
	//alert(account_id);
	
	window.location.href = 'account_pwdConfirm?account_id='+ account_id +'&utility_num=' + utility_num + '&utility_money=' + utility_money;
}

function tuition_summit(utility_num){
	var $tuitionList = $('tr.tuition_item' + utility_num);
	var account_id = $tuitionList.find('select[name="account_id"]')[0].value;	//find = 하위선택자(tr 안)
	var utility_money = $tuitionList.find('input[name="utility_money"]').val();
	
	window.location.href = 'account_pwdConfirm?account_id='+ account_id +'&utility_num=' + utility_num + '&utility_money=' + utility_money;
}

function local_summit(utility_num){
	var $localList = $('tr.local_item' + utility_num);
	var account_id = $localList.find('select[name="account_id"]')[0].value;	//find = 하위선택자(tr 안)
	var utility_money = $localList.find('input[name="utility_money"]').val();
	
	window.location.href = 'account_pwdConfirm?account_id='+ account_id +'&utility_num=' + utility_num + '&utility_money=' + utility_money;
}

