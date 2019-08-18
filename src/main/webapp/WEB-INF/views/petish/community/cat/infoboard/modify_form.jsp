<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고양이 건강게시판 게시글 수정</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57" href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
	
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/write-modify.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$("#resetBtn").on("click", function() {
			history.go(-1);
		});

		$("#modifyBtn").on("click", function() {
			formObj.submit();
		});
	});
</script>

<script type="text/javascript">
	var f_selbox = new Array('건강','행동패턴');
	
	function firstChange(f){
		var f_sel = f.CATEGORY_ID;
		var sel = f_sel.selectedIndex;
		var sel_val = f_sel[sel].value;
	}
</script>

</head>


<body class="bg-light">
	<div id="all">
		
		<%@ include file="/WEB-INF/views/commons/cat_top.jspf" %>
<div class="container-fluid body-section">
		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">고양이 정보게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">고양이</a></li>
							<li class="breadcrumb-item active">정보게시판</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="container">
				<div>
					<div id="customer-account">
						<div class="box mt-5" style="margin-top: 20px;">
							<div class="heading" id="head">
								<h3 class="text-uppercase">글 수정</h3>
							</div>
							<div class="col-lg-10 text-right p-3" style="display:inline-block;">
										<a href="/cat/infoboard/list" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
							<form role="form" id="modifyForm" method="post" action="/cat/infoboard/modify">
								<input type="hidden" name="ID" value="${boardinfo.ID}">
								<div class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="category">카테고리</label> 
												<select name="CATEGORY_ID" id="CATEGORY_ID" class="form-control" onchange="firstChange(this.form);">
													<option value="">카테고리 선택</option>
													<option value="1">건강</option>
													<option value="2">행동패턴</option>
												</select>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="TITLE">제목</label> 
											<input id="TITLE" name="TITLE" type="text" value="${boardinfo.TITLE}" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="CONTENT">내용</label>
											<textarea id="summernote" name="CONTENT" class="form-control">${boardinfo.CONTENT}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<a href="#" class="btn btn-template-outlined" style="margin-top: 0px;">삭제</a>
									</div>
									<div class="col-md-9 text-right">
										<button type="submit" class="btn btn-template-outlined" id="modifyBtn">수정</button>
										<button type="button" class="btn btn-template-outlined" id="resetBtn">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script src="/resources/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote.js"></script>
	<!-- selectbox값 가져오기 -->
	<script>
	//selectbox 값을 db에서 가져온다
	var inputVal = "2"; //받아온값
	
	$("#category").val(inputVal);
	</script>
	
</body>
</html>