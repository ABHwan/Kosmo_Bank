<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="custPath" value="/bank/customer/" />
<c:set var="mngPath" value="/bank/manager/" />
<c:set var="path" value="${pageContext.request.contextPath}/" />
<c:set var="rePath" value="${pageContext.request.contextPath}/resources/" />
<!-- value="/플젝명/WebContent(루트)의 하위폴더 customer/ -->

<script src="${rePath}js/jquery-3.6.0.min.js"></script>

<script src="${rePath}js/script.js"></script>



