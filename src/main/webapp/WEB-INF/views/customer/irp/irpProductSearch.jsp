<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연금 상품 목록 - 고객</title>
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
			      <div class="main__container" style="width: 95%;">
			      <h2 class="title">연금 상품 리스트</h2>
			        <div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
					<form action="irpProductSearch.do" method="post" class="contents__top2" name="searchForm">
						<sec:csrfInput/>
			          <input type="search" name="search" placeholder="연금상품검색" />
			          <button type="submit">
			            <i class="fas fa-search"></i>
			          </button>
			        </form>
			        
			        <div class="contents__middle">
			          <div>전체 연금 상품 수 ${cnt}건</div>
			        </div>
			        <form action="irpDetail.do" name="irpProductForm">
			        <sec:csrfInput/>
			         <input type="hidden" name="pageNum" value="${pageNum}">
			         <input type="hidden" name="number" value="${number}">
			        <table class="display table table-striped table-hover dataTable">
			          <tr class="sorting">
			            <th>번호</th>
			            <th>상품명</th>
			            <th>상품요약</th>
			            <th>금리</th>
			            <th>연금 금액 </th>
			            <th>연금 납입(가입) 기간</th>
			            <th>은행코드</th>
			            <th>등록일</th>
			          </tr>
			          <c:if test="${cnt > 0}">
			          	<c:forEach var="dto" items="${dtos}">
				         <tr>
				           <td>${number}
				           		<c:set var="number" value="${number - 1}" />
				           </td>
				            <td>
				          <a href="irpDetail.do?irp_product_name=${dto.irp_product_name}&pageNum=${pageNum}&number=${number + 1}">${dto.irp_product_name}</a>
				          </td>
				           <td>${dto.irp_product_summary}</td>
				           <td>${dto.irp_product_interRate}%</td>
				           <td><fmt:formatNumber value="${dto.irp_product_money}" type="number"/>원</td>
				           <td>${dto.irp_product_expiryTerm}개월</td>
				           
				           <td>
				           		<c:choose>
				           			<c:when test="${dto.irp_product_bankCode==0}">
							           	미기재
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==1}">
				           				국민은행
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==2}">
				           				우리은행
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==3}">
				           				농협은행
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==4}">
				           				신한은행
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==5}">
				           				하나은행 
				           			</c:when>
				           			<c:when test="${dto.irp_product_bankCode==6}">
				           				코스모 뱅크  
				           			</c:when>
				           		</c:choose>
				           </td>
				           <td><fmt:formatDate value="${dto.irp_product_date}" pattern="YYYY-MM-dd"/>
				         </tr>
				        </c:forEach>
				      </c:if>
				      
				      <!-- 게시글이 없으면 -->
			          <c:if test="${cnt == 0}">
			          	<td colspan="6" align="center">
								검색된 연금 상품이 없습니다.
						</td>
			          </c:if>
			        </table>
			        </form>
			        
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
			      </div>
			    </section>
			    
			</div>
		</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
</body>
</html>