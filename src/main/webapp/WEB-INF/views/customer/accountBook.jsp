<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>나만의 가계부</title>
<!-- CSS -->
<link rel="stylesheet" href="${rePath}css/manager/admin1.css" />

<!-- 풀캘린더 -->
<link href="${rePath}fullcalendar/lib/main.css" rel='stylesheet' />
<script src="${rePath}fullcalendar/lib/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
    
    Date.prototype.yyyymmdd = function() {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();
        return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
    }

    Date.prototype.format = function(f) {
        if (!this.valueOf()) return " ";
     
        var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
        var d = this;
         
        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
            switch ($1) {
                case "yyyy": return d.getFullYear();
                case "yy": return (d.getFullYear() % 1000).zf(2);
                case "MM": return (d.getMonth() + 1).zf(2);
                case "dd": return d.getDate().zf(2);
                case "E": return weekName[d.getDay()];
                case "HH": return d.getHours().zf(2);
                case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
                case "mm": return d.getMinutes().zf(2);
                case "ss": return d.getSeconds().zf(2);
                case "a/p": return d.getHours() < 12 ? "오전" : "오후";
                default: return $1;
            }
        });
    };
     
    String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
    Number.prototype.zf = function(len){return this.toString().zf(len);};
    
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	headerToolbar: {
                left: '',
                center: 'title',
                right: 'prev,next today'
              },
              
              navLinks: true, // can click day/week names to navigate views
              selectable: true, 
              selectMirror: true,
             select: function(arg) {
                var title = prompt('수입액을 입력해주세요!(금액만)');
                if(isNaN(title)){
                	alert('숫자만 입력가능합니다.');
                	return;
                }
                var title2 = prompt('지출액을 입력해주세요!(금액만)');
                if(isNaN(title2)){
                	alert('숫자만 입력가능합니다.');
                	return;
                }
                if (!title) {
                	title = 0;
                }
                if (!title2) {
                	title2 = 0;
                }
                
                calendar.addEvent({ 
                    title:  '수입 : ' + title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                })
                
                calendar.addEvent({ 
                      title:  '지출 : ' + title2,
                      start: arg.start,
                      end: arg.end,
                      allDay: arg.allDay
                })
                var params = {};
                $("#register_date").val(arg.start.format("yyyyMMdd"));
                $("#income").val(title);
                $("#expense").val(title2);
                $("#accountBookform").submit();

                //calendar.unselect()
              },
              eventClick: function(arg) {
                if (confirm('해당내역을 삭제하시겠습니까?')) {
					$("#register_date").val(arg.event.start.format("yyyyMMdd"));
					$("#accountBookform").attr("action", "deleteAccountBook");
					$("#accountBookform").submit();
                }
              }, 
              editable: true, 
              dayMaxEvents: true, // allow "more" link when too many events
              events: [
            	 
                
              ]
            });
        var arr = new Array();
        <c:forEach var="vo" items="${list}">
        	arr.push(
        			{register_date:"${vo.register_date}",income:"${vo.income}",expense:"${vo.expense}"}	
        	);
        </c:forEach>
        
        <c:forEach var="vo" items="${list}">
	        calendar.addEvent({ 
	            title:  '1. 수입액 : ' + "${vo.income}" +'원',
	            start: "${vo.register_date}",
	            end: "${vo.register_date}",
	        })
	        
	        calendar.addEvent({ 
	              title:  '2. 지출액 : ' + "${vo.expense}"+'원',
	              start: "${vo.register_date}",
	              end: "${vo.register_date}",
        	})
         	calendar.addEvent({ 
	              title:  '3. 정산액 : ' + "${vo.total}"+'원',
	              start: "${vo.register_date}",
	              end: "${vo.register_date}",
        	})
    	</c:forEach>
	        
	    <c:forEach var="au" items="${auto}">
	        calendar.addEvent({ 
	            title:  '자동이체 : '+"${au.auto_inplace}"+ ' 납부완료',
	            start: "${au.auto_date}",
	            end: "${au.auto_date}",
	        })
    	</c:forEach>
	        
        calendar.render();
    });
    </script>
</head>
<body>
	<!-------------------- header 시작 ------------------>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		
		<!-- 메인 폼-->
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
					<!-- 가계부 컨텐츠 -->
					<section id="main">
			     	 <div class="main__container">
			      	 <h2 class="title">나만의 가계부</h2>
					    <form action="insertAccountBook" id="accountBookform">
					    <input type="hidden" name="register_date" id="register_date"/>
					    <input type="hidden" name="income" id="income"/>
					    <input type="hidden" name="expense" id="expense"/>
							    
					       <div class="container">
					         <div id='calendar'>
					   		 </div>
					       </div>
					       <br/><br/>
						  <table class="admin__table">
					          <tr class="table__head">
					            <th>해당 월</th>
					            <th>누적 지출액</th>
					            <th>평균 지출액</th>
					            <th>누적 수입액</th>
					            <th>평균 수입액</th>
					            <th>한달 정산액</th>
					          </tr>
					          <c:if test="${report.size()==0}">
					          	<tr>
					          		<td colspan="6">아직 가계부를 이용하지 않으시네요! 가계부를 작성하고 꼼꼼한 자산관리 시작해보세요!</td>
					          	</tr>
					          </c:if>
					          <c:if test="${report.size()!=0}">
						          	<c:forEach var="vo" items="${report}">
						          		<c:set var="expense" value="${vo.expense/30}"/> 
	    								<c:set var="income" value="${vo.income/30}"/> 
						          		<tr>
						          			<td> ${fn:substring(vo.register_date,0,4)}년 ${fn:substring(vo.register_date,4,6)}월</td>
						          			<td><fmt:formatNumber value="${vo.expense}" type="number"/>원</td>
						          			<td><fmt:formatNumber value ="${expense}" pattern="0" />원</td>
						          			<td><fmt:formatNumber value="${vo.income}" type="number"/>원</td>
						          			<td><fmt:formatNumber value ="${income}" pattern="0" />원</td>
						          			<td><fmt:formatNumber value="${vo.total}" type="number"/>원</td>
						          		</tr>
						          		<c:if test="${vo.total<0}">
						          		<tr>
						          			<td colspan="6">${fn:substring(vo.register_date,0,4)}년 ${fn:substring(vo.register_date,4,6)}월
						          			에는 소비가 더 컸네요! 올바른 소비습관을 위해 KOSMO BANK의 자산관리 서비스를 이용해보는 건 어떨까요?</td>
						          		</tr>
						          		</c:if>
									</c:forEach>
								</c:if>
				            </table>
					    </form>
					    </div>
					</section>
					
				</div>
			</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	
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

	<jsp:include page="/WEB-INF/views/include/chatbot.jsp" />
</body>
</html>