<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Fonts and icons -->
<script src="${rePath}js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google: {"families":["Lato:300,400,700,900"]},
		custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['${rePath}css/fonts.min.css']},
		active: function() {
			sessionStorage.fonts = true;
		}
	});
</script>

<link rel="icon" href="${rePath}images/img/icon.ico" type="image/x-icon"/>

<!-- CSS Files -->
<link rel="stylesheet" href="${rePath}css/bootstrap.min.css">
<link rel="stylesheet" href="${rePath}css/atlantis.min.css">

<!-- alert, confirm File -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- DataTable File -->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/datatables.min.js"></script>

<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	

</head>
<body>
</body>
</html>