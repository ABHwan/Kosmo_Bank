<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="${rePath }css/common/footer.css">
</head>
<body>
	<!---------------- footer 시작 ------------------->
	<footer class="footer">
		<div class="f_address">
			<div class="minW">
				<div class="address_div">
					<strong class="company_name">(주) 에비씨디이에프 리테일 / 전자마트</strong>
					<p class="add">
						<span>서울시 금천구 가산디지털2로 123 전자마트 신관 4층</span>
						<span>대표 : 홍길동 &nbsp;&nbsp;사업자등록번호 : 106-81-01111</span>
						<span>통신판매업신고 : 금천구청 제00123호</span>
						<span>의료기기판매업신고 : 제105호</span>
						<span>건강기능식품판매업신고 : 제850호</span>
						<span>식품등수입판매업신고 : 제 34호</span>
						<span>개인정보보호 책임자 : 김철수</span>
						<span>호스팅서비스 : ㈜ 에비씨디이에프 리테일</span>
						<span>ETMART © All Rights Reserved. </span>
					</p>
				</div>

				<!--고객센터-->
				<div class="customer">
					<dl>
						<dt>쇼핑몰 고객센터</dt>
						<dd class="tel">080-010-1100</dd>
						<dd>평일 09:30 ~ 17:30</dd>
						<dd>Email : priceking@etmart.co.kr</dd>
					</dl>

					<dl>
						<dt>지점 고객센터</dt>
						<dd class="tel">080-870-1122</dd>
						<dd>평일 09:00 ~ 18:00</dd>
						<dd>토요일 09:00 ~ 17:00</dd>
					</dl>
				</div>
				<!--//고객센터-->

				<!--QR코드 및 SNS-->
				<div class="qr_sns">

					<div class="customer">
						<dl>
							<dt>클린킹 고객센터</dt>
							<dd class="tel">080-400-1100</dd>
							<dd><span>평일</span> 09:00 ~ 18:00</dd>
						</dl>
					</div>

					<dl class="qr_code">
						<dt>전자마트 모바일</dt>
						<dd>
							<img src="${rePath }images/qr_code.png" alt="바코드">
							<p>전자마트 <br>모바일 App 다운받아 <br>다양한 혜택을 만나보세요!</p>
						</dd>
					</dl>

				</div>
				<!--//QR코드 및 SNS-->
			</div>
		</div>
	</footer>
	<!---------------- footer 끝 ------------------->
</body>
</html>