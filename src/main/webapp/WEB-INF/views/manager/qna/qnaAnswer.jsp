<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="UTF-8">
<title>답변달기</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${rePath}css/user/qnaWrite.css">
</head>
<body>
	<table class="qna_table">
		<tr class="qna_top">
			<th id="inquiry_id">번호</th>
			<th id="inquiry_title">제목</th>
			<th id="inquiry_regDate">문의글 등록일</th>
			<th>답변하기</th>
		</tr>
		<tr class="hide">
			<!-- 문의 번호 -->
			<td>${number}<c:set var="number" value="${number - 1}" /> <!-- qna_seq 번호 -->
				<input type="hidden" name="h_No" value="${dto.inquiry_id}">
			</td>

			<%--    <!-- 상세페이지 -->
						            	<a href="boardDetail.bo?num=${dto.num}&pageNum=${pageNum}&number=${number + 1}">${dto.getSubject()}</a> --%>
			<!-- 문의 제목 [문의유형] 제목 -->
			<td id="subject_sub">${dto.inquiry_title}</td>

			<!-- 문의 등록일 -->
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${dto.inquiry_regDate}" /></td>
			<form action="qnaAnswerAction" method="post">
				<table>
					<tr>
						<th><label for="subject">제목</label></th>
						<td><input type="search" id="subject" name="subject"
							maxlength="50" placeholder="제목을 입력해 주세요."></td>
					</tr>

					<tr>
						<th><label for="question">문의답변 내용</label></th>
						<td><textarea id="question" name="question"
								placeholder="문의 내용을 입력하세요." word-break:break-all> </textarea></td>
					</tr>

					<tr>
						<td colspan="2"><br>
							<div class="complete_cancel" align="center">
								<input type="submit" id="qna_submit" value="등록"> <input
									type="reset" id="qna_reset" value="취소"
									onclick="window.parent.location='qnaList_mng';">
							</div></td>
					</tr>
				</table>
			</form>
</body>
</html>