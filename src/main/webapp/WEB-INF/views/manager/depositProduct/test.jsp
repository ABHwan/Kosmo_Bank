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
<script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $("#all_check").is(":checked");
			$(".user_check").prop("checked", is_check);
			
		});
	});
	
	
	function fn_process(val){
		var form = document.depositProductForm
		swal({
			title: 'Are you sure?',
			text: "You won't be able to revert this!",
			type: 'warning',
			buttons:{
				cancel: {
					visible: true,
					text : 'No, cancel!',
					className: 'btn btn-danger'
				},
				confirm: {
					text : 'Yes, delete it!',
					className : 'btn btn-success'
				}
			}
		}).then((willDelete) => {
			if (willDelete) {
				swal("Poof! Your imaginary file has been deleted!", {
					icon: "success",
					buttons : {
						confirm : {
							className: 'btn btn-success'
						}
					}
				});
				form.action = "depositProductDelete";
			  	form.submit();
				
			} else {
				swal("Your imaginary file is safe!", {
					buttons : {
						confirm : {
							className: 'btn btn-success'
						}
					}
				});
			}
		});
		/*
		if(val == '1'){
			  // 회원정보수정시
			  form.action = "";
			  form.submit();
		}else{
			form.action = "depositProductDelete";
		  	form.submit();
		  	
		}
		*/
	}
	
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/mngSidebar.jsp" />
<!-- 메인 콘텐츠 -->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">금융</h4>
						<ul class="breadcrumbs">
							<li class="nav-home"><a href="#"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">예금관리</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">예금리스트</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">예금리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="basic-datatables_wrapper"
											class="dataTables_wrapper container-fluid dt-bootstrap4">
											<div class="row">
												<div class="col-md-12">
													<form action="" name="depositProductForm" method="post" onsubmit="return Confirm();">
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
	'#', '번호', '상품명', '상품요약', '금리', '종류', '최소기간', '최대기간', '최소금액', '은행코드', '등록일'
];

$(document).ready(function() {
	
    var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var currLocation = window.location.href;
    
    currLocation = currLocation.toString();
    csrfData[csrfParameter] = csrfToken;
    // 시작 주소로 처음 구분
    console.log(currLocation.split('/')[5]);
    if (currLocation.split('/')[5] == 'depositProductListTest') {
        $('#datatables').append('<table id="depositTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;"></table>');
        columns = [
                {
                    'sTitle' : '<input type="checkBox" id="' + 'all_check' + '">',
                    data : 'deposit_product_name',
                    render : function(data) {
                        return '<input type="checkBox" name="check" class="user_check" value="' + data + '">';
                    }
                }, {
                    'sTitle' : '번호',
                    data : 'rNum'
                }, {
                    'sTitle' : '상품명',
                    data : 'deposit_product_name',
                   	render : function(data) {
                           return '<a href="depositProductInfo?deposit_product_name=' 
                        		   + data + '&pageNum=${pageNum}&number=${number + 1}">' + data + '</a>';
                       }			
                    	
                }, {
                    'sTitle' : '상품요약',
                    data : 'deposit_product_summary'
                }, {
                    'sTitle' : '금리',
                    data : 'deposit_product_interRate',
                }, {
                    'sTitle' : '종류',
                    data : 'deposit_product_type',
                    render : function(data) {
                   		var str = '';
                    		if(data == 0) {
                    			str = '복리';
                    		} else {
                    			str = '단리';
                    		}
                        return str;
                    }
                }, {
                    'sTitle' : '최소기간',
                    data : 'deposit_product_minDate',
                    render : function(data) {
                   		var str = data + "개월";
                        return str;
                    }
                }, {
                    'sTitle' : '최대기간',
                    data : 'deposit_product_maxDate',
                    render : function(data) {
                   		var str = data + "개월";
                        return str;
                    }
                }, {
                    'sTitle' : '최소금액',
                    data : 'deposit_product_minPrice'
                }, {
                    'sTitle' : '은행코드',
                    data : 'deposit_product_bankCode',
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
                    'sTitle' : '등록일',
                    data : 'deposit_product_date',
                   	render : $.fn.dataTable.render.moment()
                }
        ];

        url = 'depositProductListTestSelect';
        callList(url, columns);
    }
});

$('.white-box').on('click', '#depositProductInsertAction, #insertCommuteAction', function(event) {
    csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
    csrfToken = $("meta[name='_csrf']").attr("content");
    var list = new Array();
    var i = 0;
    $('#depositProductInsertForm #attendance').each(function() {
        var dataObject = new Object();
        $('.form-control' + i).each(function() {
            var data = $(this);
            dataObject[data.attr('name')] = data.val();
        });
        console.log(dataObject);
        list.push(dataObject);
        i++;
    });
    list.pop();
    var formData = JSON.stringify(list);
    var loc = $('#depositProductInsertForm').attr('action');
    console.log(loc, formData);

    if (preventMultiFlag) {
        alert('처리중입니다.');
        return false;
    } else {
        $.ajax({
            type : 'POST',
            url : loc + '?' + csrfParameter + '=' + csrfToken,
            data : formData,
            accept : "application/json",
            contentType : "application/json; charset=utf-8",
            dataType : 'text',
            beforeSend : function(xhr) {
                xhr.setRequestHeader(csrfParameter, csrfToken);
            },
            success : function(data) {
                if (data) {
                    preventMultiFlag = true;
                    window.close();
                }
            },
            error : function() {
                alert('오류');
            },
        });
    }

    event.preventDefault();
});

// SELECT 검색
// 버튼 눌렀을때
$(document).on("click", '#selectAttendacne', function() {
    $(this).parent().parent().find('li').removeClass('active');
    $(this).parent().addClass('active').addClass('nav-hover');
    columns = [
        {
            'sTitle' : '<input type="checkBox" id=' + 'all_check' +'">',
            data : 'deposit_product_name',
            render : function(data) {
                return '<input type="checkBox" name="check" class="user_check" value="' + data + '">';
            }
        }, {
            'sTitle' : '번호',
            data : 'rNum'
        }, {
            'sTitle' : '상품명',
            data : 'deposit_product_name'
        }, {
            'sTitle' : '상품요약',
            data : 'deposit_product_summary'
        }, {
            'sTitle' : '금리',
            data : 'deposit_product_interRate',
        }, {
            'sTitle' : '종류',
            data : 'deposit_product_type',
            render : function(data) {
           		var str = '';
            		if(data == 0) {
            			str = '복리';
            		} else {
            			str = '단리';
            		}
                return str;
            }
        }, {
            'sTitle' : '최소기간',
            data : 'deposit_product_minDate',
            render : function(data) {
           		var str = data + "개월";
                return str;
            }
        }, {
            'sTitle' : '최대기간',
            data : 'deposit_product_maxDate',
            render : function(data) {
           		var str = data + "개월";
                return str;
            }
        }, {
            'sTitle' : '최소금액',
            data : 'deposit_product_minPrice'
        }, {
            'sTitle' : '은행코드',
            data : 'deposit_product_bankCode',
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
            'sTitle' : '등록일',
            data : 'deposit_product_date',
           	render : $.fn.dataTable.render.moment()
        }
	];

    ordering = [
        [
                1, 'desc'
        ]
    ];
    
    url = 'depositProductListTestSelect';
    callList(url, columns, ordering);
});

$(document).on('click', '#commutingRecords', function() {
    $(this).parent().parent().find('li').removeClass('active');
    $(this).parent().addClass('active').addClass('custom-click');
    ordering = [
        [
                0, 'desc'
        ]
    ];
    columns = [
	        {
	            'sTitle' : '<input type="checkBox" id="' + 'all_check' + '">',
	            data : 'deposit_product_name',
	            render : function(data) {
	                return '<input type="checkBox" name="check" class="user_check" value="' + data + '">';
	            }
	        }, {
	            'sTitle' : '번호',
	            data : 'rNum'
	        }, {
	            'sTitle' : '상품명',
	            data : 'deposit_product_name'
	        }, {
	            'sTitle' : '상품요약',
	            data : 'deposit_product_summary'
	        }, {
	            'sTitle' : '금리',
	            data : 'deposit_product_interRate',
	        }, {
	            'sTitle' : '종류',
	            data : 'deposit_product_type',
	            render : function(data) {
	           		var str = '';
	            		if(data == 0) {
	            			str = '복리';
	            		} else {
	            			str = '단리';
	            		}
	                return str;
	            }
	        }, {
	            'sTitle' : '최소기간',
	            data : 'deposit_product_minDate',
	            render : function(data) {
	           		var str = data + "개월";
	                return str;
	            }
	        }, {
	            'sTitle' : '최대기간',
	            data : 'deposit_product_maxDate',
	            render : function(data) {
	           		var str = data + "개월";
	                return str;
	            }
	        }, {
	            'sTitle' : '최소금액',
	            data : 'deposit_product_minPrice'
	        }, {
	            'sTitle' : '은행코드',
	            data : 'deposit_product_bankCode',
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
	            'sTitle' : '등록일',
	            data : 'deposit_product_date',
	           	render : $.fn.dataTable.render.moment()
	        }
	];

    url = 'commuteList';
    callList(url, columns, ordering);
});


function callList(url, columns, ordering) {
    $("#datatables").empty();
    $('#datatables').append('<table id="depositTable" class="display table table-striped table-hover dataTable" style="width: 100% !important;" ></table>');
    currTab = $('#depositTable').DataTable({
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

    if (url == 'depositProductListTestSelect') {
    	$('.col-md-12').append('<div id="datatable-btn">');
        $('#datatable-btn').append('<button id="depositProductInsert" class="btn btn-primary"><span class="btn-label"><i class="fa fa-plus"></i></span></button>');
        $('#datatable-btn').append('<button id="depositProductDelete" class="btn btn-primary btn-border" onclick="javascript:fn_process(2)"><span class="btn-label"><i class="fa fa-plus"></i></span></button>');
        $('#depositTable_length').after(
                '<div id="basic-datatables_filter" class="dataTables_filter" style="text-align: right;"></div>');
        $('#basic-datatables_filter').append('<label for="searchBar">검색 : &nbsp</label>');
        $('#basic-datatables_filter').append(
                '<input type="search" class="form-control form-control-sm" id="searchBar">');
        var searchDiv = $('#basic-datatables_filter').find('label');
        searchDiv.before('<select id="searchAttendance" style="margin-right:10px; height: 31px; color: darkslategray;">');
        for (var i = 0; i < attCol.length; i++) {
            $('#searchAttendance').append('<option value=' + i + '>' + attCol[i] + '</option>');
        }

        $('#depositProductInsert').append('등록');
        $('#depositProductDelete').append('삭제');
    } else if (url == 'commuteList') {
        $('#datatables').append('<button id="insertCommute">');
        $('#insertCommute').append('신규 등록');
    }
}

$('#depositTable').ready(function() {
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


