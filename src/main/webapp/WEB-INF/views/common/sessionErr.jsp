<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${rePath}js/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<title>세션중복 처리 페이지</title>
</head>
<body>
    <%
    	
	    //session 초기화
	    session.invalidate();
	    
	    //로그인 관련 쿠키 삭제
	    Cookie[] cookies = request.getCookies();
	    if(cookies!=null){
	        for(Cookie tempCookie : cookies){
	            if(tempCookie.getName().equals("customerID")){
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
        swal({
        	title : "중복로그인 시도가 감지되어 로그아웃됩니다!",
        	text : "본인이 아니라면 주의하세요!",
        	icon : "error",
        	buttons: {
        		confirm: {
        			className : 'btn btn-danger'
        			
        		}
        	},
        }).then((result) => {
        	if(result){
        		setTimeout(function() {
        			window.location = "index.do";
        		}, 1000);
        	}
        });
        
        
    </script>
    
</body>
</html>