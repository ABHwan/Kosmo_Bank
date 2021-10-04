<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀드 상품 등록</title>
<script src="${rePath}js/script.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		
		

		<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
				<!-- 고정헤더 -->
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br />
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<main id="main">
			      <div class="container">
			        <h1 class="title">펀드상품등록</h1>
			        <hr>
			        <form action="fundProductInsertAction" method="post" name="fundProductInsertForm" class="main__form" onsubmit="return fundProductInsertCheck();">
					  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          
			          	<table class="table table-hover card-table">
							
							<tr class="form__row">
								<th>펀드종목</th>
								<td>
									<select class="form-control input-border-bottom" name="fund_category">
										<option value="선택 없음">선택 없음</option>
										<option value="주식·채권">주식·채권</option>
										<option value="테크·가전">테크·가전</option>
										<option value="페션·잡화">패션·잡화</option>
										<option value="뷰티">뷰티</option>
										<option value="푸드">푸드</option>
										<option value="홈·리빙">홈·리빙</option>
										<option value="여행·레져">여행·레져</option>
										<option value="스포츠·모빌리">스포츠·모빌리티</option>
										<option value="캐릭터·굿즈">캐릭터·굿즈</option>
										<option value="베이비·키즈">베이비·키즈</option>
										<option value="반려동물">반려동물</option>
									</select>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>펀딩기간</th>
								<td>
									<input type="date" class="form-control input-border-bottom" name="fund_start_date">
									-
									<input type="date" class="form-control input-border-bottom" name="fund_end_date">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>목표금액</th>
								<td>
									<input type="text" class="form-control input-border-bottom" name="fund_goal_money">
								</td>
							</tr>
							
							<tr>
								<th colspan="2">--- 펀드 메이커 정보 입력 ---</th>
							</tr>
							
							<tr class="form__row">
								<th>등록자 회사(이름)</th>
								<td>
									<input type="text" class="form-control input-border-bottom" name="fund_mem_name">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>등록자 연락처</th>
								<td>
									<input type="text" class=".col-sm-4" name="fund_mem_hp1" maxlength="3"
										onkeyup="nextHp1();">
									-
									<input type="text" class=".col-sm-4" name="fund_mem_hp2" maxlength="4"
										onkeyup="nextHp2();">
									-
									<input type="text" class=".col-sm-4" name="fund_mem_hp3" maxlength="4"
										onkeyup="nextHp3();">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>등록자 이메일</th>
								<td>
									<input type="text" class=".col-sm-4" name="fund_mem_email1">
									@
									<input class=".col-sm-4" type="text" name="fund_mem_email2" maxlength="20"
										style="width:70px">
									<select class=".col-sm-4" name="fund_mem_email3" onchange="selectEmailChk();">
										<option value="0">직접입력</option>
										<option value="google.com">구글</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="nate.com">네이트</option>
									</select>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>펀드상품이름</th>
								<td>
									<input class="form-control input-border-bottom" type="text" name="fund_title" >
								</td>
							</tr>
							
							<tr class="form__row">
								<th>펀드상품 한줄요약</th>
								<td>
									<input class="form-control input-border-bottom" type="text" name="fund_summary">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>펀딩내용</th>
								<td>
									<textarea class="form-control input-border-bottom"name="fund_content" placeholder="펀딩내용을 입력해주세요."></textarea>
								</td>
							</tr>
							
							<tr class="form__row">
								<th>모금계좌</th>
								<td>
									<select class="form-control input-border-bottom" name="fund_bank_code">
										<option value="0">미기재</option>
										<option value="1">국민은행</option>
										<option value="2">우리은행</option>
										<option value="3">농협은행</option>
										<option value="4">신한은행</option>
										<option value="5">하나은행</option>
										<option value="6">코스모은행</option>
									</select>
									<input type="text" class="form-control input-border-bottom" name="fund_account">
								</td>
							</tr>
							
							<tr class="form__row">
								<th>첨부파일</th>
								<td>
									<input type="file" class="form-control input-border-bottom" name="fund_filename">
								</td>
							</tr>
							
							<tr class="form__row submit">
								<th colspan="2">
									<input class="btn btn-default" type="submit" value="펀드등록">
									<input class="btn btn-default" type="reset" value="초기화">
								</th>
							</tr>
					   </table>
			        </form>
			      </div>
			    </main>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	

</body>
</html>