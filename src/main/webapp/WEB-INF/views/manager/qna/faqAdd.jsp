<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>자주묻는 질문 게시판</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon" />
<!-- CSS Files -->
<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
<link rel="stylesheet" href="${rePath}css/atlantis.min.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="${rePath}css/demo.css">
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
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">자주하는 질문(FAQ) 등록</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">자주하는 질문 등록</div>
								</div>
								<div class="card-body">
									<form action="faqAddAction" method="post">
									<sec:csrfInput />
									<input type="hidden" name ="pageNum"value="${pageNum}">
									<table class="table table-hover">
										<thead>
											<tr height="100px">
												<th><label for="faq_title"><strong>문의 제목</strong></label>
												<input type="text" id="faq_title" name="faq_title" class="form-control form-control"
													maxlength="150" placeholder="제목을 입력해 주세요."></th>
											</tr>

											<tr height="200px">
												<th><label for="faq_content"><strong>문의 내용</strong></label>
												<textarea id="faq_content" class="form-control form-control" name="faq_content"
														placeholder="문의 내용을 입력하세요." rows="20" word-break:break-all> </textarea></th>
											</tr>
											
										</tbody>
										</table>
										<div align ="right"> 
										<input type="submit" class="btn btn-info" value="등록">
										<input type="button" onclick="window.location='faq?pageNum=${pageNum}'" class="btn btn-info" value="돌아가기">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>