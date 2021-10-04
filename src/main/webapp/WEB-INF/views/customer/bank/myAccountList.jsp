<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp"%>
<%@ include file="/WEB-INF/views/include/bootstrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예금 리스트</title>
<!-- ajax 때문에 넣어주기 -->
<sec:csrfMetaTags />

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	<!-- 메인 콘텐츠 -->
	<div class="main-panel">
		<div class="content">
			<div class="page-inner">
				<div class="page-header">
					<h4 class="page-title">계좌관리</h4>
					<ul class="breadcrumbs">
						<li class="nav-home"><a href="#"> <i
								class="flaticon-home"></i>
						</a></li>
						<li class="separator"><i class="flaticon-right-arrow"></i></li>
						<li class="nav-item"><a href="#">계좌조회</a></li>
						<li class="separator"><i class="flaticon-right-arrow"></i></li>
						<li class="nav-item"><a href="#">은행별 계좌조회</a></li>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">계좌리스트</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div id="basic-datatables_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-md-12">
												<form action="" name="myAccountForm" method="post"
													onsubmit="return Confirm();">
													<sec:csrfInput />
													
													<div class="white-box" id="datatables"></div>
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
<script type="text/javascript"
	src="${rePath}js/plugin/datatables/datatables.min.js"></script>
<script type="text/javascript">
var currTab;
var csrfData = {};
var csrfParameter;
var csrfToken;
var preventMultiFlag = false;
var attCol = [
	'번호', '은행명', '계좌명', '계좌번호', '신규일', '잔액', '업무'
];

$(document).ready(function() {
	
    var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var currLocation = window.location.href;
    
    currLocation = currLocation.toString();
    csrfData[csrfParameter] = csrfToken;
    // 시작 주소로 처음 구분
    console.log(currLocation.split('/')[5]);
    if (currLocation.split('/')[5] == 'myAccountList') {
        $('#datatables').append('<table id="accountTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;"></table>');
        columns = [
                {
                    'sTitle' : '번호',
                    data : 'rNum',
                    
                }, {
                    'sTitle' : '은행명',
                    data : 'account_bankCode',
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
                    'sTitle' : '계좌명',
                    data : 'account_stateContent'
                }, {
                    'sTitle' : '계좌번호',
                    data : 'account_id',
                }, {
                    'sTitle' : '신규일',
                    data : 'account_newDate',
                    render : $.fn.dataTable.render.moment()
                    
                }, {
                    'sTitle' : '잔액',
                    data : 'account_balance',
                    render : DataTable.render.number( ',' , '.' , 0 , '' , '원' )
                    
                }, {
                    'sTitle' : '업무',
                    data : 'account_id',
                    render : function(data) {
                   		
                        return '<button class="btn btn-primary btn-sm">조회</button>';
                    }
                }
        ];

        url = 'myAccountListSelect';
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
	            data : 'rNum',
	            
	        }, {
	            'sTitle' : '은행명',
	            data : 'account_bankCode',
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
	            'sTitle' : '계좌명',
	            data : 'account_stateContent'
	            
	        }, {
	            'sTitle' : '계좌번호',
	            data : 'account_id',
	            
	        }, {
	            'sTitle' : '신규일',
	            data : 'account_newDate',
	            render : $.fn.dataTable.render.moment()
	            
	        }, {
	            'sTitle' : '잔액',
	            data : 'account_balance',
	            render : DataTable.render.number( ',' , '.' , 0 , '' , '원' )
	        }, {
	            'sTitle' : '업무',
	            data : 'account_id',
	            render : function(data) {
	           		
	                return '<button class="btn btn-primary btn-sm">조회</button>';
	            }
	        }
	];

    ordering = [
        [
                1, 'desc'
        ]
    ];
    
    url = 'myAccountListSelect';
    callList(url, columns, ordering);
});


function callList(url, columns, ordering) {
    $("#datatables").empty();
    $('#datatables').append('<table id="accountTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;" ></table>');
    currTab = $('#accountTable').DataTable({
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

    if (url == 'myAccountListSelect') {
    	//$('.col-md-12').append('<div id="datatable-btn">');
        //$('#datatable-btn').append('<button id="depositProductInsert" class="btn btn-primary"><span class="btn-label"><i class="fa fa-plus"></i></span></button>');
        $('#datatable-btn').append('<button id="depositProductDelete" class="btn btn-primary" onclick="javascript:fn_process(2)"></button>');
        $('#accountTable_length').after(
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

$('#accountTable').ready(function() {
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


