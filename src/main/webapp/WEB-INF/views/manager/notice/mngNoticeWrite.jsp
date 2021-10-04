<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>코스모 뱅크</title>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<%@ include file="/WEB-INF/views/include/setting.jsp" %>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />		
		</sec:authorize>
		
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. </br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				
				<div class="notice">
					<form action="mngNoticeWriteAction" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="notice_writer" value = "${notice_writer}">
					<input type="hidden" name="pageNum" value ="${pageNum}">
					<!-- 관리자 공지사항 -->
						<h2 align="center"> 공지사항 글쓰기!!</h2>
						<table style="width:1000px; margin:auto">
							<tr style="border-bottom: 1px solid #444444; width:500px;">
								<th align="center">
									글제목 : 
								</th>
								<td align="center" colspan="3">
									<input type="text" name="notice_subject" size="80px"/>
								</td>
							</tr>
							<tr style="border-bottom: 1px solid #444444; width:500px;">
								<th> 작성자 : </th>
								<td>${notice_writer} </td>
								<th> 비밀번호 : </th>
								<td>
									<input type="password" name="notice_password" />
								</td>
							</tr>
							<tr style = "border-bottom: 1px solid #444444; width:500px; text-align:center">
								<th> 글내용 : </th>
								<td colspan="3" style="width:800px">
									<textarea rows="10" cols="50" name="notice_content" word-break:break-all></textarea>
								</td>
							</tr>
							<tr style="text-align:center; border-spacing:0 20px">
								<th colspan="4">
									<button type="submit" value="글쓰기완료"> 글쓰기 완료 </button>
									<button type="button" value="취소" onclick="window.history.back();"> 취소 </button>
								</th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
 
</body>
</html>