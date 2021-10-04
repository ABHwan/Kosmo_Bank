<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>코스모 뱅크</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon"/>
	
	<!-- 회원본인인증 api 시작 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
	<script type="text/javascript" src="${rePath}js/registerAjax.js"></script>
	<!-- 회원본인인증 api 끝 -->
	
	
	
	<!-- Fonts and icons -->
	<script src="${rePath}js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['${rePath}css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
	
	<!-- CSS Files -->
	<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
	<link rel="stylesheet" href="${rePath}css/atlantis.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="${rePath}css/demo.css">
	
<link rel="stylesheet" href="${rePath}css/user/register.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${rePath}js/script.js"></script>
</head>
<body onload="emailChk();">
	<div class="wrapper">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="index.do" class="logo">
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
												<!-- 상단 로그인 회원가입  버튼  -->
						<c:choose>
							<c:when test="${sessionScope.adminID != null}">
								<li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
							
							</c:when>
							
							<c:when test="${sessionScope.customerID == null}">
								<li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="login.do" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.location='login.do'">
										로그인
		                           </a>
		                      </li>
		                      
		                      <li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="register.do" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="window.location='register.do'">
		                               	회원가입
		                           </a>
		                      </li>
							</c:when>
							
							<c:otherwise>
							  <li class="nav-item dropdown hidden-caret">
		                           <a class="nav-link dropdown-toggle" href="register.do" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="document.getElementById('logout').submit();">
										로그아웃
									</a>
							  </li>
							</c:otherwise>
						</c:choose>
                        
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
									<li>
										<div class="user-box">
											<div class="avatar-lg"><img src="${rePath}images/img/person2.png" alt="image profile" class="avatar-img rounded"></div>
											<div class="u-text">
												<h4>사용자</h4>
												<p class="text-muted">hello@naver.com</p><a href="${rePath}images/person2.png" class="btn btn-xs btn-secondary btn-sm">로그인</a>
												<!-- 로그인시 로그아웃 출력 -->
												<%-- <p class="text-muted">hello@naver.com</p><a href="${rePath}images/person2.png" class="btn btn-xs btn-secondary btn-sm">로그아웃</a> --%>
											</div>
										</div>
									</li>
									<!-- 미로그인 시 화면 -->
									<li>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">마이페이지</a>
										<a class="dropdown-item" href="#">나의 금융상품</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">내 자산</a>
									</li>
									<!-- 로그인시 출력 화면 -->
<!-- 									<li>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">마이페이지</a>
										<a class="dropdown-item" href="#">나의 금융상품</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">내 자산</a>
									</li>	 -->								
								</div>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>

		
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- img 시작 -->
				<div class="page-inner mt--5"> 
						<div class="row"> 
							<div class="col">
								<div class="card">
									<div class="card-body">
										<h2 class="tx_main">KOSMO BANK 회원가입</h2>
	<p class="tx_sub">
		KOSMO BANK 통합회원으로 가입하시면 전국 은행 계좌를 KOSMO BANK에서 간편하게 관리할 수 있습니다. <br>카드 추천 등 다양한 혜택을 받으실 수 있으며
		프로모션과 이벤트 참여가 가능합니다.<br> 고객님의 개인정보보호를 위해 본인 확인 절차를 거쳐 회원가입을 하고
		있습니다.
	</p>

	<div class="register_form_div ml-5">

		<form action="registerAction.do" name="registerform" method="post" onsubmit="return signIncheck();" onload="idcheck(this);">
			
			<sec:csrfInput />
			
			<h3>필수정보</h3>
			<!-- ID 중복확인 체크 -->
			<input type="hidden" name="hiddenId" value="0">
			<!-- Email 인증 -->
			<input type="hidden" name="emailChk" value="0">
			
			<!-- 회원인증 토큰 -->
			<input type="hidden" name="unique_key" value="">
			
			<table class="register_table">
				<tr>
					<th><label for="userName">이름＊</label></th>
					<td><input type="text" id="userName" name="name" maxlength="20" placeholder="본인인증을 해주세요!" readonly></td>
				</tr>

				<tr>
					<th><label for="userBirth">생년월일＊</label></th>
					<td><input type="text" id="userBirth" name="birth" maxlength="10"
						placeholder="본인인증을 해주세요!" readonly></td>
				</tr>

				<tr>
					<th><label for="userId">아이디＊</label></th>
					<td>
						<div>
							<input type="text" id="userId" class="userId" name="id" maxlength="50"
								placeholder="중복체크를 해주세요." autofocus onkeyup="confirmId();">   
							<br>
							<span id="id_check"></span>
							<p class="tx_ex">
								<span> ! 첫글자는 영문(소문자)으로 띄어쓰기 없이 6~15자로 영문(소문자)과 숫자 조합으로
									입력해주세요. </span>
							</p>
						</div>

					</td>
				</tr>

				<tr>
					<th><label for="userPwd">비밀번호＊</label></th>
					<td><input type="password" id="userPwd" name="password" maxlength="20"
						placeholder="비밀번호 입력">
						<p class="tx_ex">
							<span>! 띄어쓰기 없이 8~15자 영문,숫자,특수문자 중 3개 이상을 조합하여 입력해 주세요.<br>(특수문자는
								!, @, #, $, %, ^, &amp;, *만 사용 가능)<br>아이디와 동일한 비밀번호는 사용할 수
								없습니다.
							</span>
						</p></td>
				</tr>

				<tr>
					<th><label for="userrePwd">비밀번호 확인＊</label></th>
					<td><input type="password" id="repwd" name="repassword" maxlength="20"
						placeholder="비밀번호 확인">
						<p class="tx_ex">
							<span>! 비밀번호 확인을 위해 다시 한번 입력해주세요. </span>
						</p></td>

				</tr>

				<tr>
					<th><label for="userTel">휴대폰 번호＊</label></th>
					<td>
						<input type="tel" id="hp" name="hp" maxlength="11" onkeyup="nextHp1();" readonly> 
						<!-- <input type="tel" id="hp2" name="hp2" maxlength="4" onkeyup="nextHp2();"> - 
						<input type="tel" id="hp3" name="hp3" maxlength="4" onkeyup="nextHp3();"> -->
					</td>
						
				</tr>

				<tr>
					<th><label for="userEmail">이메일</label></th>
					<td>
						<input type="text" id="userEmail" name="email1" maxlength="50"
						placeholder="이메일 입력">
						@
						<input type="text" id="userEmail" name="email2" maxlength="20">
						<select id="userEmail3" name="email3" onchange="selectEmailChk();">
							<option value="0">직접 입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
						</select>
						<div style="display: inline-block;">
							<a class="btn" id="mail1" style="margin-top: 0px; border: 1px solid; cursor:pointer; margin-bottom: 3px;">인증 보내기</a>
							<a class="btn" id="mail2" style="margin-top: 0px; border: 1px solid; cursor:pointer; display:none; margin-bottom: 3px;">다시 보내기</a>
						</div>
							
						<div class="col-md-offset-3 col-md-6" id="dice_check1"
							style="display: none; padding-left: 0px;">
							<div class="form-group" id="input" style="padding-left: 0px;">
								<input type="text" class="form-control" id="dice" name="dice" placeholder="인증번호를 입력하세요"> 
								<a class="btn btn-default btn-sm" id="btn_dice">인증번호 확인</a>
								<div class="check_font" id="dice_check" style="display: none;"></div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th><label for="userAddress">주소</label></th>
					<td>
						<div class="userZipcode_div">
							<input id="address_zipcode" name="address_zipcode" placeholder="우편번호" readonly>
							<input id="zipcheck" name="zipcheck" type="button" value="우편번호 찾기" onclick="zipcodeFind();">
						</div>
						<p>

							<label>
								<input type="text" id="address_addr1" name="address_addr1"
									 placeholder="도로명 주소" readonly>
							</label>
						<div class="userAddress_div">
							<label>
								<input type="text" id="address_addr2" name="address_addr2"
									placeholder="지번 주소" readonly>
							</label>
								<input type="text"
									id="address_addr3" name="address_addr3" placeholder="상세 주소">
						</div>

					</td>
				</tr>
				<tr>
					<td colspan="2"><br>
						<div class="complete_cancel" align="center">
							<input type="button" id="pass" name="pass" value="본인인증" onclick="confirm();">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><br>
						<div class="complete_cancel" align="center">
							<input type="submit"  id="register_submit" value="완료">
							<input type="reset"	id="register_reset" value="취소">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
									</div>
								</div>  
							</div>
						</div>		
					</div>
					<!-- img 끝 -->
		
		<!-- Sidebar -->
		<div class="sidebar sidebar-style-2">			
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<div class="user">
						<div class="avatar-sm float-left mr-2">
							<img src="${rePath}images/img/person.png" alt="..." class="avatar-img rounded-circle">
						</div>
						<div class="info">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									이름
									<span class="user-level">사용자</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">로그인</span>
										</a>
									</li>
									<li>
										<a href="#edit"> 
											<span class="link-collapse">회원가입</span>
										</a>
									</li>								
								
								<!-- 로그인시 나타날 화면 -->
<!-- 									<li>
										<a href="#profile">
											<span class="link-collapse">마이페이지</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">나의 금융상품</span>
										</a>
									</li> -->
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav nav-primary">
						
						<li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
							<h4 class="text-section">전체메뉴</h4>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#base">
								<i class="fas fa-donate"></i>
								<p>계좌관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">계좌조회</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">자주쓰는 계좌</span>
										</a>
									</li>									
									<li>
										<a href="#">
											<span class="sub-item">계좌연동</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts">
								<i class="fas fa-won-sign"></i>
								<p>자산관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">카테고리별 지출분석</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">맞춤 카드 추천</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">자산관리</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#forms">
								<i class="fas fa-chart-pie"></i>
								<p>금융상품</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="forms">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">적금</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">예금</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">대출</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">연금</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#tables">
								<i class="fas fa-coins"></i>
								<p>이체</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="tables">
								<ul class="nav nav-collapse">
									<li>
										<a href="forms/forms.html">
											<span class="sub-item">자동이체</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">이체내역</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">자동이체</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">자동이체 관리</span>
										</a>
									</li>									
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#maps">
								<i class="fas fa-dollar-sign"></i>
								<p>외환</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="maps">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">나라별 환율</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">환전</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">해외송금</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">국내송금</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#charts">
								<i class="fas fa-receipt"></i>
								<p>공과금 납부</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="charts">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">아파트 관리비</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">등록금</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">지방세</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#submenu">
								<i class="fas fa-phone"></i>
								<p>고객센터</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="submenu">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">문자서비스</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">공지사항</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">챗봇 대화하기</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">1대1 문의하기</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->
		
		</div>
		
		<!-- Custom template | don't include it in your project! -->
		<div class="custom-template">
			<div class="title">Settings</div>
			<div class="custom-content">
				<div class="switcher">
					<div class="switch-block">
						<h4>Logo Header</h4>
						<div class="btnSwitch">
							<button type="button" class="changeLogoHeaderColor" data-color="dark"></button>
							<button type="button" class="selected changeLogoHeaderColor" data-color="blue"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="purple"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="light-blue"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="green"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="orange"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="red"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="white"></button>
							<br/>
							<button type="button" class="changeLogoHeaderColor" data-color="dark2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="blue2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="purple2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="light-blue2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="green2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="orange2"></button>
							<button type="button" class="changeLogoHeaderColor" data-color="red2"></button>
						</div>
					</div>
					<div class="switch-block">
						<h4>Navbar Header</h4>
						<div class="btnSwitch">
							<button type="button" class="changeTopBarColor" data-color="dark"></button>
							<button type="button" class="changeTopBarColor" data-color="blue"></button>
							<button type="button" class="changeTopBarColor" data-color="purple"></button>
							<button type="button" class="changeTopBarColor" data-color="light-blue"></button>
							<button type="button" class="changeTopBarColor" data-color="green"></button>
							<button type="button" class="changeTopBarColor" data-color="orange"></button>
							<button type="button" class="changeTopBarColor" data-color="red"></button>
							<button type="button" class="changeTopBarColor" data-color="white"></button>
							<br/>
							<button type="button" class="changeTopBarColor" data-color="dark2"></button>
							<button type="button" class="selected changeTopBarColor" data-color="blue2"></button>
							<button type="button" class="changeTopBarColor" data-color="purple2"></button>
							<button type="button" class="changeTopBarColor" data-color="light-blue2"></button>
							<button type="button" class="changeTopBarColor" data-color="green2"></button>
							<button type="button" class="changeTopBarColor" data-color="orange2"></button>
							<button type="button" class="changeTopBarColor" data-color="red2"></button>
						</div>
					</div>
					<div class="switch-block">
						<h4>Sidebar</h4>
						<div class="btnSwitch">
							<button type="button" class="selected changeSideBarColor" data-color="white"></button>
							<button type="button" class="changeSideBarColor" data-color="dark"></button>
							<button type="button" class="changeSideBarColor" data-color="dark2"></button>
						</div>
					</div>
					<div class="switch-block">
						<h4>Background</h4>
						<div class="btnSwitch">
							<button type="button" class="changeBackgroundColor" data-color="bg2"></button>
							<button type="button" class="changeBackgroundColor selected" data-color="bg1"></button>
							<button type="button" class="changeBackgroundColor" data-color="bg3"></button>
							<button type="button" class="changeBackgroundColor" data-color="dark"></button>
						</div>
					</div>
				</div>
			</div>
			<div class="custom-toggle">
				<i class="flaticon-settings"></i>
			</div>
		</div>
		<!-- End Custom template -->
	</div>
	
	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="${rePath}js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="${rePath}js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="${rePath}js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="${rePath}js/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="${rePath}js/setting-demo.js"></script>
	<!-- <script src="${rePath}js/demo.js"></script>  -->
	<!-- 
	<script>
		Circles.create({
			id:'circles-1',
			radius:45,
			value:60,
			maxValue:100,
			width:7,
			text: 5,
			colors:['#f1f1f1', '#FF9E27'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-2',
			radius:45,
			value:70,
			maxValue:100,
			width:7,
			text: 36,
			colors:['#f1f1f1', '#2BB930'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-3',
			radius:45,
			value:40,
			maxValue:100,
			width:7,
			text: 12,
			colors:['#f1f1f1', '#F25961'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type: 'bar',
			data: {
				labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
				datasets : [{
					label: "Total Income",
					backgroundColor: '#ff9e27',
					borderColor: 'rgb(23, 125, 255)',
					data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
				}],
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false,
				},
				scales: {
					yAxes: [{
						ticks: {
							display: false //this will remove only the label
						},
						gridLines : {
							drawBorder: false,
							display : false
						}
					}],
					xAxes : [ {
						gridLines : {
							drawBorder: false,
							display : false
						}
					}]
				},
			}
		});

		$('#lineChart').sparkline([105,103,123,100,95,105,115], {
			type: 'line',
			height: '70',
			width: '100%',
			lineWidth: '2',
			lineColor: '#ffa534',
			fillColor: 'rgba(255, 165, 52, .14)'
		});
	</script>
	 -->
	
</body>
</html>