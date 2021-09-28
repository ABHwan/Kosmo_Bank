<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 적금 상품 조회</title>
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
    	  var form = document.savingProductForm
    	  if(val == '1'){
    		  // 회원정보수정시
    		  form.action = "";
    		  form.submit();
    	  }else{
    		  form.action = "savingProductDelete";
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
		<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />

		<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
				
				<section id="main">
			      <div class="main__container">
			      <h2 class="title">적금 상품 리스트</h2>
			      <hr>
			       
					<form action="savingProductSearch" method="post" class="contents__top2" name="searchForm">
			          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			          <input type="hidden" name="pageNum" value="${pageNum}">
			          <input type="search" name="search" placeholder="적금상품검색" />
			          <button type="submit">
			            <i class="fas fa-search"></i>
			          </button>
			        </form>
			        
			        <div class="contents__middle">
			          <div>전체 적금 상품 수 ${cnt}건</div>
			        </div>
			        <form action="" name="savingProductForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			        <table class="admin__table">
			          <tr class="table__head">
			            <th class="zero"><input type="checkbox" id="all_check"></th>
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
			          </tr>
			          <c:if test="${cnt > 0}">
			          	<c:forEach var="dto" items="${dtos}">
				         <tr>
				           <td><input type="checkbox" name="check" class="user_check" value="${dto.saving_product_name}" /></td>
				           
				           <td>${number}
				           		<c:set var="number" value="${number - 1}" />
				           </td>
				           <td><a href="savingProductInfo?pageNum=${currentPage}&saving_product_name=${dto.saving_product_name}">${dto.saving_product_name}</a></td>
				           <td>${dto.saving_product_summary}</td>
				           <td>${dto.saving_product_interRate}%</td>
				           <td>
					           <c:if test="${dto.saving_product_type==0}">
					           	복리
					           </c:if>
					           
					           <c:if test="${dto.saving_product_type!=0}">
					           	단리
					           </c:if>
					       </td>
				           <td>${dto.saving_product_minDate}개월</td>
				           <td>${dto.saving_product_maxDate}개월</td>
				           <td><fmt:formatNumber value="${dto.saving_product_minPrice}" type="number"/>원</td>
				           <td>
				           		<c:choose>
				           			<c:when test="${dto.saving_product_bankCode==0}">
				           				미기재
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==5}">
				           				하나은행
				           			</c:when>
				           			<c:when test="${dto.saving_product_bankCode==6}">
				           				코스모은행
				           			</c:when>
				           		</c:choose>
				           </td>
				           <td>${dto.saving_product_date}</td>
				         </tr>
				        </c:forEach>
				      </c:if>
				      
				      <!-- 게시글이 없으면 -->
			          <c:if test="${cnt == 0}">
			          	<td colspan="6" align="center">
								등록된 예금 상품이 없습니다.
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
									<a href="savingProductList"> [◀◀] </a>
									<a href="savingProductList?pageNum=${startPage - pageBlock}"> [◀] </a>
								</c:if>
				            </li>
				            
				            <li>
				              <!-- 블록내의 페이지번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									
									<c:if test="${i != currentPage}">
										<a href="savingProductList?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
				            </li>
				            <li>
					            <!-- 다음블록[▶] / 마지막▶[▶] -->
								<c:if test="${pageCount > endPage}">
									<a href="savingProductList?pageNum=${startPage + pageBlock}"> [▶] </a>
									<a href="savingProductList?pageNum=${pageCount}"> [▶▶] </a>
								</c:if>
							</li>
							
				         </c:if>
			          </ul>
			        </div>	
			        
			       <div class="contents__bottom">
			          <div class="bottom__one">
			           <!--  <button onclick="javascript:fn_process('1')">회원정보 수정</button> -->
			            <button onclick="javascript:fn_process('2')">적금상품 삭제</button>
			          </div>
			        </div>
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