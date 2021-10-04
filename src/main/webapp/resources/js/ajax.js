/**
 * 
 */

// -- 계좌연동
function accountConnect(bankcode) {
	
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
	
	if(confirm(bankName + '을 연동하시겠습니까?')) {
		$.ajax({
			url : "accountConnectAction",
			data:  {"account_bankCode":account_bankCode},
			type: "post",
			dataType: 'json',
			
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			
			success : function(data) {
				console.log("요청 성공");
				if (data == 1) {
						// 1 : 연동완료
						alert("계좌 연동에 성공하였습니다!");
						setTimeout(function() {
							window.location = "accountConnect";
						}, 1000);
					} else {
						// 0 : 연동실패
						alert("계좌 연동에 실패하였습니다!");
						
					} 
				
				}, error : function() {console.log("요청 실패");}
			});
		}
}

