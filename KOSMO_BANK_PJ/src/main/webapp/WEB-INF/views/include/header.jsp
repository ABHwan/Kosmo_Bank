<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://kit.fontawesome.com/4cf0600331.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${rePath }css/common/header.css">
</head>
<body>
	<!-------------------- header 시작 ------------------>
	
	<%
	    Cookie[] cookies = request.getCookies();
	    if(cookies != null){
	        for(Cookie tempCookie : cookies){
	        	// 쿠키에 userID란 문자열이 있으면
	            if(tempCookie.getName().equals("userID")){
	                //쿠키값으로 대신 로그인 처리함
	                session.setAttribute("userID", tempCookie.getValue());
	                
	            // 쿠키에 adminID란 문자열이 있으면
	            } else if(tempCookie.getName().equals("adminID")){
	                //쿠키값으로 대신 로그인 처리함
	                session.setAttribute("adminID", tempCookie.getValue());
	            }
	        }
	    }
	%>
	
	<div class="div_upper">
		<div>
			<ul class="div_icons">
				<c:choose>
					<c:when test="${sessionScope.adminID != null}">
						<li><i class="fas fa-user-circle"></i></li>
						<li><span>${sessionScope.adminID}</span>님 환영합니다.</li>
						<li><a href="${path}manager/mngPage">관리자페이지</a></li>
						<li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
					</c:when>
					<c:when test="${sessionScope.userID == null}">
						<li><i class="fas fa-user-circle"></i></li>
						<li><a href="login">로그인</a></li>
						<li><a href="register.do">회원가입</a></li>
						<c:if test="${sessionScope.userID == null}">
							<li><a href="loginform">마이페이지</a></li>
						</c:if>
						<c:if test="${sessionScope.userID != null}">
							<li><a href="myPage">마이페이지</a></li>
						</c:if>
					</c:when>
					
					<c:otherwise>
						<li><i class="fas fa-user-circle"></i></li>
						<li><span>${sessionScope.Username}  ${sessionScope.userID}</span>님 환영합니다.</li>
						<li><a href="cart">장바구니</a></li>
						<li><a href="myPage">마이페이지</a></li>
						<li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<form id="logout" action="logout" method="POST">
   		<sec:csrfInput />
	</form>
	<header class="header_nav">
	<hr width="100%">
		<div class="navbar_div_wrap">
			<div class="navbar_wrap">
				<nav class="navbar">
					
					<div class="navbar_logo">
						<!-- <i class="fas fa-bolt"></i> -->
						<img src="${rePath }images/logo.jpg" width="32px" height="32px">
						<a href="${path }customer/index.do">Electro Mart</a>
					</div>
					<div class="new_search_box">
						<form action="productSearch.do" method="post" class="searchform" name="searchform">
						<sec:csrfInput/>
							<input type="search" class="search" id="search" name="search">
							<!-- //검색 -->
	                        <input type="submit" title="검색" class="btn_search" value="검색">
                        </form>
					</div>
					
					<a href="#" class="navbar_toggleBtn">
						<i class="fas fa-list"></i>
					</a>
					
				</nav>
			</div>
		</div>
	<hr style="border-bottom-width: 0px; margin-bottom:0px;">
	</header>
	
	<!---------------- header 끝 ------------------->
</body>
</html>