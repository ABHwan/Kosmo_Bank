<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${rePath }css/user/login.css"/>
<script src="https://kit.fontawesome.com/4cf0600331.js" crossorigin="anonymous"></script>
<title>고객 로그인폼</title>
</head>
<body>

	<div class="main_container">
		<div class="main_div">
			<header>
				<div class="navbar_logo">
					<a href="${path}customer/index.do">
						<img src="${rePath}images/img/kosmobanklogo2.png">
					</a>
				</div>
			</header>
			
			<form action="loginAction.do" name="loginform" method="post" onsubmit="return logcheck();">
			<sec:csrfInput />
				<section class="login_input_section">
					<div class="login_state">
						<p class="tx_sub">
							<c:choose>
								<c:when test="${selectCnt == 0}">
									<script type="text/javascript">
										alert("로그인에 실패하였습니다. \n확인 후 다시 시도하세요!!");
										window.location="login.do";
									</script>
								</c:when>
								<c:when test="${selectCnt == 1}">
									<script type="text/javascript">
										alert("회원가입이 완료되었습니다. 로그인해주세요!");
									</script>
									회원가입을 축하합니다. 로그인하세요!!
								</c:when>
								<c:when test="${selectCnt == 3}">
									<script type="text/javascript">
										alert("로그인 성공");
										window.location="index.do";
									</script>
								</c:when>
								<c:when test="${selectCnt == 4}">
									<script type="text/javascript">
											alert("이메일 인증이 완료되지 않았습니다. \n확인 후 다시 시도하세요!!");
									</script>
								</c:when>
								<c:when test="${sessionScope.adminID != null || sessionScope.customerID != null}">
									<script>
										window.location="${custPath}index.do";
									</script>
								</c:when>
								<c:otherwise>
									환영합니다!!
								</c:otherwise>
							</c:choose>
						</p>
					</div>
					
					
					<%
						//쿠키가져오기
						Cookie[] cookies = request.getCookies();
						if(cookies != null){
						    for(Cookie tempCookie : cookies){
						        if(tempCookie.getName().equals("customerID")){
						            //실행흐름이 서버에 있을때 서버코드로써 강제이동한다.
						            //특정 page로 이동하라는 정보만 준다.
						            response.sendRedirect("/bank/customer/index.do");
						        }
						    }
						}
					%>
					
					
					<div>
						<input type="button" id="userLogin" name="userLogin" value="고객 로그인" onclick="window.location='${custPath}login.do'">
						<input type="button" id="adminLogin" name="adminLogin" value="관리자 로그인" onclick="window.location='${mngPath}manager/mngLogin.do'">
					
					</div>
					<div class="login_input_div">
						<label class="login_input_icon_label">
						<span class="login_id"></span>
							<input type="text" name="id" placeholder="아이디" autofocus />
						</label>
						
					</div>
					
					<div class="password_input_div">	
						<input type="password" name="password" placeholder="비밀번호" />
					</div>	
					
					<div class="login_input_keep_state_checkbox">
						<label class="autologin">
							<input type="checkbox" width="50px" height="50px" name="autoLogin" value="true">
							<span class="keep_state_span">자동 로그인</span>
						</label>
						<span class="find_id_pwd">
							<a href="${custPath}idFind.do">아이디/비밀번호 찾기</a></span>
					</div>
				</section>
				
				<section class="button_section">
					<div class="login_button_div">
						<input type="submit" value="로그인">
					</div>
					<hr class=login_separator>
				</section>
			</form>
			<section class="button_section">
				<div class="register_button_div">
					<a href="${custPath}register.do"><button>회원가입</button></a>
				</div>
				
			</section>
			
			
			<footer>
				<div class="copyright_div">
					<span>Copyright © KOSMO-BANK Corp. All Rights Reserved.</span>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>