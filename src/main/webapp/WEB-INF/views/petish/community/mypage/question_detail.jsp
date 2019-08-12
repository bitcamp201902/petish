<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>문의 작성하기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<style>
h5 {
	margin-left: 1.8cm;
	color: #6c757d !important;
}

tr {
	height: 0.7cm;
	border: 1px solid #ddd;
}

#viewMore1, #viewMore2, #viewMore3 {
	margin-left: auto;
}

.nondeco {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
	color: black;
}

.font-grey {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
}
</style>

<body>

<div id="all">

	<%@ include file="/WEB-INF/views/commons/top.jspf" %>

	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">MY PAGE</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item active">My Page</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br><br>

	<div class="row">
		<div class="col-md-12">
			<div class="heading text-center">
				<h2>문의 내용</h2>
			</div>
		</div>		
		
		<div class="col-md-8 mx-auto">
			
			<!-- <div class="row">
			<button type="button" class="btn btn-sm btn-danger">답변 대기</button>
			</div>
			<br> -->
			
			<!-- 폼 전송 -->
			<form id="question_form" action="">
			
				<div class="row">				
					
					<div class="col-sm-12">
						<div class="form-group">
							<label for="firstname">문의 제목</label> <input id="question_title"
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label for="firstname">작성일</label> <input id="question_date"
								type="text" class="form-control" value="" readonly>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="message">문의 내용</label>
							<textarea id="question_content" class="form-control" rows="15" ></textarea>
						</div>
					</div>
					<div class="col-sm-12 text-center">
						<!-- 문의 form 전송 -->
						<button type="submit" class="btn btn-outline-primary" id="question_ok">삭제</button>&nbsp;&nbsp;
						<button type="submit" class="btn btn-outline-primary" id="question_ok">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>


</body>
</html>