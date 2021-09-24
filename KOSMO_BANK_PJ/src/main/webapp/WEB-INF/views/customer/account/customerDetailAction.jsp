<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${rePath }css/user/userDetailAction.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<!-------------------- header 시작 ------------------>
	
	
	<!---------------- header 끝 ------------------->

	<!-- 
	이름:
	생년월일:
	아이디:
	비밀번호:
	비밀번호확인:
	휴대폰 번호:
	이메일:
	주소:
 -->
	<!-- 비밀번호 틀림 -->
	<c:if test="${selectCnt == -1}">
		<script type="text/javascript">
			setTimeout(function() {
				errorAlert(passwordError);
				window.location="userUpdate";
			}, 10);
		</script>
	</c:if>
	
	<!-- 회원 인증 성공 -->
	<c:if test="${selectCnt == 1}">
	
	<h2 class="tx_main">전자마트 쇼핑몰 회원정보 수정</h2>

	<div class="register_form_div">

		<form action="userUpdateAction" name="updateform" method="post" onsubmit="return updateCheck();">
		<sec:csrfInput />
			<h3>필수정보</h3>
			<table class="register_table">
				<tr>
					<th><label for="userName">이름＊</label></th>
					<!-- <td><input type="text" id="userName" maxlength="30" value="홍길동" readonly></td>  -->
					<td>${vo.getName()}</td>
				</tr>

				<tr>
					<th><label for="userBirth">생년월일＊</label></th>
					<td>${vo.getBirth()}</td>
				</tr>

				<tr>
					<th><label for="userId">아이디＊</label></th>
					<td>
						<div>
							${vo.getId()}
						</div>

					</td>
				</tr>

				<tr>
					<th><label for="userPwd">비밀번호 변경＊</label></th>
					<td>
						<input type="password" id="userPwd" name="password" maxlength="100" value="${vo.getPassword() }"
								 placeholder="현재 비밀번호 입력">
						<p>
						<input type="password" id="userPwd_Change" name="password_change"
								 maxlength="20" placeholder="비밀번호 입력">
						<p class="tx_ex">
							<span class="tx_ex">! 띄어쓰기 없이 8~15자 영문,숫자,특수문자 중 3개 이상을 조합하여 입력해 주세요.<br>(특수문자는
								!, @, #, $, %, ^, &amp;, *만 사용 가능)<br>아이디와 동일한 비밀번호는 사용할 수
								없습니다.
							</span>
						</p>
						
						<p>
						<input type="password" id="userrePwd_Change" name="repassword_change"
								 maxlength="20"	placeholder="비밀번호 확인">
							<span class="tx_ex">! 비밀번호 확인을 위해 다시 한번 입력해주세요. </span>
						</p>
					</td>	
				</tr>

				<tr>
					<th><label for="userTel">휴대폰 번호＊</label></th>
					<td>
						<c:if test="${vo.getHp() == null }" >
							<c:set var="hpArr" value="${fn:split(vo.getHp(), '-')}" />
							<input type="tel" id="hp1" name="hp1" maxlength="3" onkeyup="nextHp1();"> - 
							<input type="tel" id="hp2" name="hp2" maxlength="4" onkeyup="nextHp2();"> - 
							<input type="tel" id="hp3" name="hp3" maxlength="4" onkeyup="nextHp3();">
						</c:if>
						<c:if test="${vo.getHp() != null }" >
							<c:set var="hpArr" value="${fn:split(vo.getHp(), '-')}" />
							<input type="tel" id="hp1" name="hp1" maxlength="3" onkeyup="nextHp1();" value="${hpArr[0] }"> - 
							<input type="tel" id="hp2" name="hp2" maxlength="4" onkeyup="nextHp2();" value="${hpArr[1] }"> - 
							<input type="tel" id="hp3" name="hp3" maxlength="4" onkeyup="nextHp3();" value="${hpArr[2] }">
						</c:if>
					</td>
				</tr>

				<tr>
					<th><label for="userEmail">이메일</label></th>
					<td>
						<c:set var="emailArr" value="${fn:split(vo.getEmail(), '@')}" />
						<input type="text" id="userEmail" name="email1" maxlength="50"
						placeholder="이메일 입력" value="${emailArr[0]}">
						@
						<input type="text" id="userEmail" name="email2" maxlength="20" value="${emailArr[1]}">
						<select id="userEmail3" name="email3" onchange="selectEmailChk();">
							<option value="0">직접 입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
						</select>
					</td>
				</tr>

				<tr>
					<th><label for="userAddress">주소</label></th>
					<td>
						<div class="userZipcode_div">
							<input id="address_zipcode" name="address_zipcode" placeholder="우편번호" value="${vo.getZipcode() }" readonly>
							<input id="zipcheck" name="zipcheck" type="button" value="우편번호 찾기" onclick="zipcodeFind();">
						</div>
						<p>

							<label>
								<input type="text" id="address_addr1" name="address_addr1"
									 placeholder="도로명 주소" value="${vo.getAddr1() }" readonly>
							</label>
						<div class="userAddress_div">
							<label>
								<input type="text" id="address_addr2" name="address_addr2"
									placeholder="지번 주소" value="${vo.getAddr2() }" readonly>
							</label>
								<input type="text"
									id="address_addr3" name="address_addr3" value="${vo.getAddr3() }" placeholder="상세 주소">
						</div>

					</td>
				</tr>
				<tr>
					<th>가입 일자</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.getIndate()}" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="withdraw_div">
							<label>탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.</label>
								<input type="button" id="withdraw" value="회원탈퇴" onclick="deleteUser();">
							
						</div>
					</td>	
				</tr>

				<tr>
					<td colspan="2"><br>
						<div class="complete_cancel" align="center">
							<input type="submit"  id="register_submit" value="완료">
							<input type="reset"	id="register_reset" value="취소" onclick="window.history.back();">
						</div></td>
				</tr>
			</table>
		</form>
	</div>
			
		
	</c:if>
	
	 <!---------------- footer 시작 ------------------->
	<!---------------- footer 끝 ------------------->
</body>
</html>