/*
// 계좌 비밀번호 확인
function account_confirmPwd(){
	if(!document.transferform.account_password.value){
		alert("계좌 비밀번호를 입력하세요");
		document.transferform.account_password.focus();
		return false;
	}
	
	var url = "account_confirm?account_password=" + document.transferform.account_password.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

function account_confirmPwdFocus(){
	document.confirmform.account_password.focus();
}

function confirmPwdCheck(){
	if(!document.confirmform.account_password.value){
		alert("계좌 비밀번호를 입력하세요");
		document.confirmform.account_password.focus();
		return false;
	}
}
*/



// 이체시 필요한 정보 입력
function transferCheck() {

	// 입금계좌번호
	if (!document.transferform.transfer_senderAccount.value) {
		alert("입금할 계좌번호를 입력하세요");
		document.transferform.transfer_senderAccount.focus();
		return false;

		// 이체 금액
	} else if (!document.transferform.transfer_money.value) {
		alert("입금할 금액을 입력하세요");
		document.transferform.transfer_money.focus();
		return false;
	}
	return true;
}

// 이체 금액 버튼 누를시 해당 금액 추가
function addPrice() {
	const resultElement = document.getElementById('transfer_money');

	let number = resultElement.innerText;

	if (document.transferform.transfer_money.value === '10000') {
		number = parseInt(number) + 10000;
	} else if (document.transferform.transfer_money.value === '30000') {
		number = parseInt(number) + 30000;
	} else if (document.transferform.transfer_money.value === '50000') {
		number = parseInt(number) + 50000;
	} else if (document.transferform.transfer_money.value === '100000') {
		number = parseInt(number) + 100000;
	} else if (document.transferform.transfer_money.value === '500000') {
		number = parseInt(number) + 500000;
	} else if (document.transferform.transfer_money.value === '1000000') {
		number = parseInt(number) + 1000000;
	}

	resultElement.innerText = number;
}
