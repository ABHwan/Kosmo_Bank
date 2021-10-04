<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 신청완료 페이지</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />
<script>
</script>
</head>
<body>

	<!-- <div class="wrapper">
		<div class="main-header"> -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<!-- 메인 폼-->
		<div class="main-panel">
			<div class="content">
			
				<section id="main">
			      <div class="main__container">
					<h2 class="title">적금상품 구매완료</h2>
					<div class="row">
						<div class="col">
							<div class="card">
								<div class="card-header">
									<div class="card-title">${dto.saving_product_name}</div>
								</div>
								<div class="card-body">
									 <form action="savingProductInsert" name="savingProductForm">
									 	<sec:csrfInput/>
								         <input type="hidden" name="pageNum" value="${pageNum}">
								         <input type="hidden" name="number" value="${number}">
						        <table class="admin__table">
						          <tr>
						            <th class="table__head">적금상품이름</th>
						             <td>${dto.saving_product_name} 
						             <input type="hidden" name="saving_product_name" class="user_check" value="${dto.saving_product_name}">
						             </td>
						          </tr>
						          <tr>
						            <th class="table__head">계좌번호</th>
						            <td>${dto.saving_product_explanation}
						            <input type="hidden" name="saving_product_explanation" class="user_check" value="${dto.saving_product_explanation}">
						            </td>
						          </tr>
						          <tr>
						            <th class="table__head">적금 가입날짜</th>
						              <td>${dto.saving_product_interRate}%
						              <input type="hidden" name="saving_product_interRate" class="user_check" value="${dto.saving_product_interRate}">
						              </td>
						          </tr>
						          <tr>
						          	 <th class="table__head">적금 상태</th>
						          	 <td>
						          	 <c:if test="${dto.saving_product_type==0}">
								           	복리
								           </c:if>
								           
								           <c:if test="${dto.saving_product_type!=0}">
								           	단리
								           </c:if>
								           <input type="hidden" name="saving_product_type" class="user_check" value="${dto.saving_product_type}">
						          	 </td>
						           </tr>
						           <tr>
							           <th class="table__head">적금 금리</th>
							           <td>${dto.saving_product_minDate}개월
							           <input type="hidden" name="saving_product_minDate" class="user_check" value="${dto.saving_product_minDate}">
							           </td>
						           </tr>
						           
						           <tr>
						           		<th class="table__head">적금 종류</th>
						           		<td>${dto.saving_product_maxDate}개월
						           		<input type="hidden" name="saving_product_maxDate" class="user_check" value="${dto.saving_product_maxDate}">
						           		</td>
						           </tr>
						           
						           <tr>
						           		<th class="table__head">총 납입 금액</th>
						           		<td><fmt:formatNumber value="${dto.saving_product_minPrice}" type="number"/>원
						           		<input type="hidden" name="saving_product_minPrice" class="user_check" value="${dto.saving_product_minPrice}">
						           		</td>
						           </tr>
						           
						           <tr>
						           		<th class="table__head">만기시 이자</th>
						           		<td>${dto.saving_product_maxDate}개월
						           		<input type="hidden" name="saving_product_maxDate" class="user_check" value="${dto.saving_product_maxDate}">
						           		</td>
						           </tr>
						           
						      	   <tr>
						                <th class="table__head">적금방법</th>
						                <td>${dto.saving_product_notice}
						                <input type="hidden" name="saving_product_notice" class="user_check" value="${dto.saving_product_notice}">
						                </td>
						           </tr>
						      		
						      		<tr>
						      			<th class="table__head">만기일</th>
						      			<td>
							           		<input type="hidden" name="saving_product_bankCode" class="user_check" value="${dto.saving_product_bankCode}">
							           </td>
						      		</tr>
						      		
						      		<tr>
						      			 <th class="table__head">등록일</th>
						      			 <td>${dto.saving_product_date}
						      			 <input type="hidden" name="saving_product_date" class="user_check" value="${dto.saving_product_date}">
						      			 </td>
						      		</tr>
						        </table>
						        <div align ="right">
						          	<input type="submit" class="btn btn-primary btn-border" value="적금상품 신청하기" >
						        </div>
			        </form>
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>

	<script src="${rePath}js/core/jquery.3.2.1.min.js"></script>
	<script src="${rePath}js/core/popper.min.js"></script>
	<script src="${rePath}js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script
		src="${rePath}js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${rePath}js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${rePath}js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="${rePath}js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script
		src="${rePath}js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="${rePath}js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="${rePath}js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="${rePath}js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

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
	<script>
		Circles.create({
			id : 'circles-1',
			radius : 45,
			value : 60,
			maxValue : 100,
			width : 7,
			text : 5,
			colors : [ '#f1f1f1', '#FF9E27' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		Circles.create({
			id : 'circles-2',
			radius : 45,
			value : 70,
			maxValue : 100,
			width : 7,
			text : 36,
			colors : [ '#f1f1f1', '#2BB930' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		Circles.create({
			id : 'circles-3',
			radius : 45,
			value : 40,
			maxValue : 100,
			width : 7,
			text : 12,
			colors : [ '#f1f1f1', '#F25961' ],
			duration : 400,
			wrpClass : 'circles-wrp',
			textClass : 'circles-text',
			styleWrapper : true,
			styleText : true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart')
				.getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type : 'bar',
			data : {
				labels : [ "S", "M", "T", "W", "T", "F", "S", "S", "M", "T" ],
				datasets : [ {
					label : "Total Income",
					backgroundColor : '#ff9e27',
					borderColor : 'rgb(23, 125, 255)',
					data : [ 6, 4, 9, 5, 4, 6, 4, 3, 8, 10 ],
				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				legend : {
					display : false,
				},
				scales : {
					yAxes : [ {
						ticks : {
							display : false
						//this will remove only the label
						},
						gridLines : {
							drawBorder : false,
							display : false
						}
					} ],
					xAxes : [ {
						gridLines : {
							drawBorder : false,
							display : false
						}
					} ]
				},
			}
		});

		$('#lineChart').sparkline([ 105, 103, 123, 100, 95, 105, 115 ], {
			type : 'line',
			height : '70',
			width : '100%',
			lineWidth : '2',
			lineColor : '#ffa534',
			fillColor : 'rgba(255, 165, 52, .14)'
		});
	</script>
</html>