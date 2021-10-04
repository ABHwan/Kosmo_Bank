<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ajax 때문에 넣어주기 -->
<sec:csrfMetaTags/>
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.css"/> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
			<!-- 고정헤더 -->
				<div class="panel-header bg-primary-gradient" style="height: 300px;">
					<div class="page-inner py-5">
						<div
							class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h1 class="text-white pb-2 fw-bold">KOSMO BANK</h1>
								<br />
								<h2 class="text-white op-7 mb-2">
									KOSMO BANK에 오신 것을 환영합니다.<br /> 저희는 고객님의 <strong>자산관리</strong>를
									효율적이고, 안전하게 도와드립니다. <br> 또한 <strong>오픈뱅킹</strong> 서비스를 활용하여 보다 편리하게
									통합하여 금융상품을 이용하실 수 있습니다.
								</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- 고정헤더 -->
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">이체</h4>
						<ul class="breadcrumbs">
							<li class="nav-home"><a href="#"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">이체관리</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">이체리스트</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">이체리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="basic-datatables_wrapper"
											class="dataTables_wrapper container-fluid dt-bootstrap4">
											<div class="row">
												<div class="col-md-12">
													<form action="" name="transferForm" method="post">
														<sec:csrfInput/>
														<div class="white-box" id="datatables">
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
					</div>
					</div>
					</div>
					
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
	
</body>

<script type="text/javascript" src="${rePath}js/plugin/moment/moment.js"></script>
<script type="text/javascript" src="${rePath}js/plugin/datatables/datatables.min.js"></script>
<script type="text/javascript">
var currTab;
var csrfData = {};
var csrfParameter;
var csrfToken;
var preventMultiFlag = false;
var attCol = [
	'번호', '거래일시', '출금계좌', '입금계좌', '입금은행', '받는분', '이체금액', '내통장메모', '받는통장메모'
];

$(document).ready(function() {
	
    var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var currLocation = window.location.href;
    
    currLocation = currLocation.toString();
    csrfData[csrfParameter] = csrfToken;
    // 시작 주소로 처음 구분
    console.log(currLocation.split('/')[5]);
    if (currLocation.split('/')[5] == 'transferList') {
        $('#datatables').append('<table id="transferTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;"></table>');
        columns = [
                {
                	'sTitle' : '번호',
                    data : 'rNum'
                }, {
                    'sTitle' : '거래일시',
                    data : 'transfer_inOutDate',
                    render : $.fn.dataTable.render.moment()
                }, {
                    'sTitle' : '출금계좌',
                    data : 'account_id'
                }, {
                    'sTitle' : '입금계좌',
                    data : 'transfer_senderAccount'
                }, {
                    'sTitle' : '입금은행',
                    data : 'transfer_bankCode',
                    render : function(data) {
                       	var str = '';
                       		if(data == 0) {
                       			str = '미기재';
                       		} else if(data == 1) {
                       			str = '국민은행';
                       		} else if(data == 2) {
                       			str = '우리은행';
                       		} else if(data == 3) {
                       			str = '농협은행';
                       		} else if(data == 4) {
                       			str = '신한은행';
                       		} else if(data == 5) {
                       			str = '하나은행';
                       		} else if(data == 6) {
                       			str = '코스모은행';
                       		}
                           return str;
                       }
                }, {
                    'sTitle' : '받는분',
                    data : 'transfer_receiverName'
                }, {
                    'sTitle' : '이체금액',
                    data : 'transfer_money',
                    render : DataTable.render.number( ',' , '.' , 0 , '' , '원' )
                }, {
                    'sTitle' : '내통장메모',
                    data : 'transfer_outComment'
                }, {
                    'sTitle' : '받는통장메모',
                    data : 'transfer_inComment'
                }
        ];

        url = 'transferListSelect';
        callList(url, columns);
    }
});

// SELECT 검색
// 버튼 눌렀을때
$(document).on("click", '#selectAttendacne', function() {
    $(this).parent().parent().find('li').removeClass('active');
    $(this).parent().addClass('active').addClass('nav-hover');
    columns = [
        {
        	'sTitle' : '번호',
            data : 'rNum'
            
        }, {
            'sTitle' : '거래일시',
            data : 'transfer_inOutDate',
            render : $.fn.dataTable.render.moment()
        }, {
            'sTitle' : '출금계좌',
            data : 'account_id'
        }, {
            'sTitle' : '입금계좌',
            data : 'transfer_senderAccount'
        }, {
            'sTitle' : '입금은행',
            data : 'transfer_bankCode',
            render : function(data) {
               	var str = '';
               		if(data == 0) {
               			str = '미기재';
               		} else if(data == 1) {
               			str = '국민은행';
               		} else if(data == 2) {
               			str = '우리은행';
               		} else if(data == 3) {
               			str = '농협은행';
               		} else if(data == 4) {
               			str = '신한은행';
               		} else if(data == 5) {
               			str = '하나은행';
               		} else if(data == 6) {
               			str = '코스모은행';
               		}
                   return str;
               }
        }, {
            'sTitle' : '받는분',
            data : 'transfer_receiverName'
        }, {
            'sTitle' : '이체금액',
            data : 'transfer_money',
            render : DataTable.render.number( ',' , '.' , 0 , '' , '원' )
        }, {
            'sTitle' : '내통장메모',
            data : 'transfer_outComment'
        }, {
            'sTitle' : '받는통장메모',
            data : 'transfer_inComment'
        }
];

    ordering = [			//
        [
                1, 'desc'	//1= 첫번째 열, 'desc'=> 수행문
        ]
    ];
    
    url = 'transferListSelect';
    callList(url, columns, ordering);
});


function callList(url, columns, ordering) {
    $("#datatables").empty();
    $('#datatables').append('<table id="transferTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;" ></table>');
    currTab = $('#transferTable').DataTable({
    	"dom" : '<"top"l>rt<"bottom"ip><"clear">',
        order : ordering,
        ajax : {
            url : url,
            type : 'POST',
            data : csrfData,
            
            dataSrc : ''
        },
        columns : columns,
        destroy : true,
    });

    if (url == 'transferListSelect') {
    	$('.col-md-12').append('<div id="datatable-btn">');
        //$('#datatable-btn').append('<button id="depositProductInsert" class="btn btn-primary"><span class="btn-label"><i class="fa fa-plus"></i></span></button>');
        //$('#datatable-btn').append('<button id="depositProductDelete" class="btn btn-primary btn-border" onclick="javascript:fn_process(2)"><span class="btn-label"><i class="fa fa-plus"></i></span></button>');
        $('#transferTable_length').after(
                '<div id="basic-datatables_filter" class="dataTables_filter" style="text-align: right;"></div>');
        $('#basic-datatables_filter').append('<label for="searchBar">검색 : &nbsp</label>');
        $('#basic-datatables_filter').append(
                '<input type="search" class="form-control form-control-sm" id="searchBar">');
        var searchDiv = $('#basic-datatables_filter').find('label');
        searchDiv.before('<select id="searchAttendance" style="margin-right:10px; height: 31px; color: darkslategray;">');
        for (var i = 0; i < attCol.length; i++) {
            $('#searchAttendance').append('<option value=' + i + '>' + attCol[i] + '</option>');
        }

        //$('#depositProductInsert').append('등록');
        $('#depositProductDelete').append('삭제');
    } else if (url == 'commuteList') {
        $('#datatables').append('<button id="insertCommute">');
        $('#insertCommute').append('신규 등록');
    }
}

$('#transferTable').ready(function() {
    $('#searchAttendance').on('click', function() {
        var searchingText = $('#searchBar').val();
        currTab.search('').columns().search('').draw();
        if (this.value == 0) {
            currTab.search(searchingText).draw();
        } else {
            currTab.columns(this.value).search(searchingText).draw();
        }
    });

    $('#searchBar').on('keyup click', function() {
        var col = $('#searchAttendance').val();
        currTab.search('').columns().search('').draw();
        if (col == 0) {
            currTab.search(this.value).draw();
        } else {
            currTab.columns(col).search(this.value).draw();
        }

    });
});

// 날짜 형식 조정
$.fn.dataTable.render.moment = function(from, to, locale) {
    // Argument shifting
    if (arguments.length === 1) {
        locale = 'en';
        to = from;
        from = 'YYYY-MM-DD';
    } else if (arguments.length === 2) {
        locale = 'en';
    }

    return function(d, type, row) {
        if (!d) { return type === 'sort' || type === 'type' ? 0 : d; }

        var m = window.moment(d, from, locale, true);

        // Order and type get a number value from Moment, everything else
        // sees the rendered value
        return m.format(type === 'sort' || type === 'type' ? 'x' : to);
    };
};

</script>
</html>


