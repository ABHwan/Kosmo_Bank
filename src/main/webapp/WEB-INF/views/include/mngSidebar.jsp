<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
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
									<span class="user-level">관리자</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

 							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile" onclick="document.getElementById('logout').submit();">
											<span class="link-collapse" >로그아웃</span>
										</a>
										<form id="logout" action="logout" method="POST">
									   		<sec:csrfInput />
										</form>
									</li>
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
								<i class="fas fa-id-badge"></i>
								<p>회원관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">
									<li>
										<a href="customerInfo">
											<span class="sub-item">회원 정보 관리</span>
										</a>
									</li>
									<li>
										<a href="customerAccountInfo">
											<span class="sub-item">회원 계좌 관리</span>
										</a>
									</li>	
									<li>
										<a href="mngImg.do?cnt=12">
											<span class="sub-item">회원별 입출금 목록</span>
										</a>
									</li>				
									<li>
										<a href="mngImg.do?cnt=13">
											<span class="sub-item">회원별 입출금 상세</span>
										</a>
									</li>			
									<li>
										<a href="mngImg.do?cnt=15">
											<span class="sub-item">회원 한도 승인</span>
										</a>
									</li>									
									<!-- <li>
										<a href="#">
											<span class="sub-item">비밀번호 변경</span>
										</a>
									</li> -->
									<!-- <li>
										<a href="#">
											<span class="sub-item">고객 상품가입 목록</span>
										</a>
									</li>	 -->								
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#sidebarLayouts">
								<i class="fas fa-coins"></i>
								<p>예금관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="sidebarLayouts">
								<ul class="nav nav-collapse">
									<li>
										<a href="depositProductInsert">
											<span class="sub-item"> 등록</span>
										</a>
									</li>
									<!-- <li>
										<a href="#">
											<span class="sub-item"> 삭제</span>
										</a>
									</li> -->
									<li>
										<a href="depositProductList">
											<span class="sub-item"> 조회</span>
										</a>
									</li>
									<!-- <li>
										<a href="#">
											<span class="sub-item"> 수정</span>
										</a>
									</li> -->
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#forms">
								<i class="fas fa-coins"></i>
								<p>적금관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="forms">
								<ul class="nav nav-collapse">
									<li>
										<a href="savingProductInsert">
											<span class="sub-item"> 등록</span>
										</a>
									</li>
									<li>
										<a href="savingProductList">
											<span class="sub-item"> 조회</span>
										</a>
									</li>									
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#tables">
								<i class="fas fa-coins"></i>
								<p>연금관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="tables">
								<ul class="nav nav-collapse">
									<!-- <li>
										<a href="#">
											<span class="sub-item"> 등록</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item"> 삭제</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item"> 조회</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item"> 수정</span>
										</a>
									</li>					 -->				
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#loans">
								<i class="fas fa-receipt"></i>
								<p>대출</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="loans">
								<ul class="nav nav-collapse">
									<li>
										<a href="loanProductList.do">
											<span class="sub-item">대출 상품 조회/수정/삭제</span>
										</a>
									</li>
									<li>
										<a href="loanProductInsert.do">
											<span class="sub-item">대출 상품 등록</span>
										</a>
									</li>
									<li>
										<a href="loanRequestList.do">
											<span class="sub-item">신규 대출 승인/거절</span>
										</a>
									</li>
									<li>
										<a href="loanList.do">
											<span class="sub-item">회원 대출 상품 가입 내역</span>
										</a>
									</li>
									<li>
										<a href="loanCancelList.do">
											<span class="sub-item">대출 해지 내역</span>
										</a>
									</li>
									<li>
										<a href="">
											<span class="sub-item">추가예정</span>
										</a>
									</li>
									
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#고객">
								<i class="fas fa-coins"></i>
								<p>고객센터</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="고객">
								<ul class="nav nav-collapse">
									<li>
										<a href="${mngPath}qnaList_mng">
											<span class="sub-item">고객상담게시판(1:1)</span>
										</a>
										<a href="${mngPath}faq">
											<span class="sub-item">자주묻는 질문</span>
										</a>
										<a href="${mngPath}mngNoticeList">
											<span class="sub-item">공지사항 관리</span>
										</a>
									</li>
									
								</ul>
							</div>
						</li>
						<!-- <li class="nav-item">
							<a data-toggle="collapse" href="#charts">
								<i class="fas fa-history"></i>
								<p>휴면계좌 관리</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="charts">
								<ul class="nav nav-collapse">
									<li>
										<a href="#">
											<span class="sub-item">고객 휴면계좌 목록</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="sub-item">휴면계좌 해지 신청 목록</span>
										</a>
									</li>
								</ul>
							</div>
						</li> -->
						
						<li class="nav-item">
							<a data-toggle="collapse" href="#test">
								<i class="fas fa-coins"></i>
								<p>Test Data</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="test">
								<ul class="nav nav-collapse">
									<li>
										<a href="testAccountData">
											<span class="sub-item">고객계좌데이터추가</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						
						
					</div>
				</div>
			</div>
		<!-- End Sidebar -->
</body>
</html>