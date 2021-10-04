<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환전신청</title>
<script type="text/javascript" src="${rePath}js/exchange/exchange.js"></script>
</head>
<body onload="change();">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h1 class="page-title">환전 신청</h1>
					<hr>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title"><h2>환전정보 입력</h2></div>
									<table>
										<colgroup>
											<col width="130px">
											<col>
										</colgroup>
											<tr>
												<th><b>*</b>환전신청금액</th>
												<c:choose>
												<c:when test="${exchange =! null}">
													<td>
													<input type="text" class="exchange" value="${exchange}" disabled>
													</td>
												</c:when>
												<c:otherwise>
												<td>
													<select class="select">
													 	<option value="미국 USD">USD (미국 달러) </option>
														<option value="일본 JPY 100">JPY (일본 엔) </option>
														<option value="유로 EUR">EUR (유럽연합 유로) </option>
														<option value="중국 CNY">CNY (중국 위안) </option>
														<option value="홍콩 HKD">HKD (홍콩 달러) </option>
														<option value="태국 THB">THB (태국 바트) </option>
														<option value="대만 TWD">TWD (대만 달러) </option>
														<option value="필리핀 PHP">PHP (필리핀 페소) </option>
														<option value="싱가포르 SGD">SGD (싱가포르 달러) </option>
														<option value="호주 AUD">AUD (호주 달러) </option>
														<option value="베트남 VND 100">VND (스위스 프랑) </option>
														<option value="영국 GBP">GBP (영국 파운드) </option>
														<option value="캐나다 CAD">CAD (캐나다 달러) </option>
														<option value="말레이시아 MYR">MYR (말레이시아 링깃) </option>
														<option value="러시아 RUB">RUB (러시아 루블) </option>
														<option value="남아공화국 ZAR">ZAR (남아공 랜드) </option>
														<option value="노르웨이 NOK">NOK (노르웨이 크로네) </option>
														<option value="뉴질랜드 NZD">NZD (뉴질랜드 달러) </option>
														<option value="덴마크 DKK">DKK (덴마크 크로네) </option>
														<option value="멕시코 MXN">MXN (멕시코 페소) </option>
														<option value="몽골 MNT">MNY (몽골 투그릭) </option>
														<option value="바레인 BHD">BHD (바레인 디나르) </option>
														<option value="방글라데시 BDT">BDT (방글라데시 타카) </option>
														<option value="브라질 BRL">BRL (브라질 헤알) </option>
														<option value="브루나이 BND">BND (브루나이 달러) </option>
														<option value="사우디아라비아 SAR">SAR (사우디아라비아 리얄) </option>
														<option value="스리랑카 LKR">LKR (스리랑카 루피) </option>
														<option value="스웨덴 SEK">SEK (스웨덴 크로나) </option>
														<option value="스위스 CHF">CHF (스위스 프랑) </option>
														<option value="아랍에미리트공화국 AED">AED (아랍에미리트 디르함) </option>
														<option value="알제리 DZD">DZD (알제리 디나르) </option>
														<option value="오만 OMR">OMR (오만 리알) </option>
														<option value="요르단 JOD">JOD (요르단 디나르) </option>
														<option value="이스라엘 ILS">ILS (이스라엘 세켈) </option>
														<option value="이집트 EGP">EGP (이집트 파운드) </option>
														<option value="인도 INR">INR (인도 루피) </option>
														<option value="인도네시아 IDR 100">IDR (인도네시아 루피아) </option>
														<option value="체코 CZK">CZK (체코 코루나) </option>
														<option value="칠레 CLP">CLP (칠레 페소) </option>
														<option value="카자흐스탄 KZT">KZT (카자흐스찬 텡게) </option>
														<option value="카타르 QAR">QRR (카타르 리얄) </option>
														<option value="케냐 KES">KES (케냐 케냐실링) </option>
														<option value="콜롬비아 COP">COP (콜롬비아 페소) </option>
														<option value="쿠웨이트 KWD">KWD (쿠웨이트 디나르) </option>
														<option value="탄자니아 TZS">TZS (탄자니아 실링) </option>
														<option value="터키 TRY">TRY (터키 리라) </option>
														<option value="파키스탄 PKR">PKR (파키스탄 루피) </option>
														<option value="폴란드 PLN">PLN (폴란드 즈워티) </option>
														<option value="헝가리 HUF">HUF (헝가리 포린트) </option>
													</select>
												</td>
												</c:otherwise>
												</c:choose>
												<td>
													<input type="text" id="price" class="price" placeholder="최소금액 10" required>
												</td>
												<td>
													<input type="button" id="priceChk" class="price" value="환전예상금액 확인">
												</td>
											</tr>
											<tr>
												<th><b>*</b> 환전사유</th>
												<td>
													<select>
														<option value="관광">관광, 친지방문 등 일반해외여행경비</option>
														<option value="보유">보유목적</option>
														<option value="유학">유학경비</option>
														<option value="해외체재">해외체재비</option>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
									
									<div class="card-title"><h2>고객정보 입력</h2></div>
									<table>
										<colgroup>
											<col width="130px">
											<col>
										</colgroup>
											<tr>
												<th><b>*</b>휴대폰번호</th>
												<td>
													<select id="hp1" class="hp1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>
												</td>
												<td>-</td>
												<td><input type="text" id="hp2" class="hp2"></td>
												<td>-</td>
												<td><input type="text" id="hp3" class="hp3"></td>
											</tr>
											<tr>
												<th><b>*</b>출금계좌선택</th>
												<!-- 계좌 입력하기 ?? or 개인정보에서 계좌 가져와서 선택하기 -->
												<td>
													<input type="text" id="accountChk" class="accountChk" placeholder="계좌번호를 입력하세요">
												</td>
											</tr>
											<tr>
												<th><b>*</b>출금계좌비밀번호</th>
												<td><input type="text" id="accountPwd" class="accountPwd"></td>
											</tr>
										</tbody>
									</table>
									
									<div class="card-title"><h2>수령정보 입력</h2></div>
									<table>
										<colgroup>
											<col width="130px">
											<col>
										</colgroup>
											<tr>
												<th><b>*</b>수령희망일</th>
												<td>
													<input type="text" id="receiveDate" class="receiveDate" required>
												</td>
											</tr>
											<tr>
												<th><b>*</b>수령희망지점</th>
												<td>
													<input type="text" id="receivePla" class="receivePla" required>
												</td>
											</tr>
										</tbody>
									</table>									
								</div>
								
								<div class="card-title"><h2>권유직원선택</h2></div>
									<table>
										<colgroup>
											<col width="130px">
											<col>
										</colgroup>
											<tr>
												<td>
													<select id="advice" class="advice">
														<option value="안복환">안복환</option>
														<option value="김탁곤">김탁곤</option>
														<option value="정지은">정지은</option>
														<option value="김민재">김민재</option>
														<option value="진지현">진지현</option>
														<option value="김유성">김유성</option>
														<option value="노지호">노지호</option>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>		
	</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- End Sidebar -->
		
</body>
</html>