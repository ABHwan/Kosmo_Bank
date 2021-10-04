<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="${path}customer/index.do" class="logo">
					<img src="${rePath}images/img/kosmobanklogo.png" width="180px" alt="navbar brand" class="navbar-brand">
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->

			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
				
				<div class="container-fluid">
					<div class="collapse" id="search-nav">
						<form class="navbar-left navbar-form nav-search mr-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<button type="submit" class="btn btn-search pr-1">
										<i class="fa fa-search search-icon"></i>
									</button>
								</div>
								<input type="text" placeholder="Search ..." class="form-control">
							</div>
						</form>
					</div>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item toggle-nav-search hidden-caret">
							<a class="nav-link" data-toggle="collapse" href="#search-nav" role="button" aria-expanded="false" aria-controls="search-nav">
								<i class="fa fa-search"></i>
							</a>
						</li>
						<!-- 자동로그인 Controll -->
						<%
						    Cookie[] cookies = request.getCookies();
						    if(cookies != null){
						        for(Cookie tempCookie : cookies){
						        	// 쿠키에 userID란 문자열이 있으면
						            if(tempCookie.getName().equals("customerID")){
						                //쿠키값으로 대신 로그인 처리함
						                session.setAttribute("customerID", tempCookie.getValue());
						                
						            // 쿠키에 adminID란 문자열이 있으면
						            } else if(tempCookie.getName().equals("adminID")){
						                //쿠키값으로 대신 로그인 처리함
						                session.setAttribute("adminID", tempCookie.getValue());
						            }
						        }
						    }
						%>
						<c:choose>
							<c:when test="${sessionScope.adminID != null}">
								<li class="nav-item dropdown hidden-caret">
									<a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.location='/bank/manager/index'">
										관리자 페이지
									</a>
		                           <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="document.getElementById('logout').submit();">
										로그아웃
									</a>
							  </li>
							
							</c:when>
							
							<c:when test="${sessionScope.customerID == null}">
								<li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.location='/bank/customer/login.do'">
										로그인
		                           </a>
		                      </li>
		                      
		                      <li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button"
		                           	 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.location='/bank/customer/register.do'">
		                               	회원가입
		                           </a>
		                      </li>
							</c:when>
							
							<c:otherwise>
							  <li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="document.getElementById('logout').submit();">
										로그아웃
									</a>
							  </li>
							</c:otherwise>
						</c:choose>
						
						<form id="logout" action="logout" method="POST">
					   		<sec:csrfInput />
						</form>
						
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell"></i>
								<span class="notification">4</span>
							</a>
							<ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-scroll scrollbar-outer">
										<div class="notif-center">
											<a href="#">
												<div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
												<div class="notif-content">
													<span class="block">
														New user registered
													</span>
													<span class="time">5 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
												<div class="notif-content">
													<span class="block">
														Rahmad commented on Admin
													</span>
													<span class="time">12 minutes ago</span> 
												</div>
											</a>
											
										</div>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);">See all notifications<i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
								<div class="avatar-sm">
									<img src="${rePath}images/img/person2.png" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<div class="dropdown-user-scroll scrollbar-outer">
								<c:choose>
									
									<c:when test="${sessionScope.adminID != null}">
									<!-- 관리자 로그인하고 이미지 클릭시 -->
										<li>
											<div class="user-box">
												<div class="avatar-lg"><img src="${rePath}images/img/person2.png" alt="image profile" class="avatar-img rounded"></div>
												<div class="u-text">
													<h4>관리자</h4>
													<p class="text-muted">host@naver.com</p>
												</div>
											</div>
										</li>
									</c:when>
									
									
									<c:when test="${sessionScope.customerID != null}">
									<!-- 사용자 로그인하고 이미지 클릭시(아이디, 로그아웃버튼) -->
										<li>
											<div class="user-box">
												<div class="avatar-lg"><img src="${rePath}images/img/person2.png" alt="image profile" class="avatar-img rounded"></div>
												<div class="u-text">
													<h4>${sessionScope.customerID}님 환영합니다!</h4>
													<p class="text-muted"></p><a href="${path}customer/myPage" class="btn btn-xs btn-secondary btn-sm" >마이페이지</a>
												</div>
												
											</div>
										</li>
									</c:when>
									
									<c:otherwise>
									<!-- 사용자 로그인하고 이미지 클릭시(아이디, 로그아웃버튼) -->
										<li>
											<div class="user-box">
												<div class="u-text">
													<h4><a href="/bank/customer/login.do">로그인해주세요!</a></h4>
												</div>
											</div>
										</li>
									</c:otherwise>	
								</c:choose>				
								</div>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>
</body>
</html>