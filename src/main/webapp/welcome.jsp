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
<body>
<div id="all">
<%@ include file="/WEB-INF/views/commons/top.jspf" %>
		<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
    		  <source src="/resources/catdog.mp4" type="video/mp4">
		</video>
		
</div>
</body>
</html>