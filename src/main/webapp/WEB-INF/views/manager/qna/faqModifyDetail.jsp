<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>수정 상세보기</title>
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
</head>
<body>
<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<h4 class="page-title">자주하는 질문(FAQ) 수정</h4>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">수정</div>
								</div>
								<div class="card-body">
									<form action="faqModifyAction" method="post">
									<sec:csrfInput />
									<input type="hidden" name ="pageNum"value="${pageNum}">
									<input type="hidden" name="faq_id" value="${dto.faq_id }">
									<table class="table table-hover">
											<tr height="100px">
												<th><label for="faq_title"><strong>문의 제목</strong></label>
												<input type="text" id="faq_title" name="faq_title" class="form-control form-control"
													maxlength="150" value="${dto.faq_title}"></th>
											</tr>

											<tr height="200px">
												<th><label for="faq_content"><strong>문의 내용</strong></label>
												<textarea id="faq_content" class="form-control form-control" name="faq_content"
														placeholder="문의 내용을 입력하세요." word-break:break-all>${dto.faq_content}</textarea></th>
											</tr>
									
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