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
								<c:if test="${sessionScope.customerID != null}">
									<span>
										<span class="user-level">${sessionScope.customerID}</span>
										<span class="caret"></span>
									</span>
								</c:if>
								
								<c:if test="${sessionScope.customerID == null}">
									<span>
										<span class="user-level">사용자</span>
										<span class="caret"></span>
									</span>
								</c:if>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<c:if test="${sessionScope.customerID == null}">
										<li>
											<a href="${path}customer/login.do">
												<span class="link-collapse">로그인</span>
											</a>
										</li>
										<li>
											<a href="${path}customer/register.do">
												<span class="link-collapse">회원가입</span>
											</a>
										</li>								
									</c:if>
									
									<c:if test="${sessionScope.customerID != null}">
										<!-- 로그인시 나타날 화면 -->
	 									<li>
											<a href="${path}customer/myPage">
												<span class="link-collapse">마이페이지</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="link-collapse">나의 금융상품</span>
											</a>
										</li>
										<li>
											<a href="${path}customer/accountBook">
												<span class="link-collapse">나만의 가계부</span>
											</a>
										</li>
									</c:if>
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
										<a href="savingList">
											<span class="sub-item">적금</span>
										</a>
									</li>
									<li>
										<a href="${custPath}depositList.do">
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
		                               <a href="transfer">
		                                  <span class="sub-item">이체</span>
		                               </a>
		                            </li>
		                            <li>
		                               <a href="transfer_one_to_num">
		                                  <span class="sub-item">다계좌이체</span>
		                               </a>
		                            </li>
									<li>
										<a href="auto_transfer">
											<span class="sub-item">자동이체</span>
										</a>
									</li>
									<li>
										<a href="transfer_List">
											<span class="sub-item">이체내역</span>
										</a>
									</li>
									<li>
										<a href="auto_transfer_List">
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
										<a href="${path}customer/exchangeList.do">
											<span class="sub-item">나라별 환율</span>
										</a>
									</li>
									<li>
										<a href="${path}customer/exchange.do">
											<span class="sub-item">환전</span>
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
										<a href="${custPath}faqList.do">
											<span class="sub-item">자주 묻는 질문 </span>
										</a>
									</li>
									<li>
										<a href="${custPath}qnaList">
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
		<!-- End Sidebar -->
		
</body>
</html>