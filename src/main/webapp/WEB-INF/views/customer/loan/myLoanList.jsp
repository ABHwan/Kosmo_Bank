<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 상환 목록 조회 - 고객</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />


</head>
<body>
<!-- 메인 콘텐츠 -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div class="main-panel">
			<div class="content">
				<!-- 고정헤더 -->
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner">
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
				
				<section id="main">
			      <div class="main__container" style="width: 95%;">
			      <h2 class="title">대출 상환 목록</h2>
			       <div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
			        <div class="contents__middle">
			          <div>대출 상환 목록 ${cnt} 건 </div>
			        </div>
			        <table class="display table table-striped table-hover dataTable">
			          <tr class="sorting">
			            <th>번호</th>
			            <th>대출 번호</th>
			            <th>이체 번호</th>
			            <th>대출 상환 일자</th>
			            <th>대출 상환 종류</th>
			            <th>대출 상환 금액</th>
			            <th>납입 원금</th>
			            <th>납입 이자</th>
			          </tr>
			          <c:if test="${cnt > 0}">
			          	<c:forEach var="l" items="${loanPay}">
				         <tr>
				           <td>${number}
				           		<c:set var="number" value="${number - 1}" />
				           </td>
				          <td>
				          	${l.loan_id}
				          </td>
				          <td>
				          	${l.transfer_id}
				          </td>
				          <td>
				          	${l.loan_history_date}
				          </td>
				          <td>
				          <%-- <c:if t   1이자/2원금/3중도상환+수수료/4해지로 인한 원금 상환--%>
				          <c:if test="${l.loan_history_state == 1}">
				          	이자
				          </c:if>
				          <c:if test="${l.loan_history_state == 1}">
				          	원금
				          </c:if>
				          <c:if test="${l.loan_history_state == 1}">
				          	중도상환 , 수수료
				          </c:if>
				          <c:if test="${l.loan_history_state == 1}">
				          	해지
				          </c:if>
				          
				          
				          </td>
				       	  <td>
				       	  <fmt:formatNumber value="${l.loan_history_amount}"/>원
				       	  </td>
				           <td>
				           <fmt:formatNumber value="${l.loan_history_tranAmount}"/>원
				           </td>
				           <td>
				           <fmt:formatNumber value="${l.loan_history_tranInterest}"/>원 
				           </td>
				         </tr>
				        </c:forEach>
				      </c:if>
				      
				      <!-- 게시글이 없으면 -->
			          <c:if test="${cnt == 0}">
			          	<td colspan="6" align="center">
								해당 대출상품의 상환 내역이 없습니다.
						</td>
			          </c:if>
			        </table>
			        </div>
			       
			        <div class="pagenation">
			          <ul>
			          	   <!-- paging -->
                           <ul class="pagination pg-primary mt-5">
                           <c:if test="${cnt > 0}">
                              <!-- 이전블록[«] -->
                              <c:if test="${startPage > pageBlock}">
                                 <li class="page-item">
                                    <a class="page-link" href="loanProductList?pageNum=${startPage - pageBlock}" aria-label="Previous">
                                       <span aria-hidden="true">«</span>
                                       <span class="sr-only">Previous</span>
                                    </a>
                                 </li>   
                              </c:if>
                              
                              <!-- 블록 내의 페이지 번호 -->
                              <c:forEach var="i" begin="${startPage}" end="${endPage}" >
                                 <c:if test="${i == currentPage}">
                                    <li class="page-item active">
                                       <a class="page-link" href="loanProductList?pageNum=${i}">${i}</a>
                                    </li>
                                 </c:if>
                                 
                                 
                                 <c:if test="${i != currentPage}">
                                    <li class="page-item">
                                       <a class="page-link" href="loanProductList?pageNum=${i}">${i}</a>
                                    </li>
                                 </c:if>
                              </c:forEach>
                              
                              <!-- 다음블록[»] -->
                              <c:if test="${pageCount > endPage}" >
                                 <li class="page-item">
                                    <a class="page-link" href="loanProductList?pageNum=${startPage + pageBlock}" aria-label="Next">
                                       <span aria-hidden="true">»</span>
                                       <span class="sr-only">Next</span>
                                    </a>
                                 </li>
                              </c:if>
                           </c:if>
                           </ul>
                           <!-- paging -->
                           </ul>
			        </div>
			        </div>
			        </div>
			        </div>
			        
			       
			      </div>
			    </section>
			    
			</div>
		</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	<!--   Core JS Files   -->
	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="${rePath}js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="${rePath}js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="${rePath}js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="${rePath}js/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="${rePath}js/setting-demo.js"></script>
	<script src="${rePath}js/demo.js"></script>
</body>
</html>