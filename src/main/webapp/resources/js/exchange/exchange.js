/**
 * 
 */

function exchangeVal(ex){
	var exchangeInto =$(ex).attr('attr-a');
	//exchangeInto = document.getElementById("exchange").val();
	console.log(exchangeInto);
	//$('select.exchange option[value=' + exchangeInto +']').attr('selected','selected');
	window.location='exchange.do?exchange=' + exchangeInto;
}

function change(){
	
}