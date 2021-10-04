<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>계좌 연동</title>
<link rel="stylesheet" href="${rePath}css/user/accountConnect.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	
	
	<!-- 메인 폼-->
	<div class="main-panel">
		<div class="content">
		
			<!-- 고정헤더  시작-->
			<div class="panel-header bg-primary-gradient" style="height: 300px;">
				<div class="page-inner py-5">
					<div
						class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
						<div>
							<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1>
							<br />
							<h2 class="text-white op-7 mb-2">
								KOSMO BANK에 오신 것을 환영합니다.<br /> 저희는 고객님의 <strong>자산관리</strong>를
								효율적이고, 안전하게 도와드립니다. <br /> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게
								통합하여 금융상품을 이용하실 수 있습니다.
							</h2>
						</div>
					</div>
				</div>
			</div>
		<!-- 고정헤더 끝 -->
<div class="main-panel" style="width: 100%;">
	<div class="content">
		<div class="page-inner">
			<!-- 페이지 헤더 시작 -->
			<div class="page-header">
				<h4 class="page-title">계좌관리</h4>
				<ul class="breadcrumbs">
					<li class="nav-home">
						<a href="${custPath}index.do">
							<i class="flaticon-home"></i>
						</a>
					</li>
					<li class="separator">
						<i class="flaticon-right-arrow"></i>
					</li>
					<li class="nav-item">
						<a href="${custPath}accountConnect">계좌연동</a>
					</li>
					<li class="separator">
						<i class="flaticon-right-arrow"></i>
					</li>
					<li class="nav-item">
						<a href="#">Basic Tables</a>
					</li>
				</ul>
			</div>
			<!-- 페이지 헤더 시작 끝 -->
			
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-title">제 1금융권</div>
							</div>
							<div class="card-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col" class="main">은행명</th>
											<th scope="col"></th>
										</tr>
									</thead>
									
										<c:forEach var="i" begin="0" end="5" varStatus="status">
											<c:set var="flag" value="0"/>
										<c:forEach var="j" begin="0" end="5" varStatus="statusJ">
											<c:if test="${dtos[j].account_bankCode == status.count}">
											<c:set var="flag" value="1"/>
												<tr>
													<td	class="bank-td">
														<c:choose>
															<c:when test="${status.count == 1}">
																<img class="bankImg" src="${rePath}images/bank/gookminicon.jpg">
																<span class="bankname">국민은행</span>
															</c:when>
															<c:when test="${status.count == 2}">
																<img class="bankImg" src="${rePath}images/bank/uriicon.jpg">
																<span class="bankname">우리은행</span>
															</c:when>
															<c:when test="${status.count == 3}">
																<img class="bankImg" src="${rePath}images/bank/nhicon.png">
																<span class="bankname">농협은행</span>
															</c:when>
															<c:when test="${status.count == 4}">
																<img class="bankImg" src="${rePath}images/bank/sinhanicon.png">
																<span class="bankname">신한은행</span>
															</c:when>
															<c:when test="${status.count == 5}">
																<img class="bankImg" src="${rePath}images/bank/hanaicon.png">
																<span class="bankname">하나은행</span>
															</c:when>
															<c:otherwise>
																<img class="bankImg" src="${rePath}images/bank/kosmoicon.png">
																<span class="bankname">코스모은행</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="btn-td">
													<label for="account_bankCode${j}" class="account-label">
														<c:if test="${dtos[j].account_linked == 0 }">
															<button class="btn btn-icon btn-primary btn-round btn-xs">
																<i class="fa fa-plus"></i>
															</button>
															<small class="account-add">계좌추가</small>
															
																<sec:csrfInput/>
																<input type="button" class="submit-btn" id="account_bankCode${j}" name="account_bankCode" value="${dtos[j].account_bankCode}"
																	 onclick="accountConnectConfirm(${j});">
															
														</c:if>
													</label>
														<c:if test="${dtos[j].account_linked == 1}">
															<button type="button" class="btn btn-icon btn-round btn-success" disabled="disabled">
																<i class="fa fa-check"></i>
															</button>
															<small class="account-complete">연동완료</small>
														</c:if>
													</td>
												</tr>
											</c:if>
											<c:if test="${flag == 0 && j == 5}">
												<tr>
													<td	class="bank-td">
														<c:choose>
															<c:when test="${status.count == 1}">
																<img class="bankImg" src="${rePath}images/bank/gookminicon.jpg">
																<span class="bankname">국민은행</span>
															</c:when>
															<c:when test="${status.count == 2}">
																<img class="bankImg" src="${rePath}images/bank/uriicon.jpg">
																<span class="bankname">우리은행</span>
															</c:when>
															<c:when test="${status.count == 3}">
																<img class="bankImg" src="${rePath}images/bank/nhicon.png">
																<span class="bankname">농협은행</span>
															</c:when>
															<c:when test="${status.count == 4}">
																<img class="bankImg" src="${rePath}images/bank/sinhanicon.png">
																<span class="bankname">신한은행</span>
															</c:when>
															<c:when test="${status.count == 5}">
																<img class="bankImg" src="${rePath}images/bank/hanaicon.png">
																<span class="bankname">하나은행</span>
															</c:when>
															<c:otherwise>
																<img class="bankImg" src="${rePath}images/bank/kosmoicon.png">
																<span class="bankname">코스모은행</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="btn-td">
														<button type="button" class="btn btn-icon btn-round btn-warning">
															<i class="fa fa-exclamation-circle"></i>
														</button>
														<small class="account-null">계좌없음</small>
													</td>
												</tr>
											</c:if>
											</c:forEach>
											
										</c:forEach>
										
									</tbody>
									
								</table>
							</div>
						</div>
					</div>
				</div>
		
			</div>
		</div>
	</div>
	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<script type="text/javascript" src="${rePath}js/ajax.js"></script>
</body>
</html>