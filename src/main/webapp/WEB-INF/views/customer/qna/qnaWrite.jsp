<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>qnaWrite page</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${rePath}css/user/qnaWrite.css">
<!-- Fonts and icons -->
<script src="${rePath}js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '${rePath}css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>

<!-- CSS Files -->
<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
<link rel="stylesheet" href="${rePath}css/atlantis.min.css">
<link rel="stylesheet" href="${rePath}css/user/qnaList.css">
<link rel="stylesheet" href="${rePath}css/user/qnaWrite.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="${rePath}css/demo.css">
</head>
<body>
	<div class="wrapper">

		<div class="main-header">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

			<div class="qna_form_div">
							<h2><strong>문의 하기</strong></h2>
				<form action="qnaWriteAction" name="qnaform" method="post"
					onsubmit="return qnaCheck();">
					<sec:csrfInput />
					
					
					<input type="hidden" value="${sessionScope.customerID}" name="customerID">
					<input type="hidden" value="${pageNum}" name="pageNum">
					<!-- <div class="common-formTable-1">
						<div class="common-table-top">
							<strong>이용 안내</strong>
						</div>
					</div>	 -->
						<!-- 2018-11-12 수정 : 만 14세 이상 동의 체크박스 추가 및 약관영역 수정 -->
						<div class="terms-wrap" tabindex="0">
							<div id="divTermsContent">
								<div class="common-subTable-1">
									<table class="qna_table">
										<colgroup>
											<col style="width: 25%;">
											<col style="width: *;">
										</colgroup>
										<tbody>
											<tr>
												<th>
												이용 안내
												</th>
											</tr>
											<tr>
												<th scope="row">
												수집하는 개인정보와 문의 사항 및 기타 내용은 고객의 불편사항에 대한 목적이 달성되면 
												지체 없이 파기됩니다.
												</th>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="common-info-line">

							<div class="info-control" data-control="check">
								<div class="common-check-box">
									<span class="info-txt"><span>*</span> 
									만 14세 미만 아동의 경우 서비스 제공이 불가합니다. 만 14세 이상입니까?</span>
									<div class="common-check-wrap">
										<input id="agree1-14y" name="agree1-14y" type="checkbox" > 
										<label class="agree1-14y" for="agree1-14y"> 만 14세 이상</label>
									</div>
								</div>
							</div>
						</div>
						<!--// 2018-11-12 수정 : 만 14세 이상 동의 체크박스 추가 및 약관마크업 변경 -->
					
					<table class="qna_table">
						<tr>
							<th><label for="inquiry_title">문의 제목</label></th>
							<td><input type="text" id="inquiry_title" name="inquiry_title"
								maxlength="50" placeholder="제목을 입력해 주세요."></td>
						</tr>

						<tr>
							<th><label for="inquiry_content">문의 내용</label></th>
							<td height="300px"><textarea id="inquiry_content" class="form-control input-border-bottom" name="inquiry_content"
									placeholder="문의 내용을 입력하세요." rows="10" word-break:break-all> </textarea></td>
						</tr>
						
						<tr>
							<td colspan="2"><br>
								<div class="complete_cancel" align="center">
									<input type="submit" id="qna_submit" value="등록"> 
									<input type="reset" id="qna_reset" value="취소" onclick="window.parent.location='qnaList';">
								</div></td>
						</tr>
					</table>
					
				</form>
			</div>
			
</body>
</html>