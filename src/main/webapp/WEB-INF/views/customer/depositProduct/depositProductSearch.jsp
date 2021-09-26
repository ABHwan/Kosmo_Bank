<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 페이지 - 예금 상품 검색 조회</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
    
<script type="text/javascript">
      $(function() {
			$("#all_check").change(function() {
				var is_check = $("#all_check").is(":checked");
				$(".user_check").prop("checked", is_check);
				
			});
	  });
      
      function fn_process(val){
    	  var form = document.depositProductForm
    	  if(val == '1'){
    		  // 회원정보수정시
    		  form.action = "";
    		  form.submit();
    	  }else{
    		  form.action = "depositProductDelete";
    		  form.submit();
    	  }
      }
</script>
<script>
	var msg = "<%=request.getAttribute("msg") %>";
	if(msg != 'null'){
		 alert(msg);
	}
</script>
</head>
<body>
<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/headerB.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

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
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. </br>
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>

				<section id="main">
			      <div class="main__container">
			      <h2 class="title">예금 상품 리스트</h2>
			       
					<form action="depositProductSearch.do" method="post" class="contents__top2" name="searchForm">
			          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          <input type="search" name="search" placeholder="예금상품검색" />
			          <button type="submit">
			            <i class="fas fa-search"></i>
			          </button>
			        </form>
			        
			        <div class="contents__middle">
			          <div>전체 예금 상품 수 ${cnt}건</div>
			        </div>
			        <form action="depositDetail.do" name="depositProductForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	 <input type="hidden" name="pageNum" value="${pageNum}">
			         <input type="hidden" name="number" value="${number}">
			        <table class="admin__table">
			          <tr class="table__head">
			            <th>번호</th>
			            <th>상품명</th>
			            <th>상품요약</th>
			            <th>금리</th>
			            <th>종류</th>
			            <th>최소기간</th>
			            <th>최대기간</th>
			            <th>최소금액</th>
			            <th>은행코드</th>
			            <th>등록일</th>
			            <th>상세정보</th>
			          </tr>
			          <c:if test="${cnt > 0}">
			          	<c:forEach var="dto" items="${dtos}">
				         <tr>
				           <td>${number}
				           		<c:set var="number" value="${number - 1}" />
				           </td>
				           <td>${dto.deposit_product_name} <input type="hidden" name="deposit_product_name" class="user_check" value="${dto.deposit_product_name}"></td>
				           <td>${dto.deposit_product_summary}</td>
				           <td>${dto.deposit_product_interRate}%</td>
				           <td>
					           <c:if test="${dto.deposit_product_type==1}">
					           	복리
					           </c:if>
					           
					           <c:if test="${dto.deposit_product_type!=1}">
					           	단리
					           </c:if>
					       </td>
				           <td>${dto.deposit_product_minDate}개월</td>
				           <td>${dto.deposit_product_maxDate}개월</td>
				           <td><fmt:formatNumber value="${dto.deposit_product_minPrice}" type="number"/>원</td>
				           <td>
				           		<c:choose>
				           			<c:when test="${dto.deposit_product_bankCode==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${dto.deposit_product_bankCode==1}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${dto.deposit_product_bankCode==2}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${dto.deposit_product_bankCode==3}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${dto.deposit_product_bankCode==4}">
				           				기업은행
				           			</c:when>
				           			<c:when test="${dto.deposit_product_bankCode==5}">
				           				하나은행
				           			</c:when>
				           		</c:choose>
				           </td>
				           <td>${dto.deposit_product_date}</td>
				           <td><input type="submit" class="btn btn-link" value="상세"></td>
				         </tr>
				        </c:forEach>
				      </c:if>
				      
				      <!-- 게시글이 없으면 -->
			          <c:if test="${cnt == 0}">
			          	<td colspan="6" align="center">
								검색된 예금 상품이 없습니다.
						</td>
			          </c:if>
			        </table>
			        </form>
			        
			        <div class="pagenation">
			          <ul>
			          	<!-- 게시글이 있으면 -->
			          	<c:if test="${cnt > 0}">
				            <li>
					            <!-- 처음[◀◀] / 이전블록[◀] /  -->
								<c:if test="${startPage > pageBlock}">
									<a href="depositProductSearch"> [◀◀] </a>
									<a href="depositProductSearch?pageNum=${startPage - pageBlock}"> [◀] </a>
								</c:if>
				            </li>
				            
				            <li>
				              <!-- 블록내의 페이지번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									
									<c:if test="${i != currentPage}">
										<a href="depositProductSearch?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
				            </li>
				            <li>
					            <!-- 다음블록[▶] / 마지막▶[▶] -->
								<c:if test="${pageCount > endPage}">
									<a href="depositProductSearch?pageNum=${startPage + pageBlock}"> [▶] </a>
									<a href="depositProductSearch?pageNum=${pageCount}"> [▶▶] </a>
								</c:if>
							</li>
							
				         </c:if>
			          </ul>
			        </div>	
			        
			    </section>
			    
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footerB.jsp" />
	
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