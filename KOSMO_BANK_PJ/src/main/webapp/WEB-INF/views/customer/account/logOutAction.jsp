<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리 페이지</title>
</head>
<body>
    <%
    	
	    //session 초기화
	    session.invalidate();
	    
	    //로그인 관련 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if(cookies!=null){
	        for(Cookie tempCookie : cookies){
	            if(tempCookie.getName().equals("userID")){
	                tempCookie.setMaxAge(0);
	                tempCookie.setPath("/");
	                response.addCookie(tempCookie);
	                
	            } else if(tempCookie.getName().equals("adminID")){
	                tempCookie.setMaxAge(0);
	                tempCookie.setPath("/");
	                response.addCookie(tempCookie);
	            }
	        }
	    }
	%>
	
	
    <script>
        alert("정상적으로 로그아웃 되었습니다.");
        window.location = 'index.do';
    </script>
    
</body>
</html>