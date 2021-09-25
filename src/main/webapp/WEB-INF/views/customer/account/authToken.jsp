<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">

<title>인증</title>
</head>
<body>
	
	((성공))
	<div id="result">
		
	</div>
	
	<script>
		// 데이터를 String 형식으로 받아온다.
		var json = JSON.stringify(${json});
		
		console.log(json);
		
		// String 으로 받아온 데이터를 json 으로 변환한다.
		var obj = JSON.parse(json);
		
		$("div#result").html(obj.rsp_code);
		
		if(obj.rsp_code) {
			alert("인증 요청이 거부되었습니다.");
			window.close();
		} else {
			alert("인증요청성공");
			window.opener.document.registerform.access_token.value = obj.access_token;
			window.opener.document.registerform.refresh_token.value = obj.refresh_token;
			window.opener.document.registerform.user_seq_no.value = obj.user_seq_no;
			window.close();
		}
		
		
		
		
	</script>

</body>
</html>