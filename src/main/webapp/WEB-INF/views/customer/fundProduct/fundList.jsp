<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀드 상품 목록 조회 - 고객</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
<link rel="stylesheet" href="${rePath}css/manager/fund.css" />
<script type="text/javascript">
      $(function() {
			$("#all_check").change(function() {
				var is_check = $("#all_check").is(":checked");
				$(".user_check").prop("checked", is_check);
				
			});
	  });
      
      function fn_process(val){
    	  var form = document.fundProductForm
    	  if(val == '1'){
    		  // 회원정보수정시
    		  form.action = "";
    		  form.submit();
    	  }else{
    		  form.action = "fundProductDelete";
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
<!-- 메인 콘텐츠 -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div class="main-panel">
			<div class="content">
				<!-- 고정헤더 -->
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1> <br/>
								<h2 class="text-white op-7 mb-2">KOSMO BANK에 오신 것을 환영합니다.<br/>
									저희는 고객님의 <strong>자산관리</strong>를 효율적이고, 안전하게 도와드립니다. <br />
									또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게 통합하여 금융상품을 이용하실 수 있습니다.</h2>
							</div>
						</div>
					</div>
				</div>
				<section id="main">
			      <div class="main__container">
			      <h2 class="title">펀드 상품 리스트</h2>
			       
					<form action="fundProductSearch.do" method="post" class="contents__top2" name="searchForm">
						<sec:csrfInput/>
			          <input type="search" name="search" placeholder="펀드상품검색" />
			          <button type="submit">
			            <i class="fas fa-search"></i>
			          </button>
			        </form>
			        
			        <div class="contents__middle">
			          <div>전체 펀드 상품 수 ${cnt}건</div>
			        </div>
			       <!-- 카테고리 -->
			        <div class="contents_middle_id">
			        	<div class="col-md-4 ml-auto mr-auto">
				        	<ul class="icon_tab" style="transform: translateX(0px);">
				        		<li data-index="0">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/테크가전.png')"></div>
											</div>
										</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">테크·가전</span></div>
				        			</button>
				        		</li>
				        		<li data-index="1">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/패션잡화.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">패션·잡화</span></div>
				        			</button>
				        		</li>
				        		<li data-index="2">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/뷰티.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">뷰티</span></div>
				        			</button>
				        		</li>
				        		<li data-index="3">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/푸드.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">푸드</span></div>
				        			</button>
				        		</li>
				        		<li data-index="4">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/홈리빙.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">홈리빙</span></div>
				        			</button>
				        		</li>
				        		<li data-index="5">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/여행레져.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">여행·레져</span></div>
				        			</button>
				        		</li>
				        		<li data-index="6">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/스포츠모빌리티.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">스포츠·모빌리티</span></div>
				        			</button>
				        		</li>
				        		<li data-index="7">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/캐릭터굿즈.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">캐릭터·굿즈</span></div>
				        			</button>
				        		</li>
				        		<li data-index="8">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/베이비키즈.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">베이비·키즈</span></div>
				        			</button>
				        		</li>
				        		<li data-index="9">
				        			<button class="imgTab">
				        				<div class="imgTab_in">
					        				<div class="imgTab_thumnail">
					        					<div class="imgTab_thumnail_in" style="background-image: url('../resources/images/admin/fund/반려동물.png')"></div>
					        				</div>
					        			</div>
					        				<div class="imgTab_span"><span class="imgTab_span_in">반려동물</span></div>
				        			</button>
				        		</li>
				        	</ul>
				        </div>
			        </div>
			        
			        <div class="all">전체</div>
			        
			        <form action="" name="depositProductForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			        <div class="Main" style="margin-bottom: 80px;">
			        	<div class="Main_container"> <!-- style="width: calc(100% -0px);" -->
			        		<c:forEach var="dto" items="${dtos}">
			        		<div class="Main_container_in">
								<%-- <c:forEach var="dto" items="${dtos}"> --%>
				        		<div class="Main_container_init">
				        				<a class="Main_a" href="fundDetail?pageNum=${currentPage}&fund_title=${dto.fund_title}">
				        				<div class="Main_span">
				        					<div class="Main_span_in"><img src="${dto.fund_filename}" width="100%" height="100%"></div>
				        				</div>
				        				</a>
				        				<div class="Main_content">
				        					<div><fmt:formatDate value="${dto.fund_start_date}" type="date" /> ~ <fmt:formatDate value="${dto.fund_end_date}" type="date"/></div>
				        					<div>${dto.fund_summary}</div>
				        					<div>${dto.fund_category} | ${dto.fund_mem_name}</div>
				        				</div>
				        		</div>
				        	</div>
				        	</c:forEach>
			        	</div>
			        </div>
			        
			        <div class="pagenation">
			          <ul>
			          	<!-- 게시글이 있으면 -->
			          	<c:if test="${cnt > 0}">
				            <li>
					            <!-- 처음[◀◀] / 이전블록[◀] /  -->
								<c:if test="${startPage > pageBlock}">
									<a href="fundList"> [◀◀] </a>
									<a href="fundList?pageNum=${startPage - pageBlock}"> [◀] </a>
								</c:if>
				            </li>
				            
				            <li>
				              <!-- 블록내의 페이지번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									
									<c:if test="${i != currentPage}">
										<a href="fundList?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
				            </li>
				            <li>
					            <!-- 다음블록[▶] / 마지막▶[▶] -->
								<c:if test="${pageCount > endPage}">
									<a href="fundList?pageNum=${startPage + pageBlock}"> [▶] </a>
									<a href="fundList?pageNum=${pageCount}"> [▶▶] </a>
								</c:if>
							</li>
							
				         </c:if>
			          </ul>
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