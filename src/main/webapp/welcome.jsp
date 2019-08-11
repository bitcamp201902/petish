<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

#video { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
</head>
<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<body>
<div id="all">
<%@ include file="/WEB-INF/views/commons/top.jspf" %>
		<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
    		  <source src="/resources/catdog.mp4" type="video/mp4">
		</video>
		
</div>
</body>
</html>