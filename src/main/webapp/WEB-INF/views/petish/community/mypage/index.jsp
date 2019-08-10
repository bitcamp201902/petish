<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h1>인덱스페이지</h1>
	<div id="all">
		<%@ include file="/WEB-INF/views/commons/top.jspf"%>
	</div>
</body>
<script>
$("#login-modal").modal("show");
</script>
</html>