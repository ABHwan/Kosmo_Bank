<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- 3초가 지나면 해당 url 즉 home으로 이동 -->
<meta http-equiv="refresh" content="3, ${path}">
<title>Insert title here</title>
</head>
<body>
	<h3> 관리자 페이지 </h3><br><br>
	<p> ${errMsg }</p>
</body>
</html>