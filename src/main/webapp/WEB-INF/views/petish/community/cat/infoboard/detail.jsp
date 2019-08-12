<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>고양이 건강게시판</title>
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
<link rel="apple-touch-icon" sizes="144x144" href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
<link href="/resources/css/infoboard/detail.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnDelete").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/cat/infoboard/delete?ID=${boardinfo.ID}";
		}
	});
	
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$("#btnModify").on("click",function(){
		formObj.attr("action", "/cat/infoboard/modifyForm");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$("#btnList").on("click",function(){
		location.href="/cat/infoboard/list?pageNum=${cri.pageNum}&amount=${cri.amount}";
	});
	
});
</script>

<!-- 좋아용 -->
<!--
<script>
	$(document).ready(function(){
		$("#dislike_like").on("click", function(){
			var that = $("#dislike_like");
			var sendData = {'POST_ID' : '${CatInfoboardVO.ID}', 'dislike_like' : that.prop('USER_ID')};
			
			$.ajax({
				url : '/cat/infoboard/dislike_like',
				type : 'POST',
				data : sendData,
				success : function(data){
					that.prop('USER_ID',data);
					if(data==1){
						$('#dislike_like').prop
					}
					
					}
				
			});
			
		});
	});
</script>

<script>
$(document).ready(function(){
	
	var session = "${sessionid}";
	var dislike_like_like = $("#dislike_like_like");
	var id = "${boardinfo.ID}";
	var dislike_like = "${dislike_like}";
	
	alert("id: " + id);
	alert("dislike_like: " + dislike_like);

	dislike_like_like.on("click", function() {
		$.ajax({
			url : "/cat/infoboard/dislike_like",
			data : {id : id, type : 1},
			dataType : "text",
			type : "post",
			success: function(data){
				if(data == "fail"){
					alert("이미 누르셨습니다.");
					return false;
				}else{
					//dislike_like_like.html("<i class='fa fa-heart-o'></i>" + data);
				}
			},
			error : function(){
				alert("에러");
			}
		});
	});
});
</script>
-->
</head>
<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">고양이 건강게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end"></ul>
					</div>
				</div>
			</div>
		</div>

<div id="content">
	<div class="container">
		<div id="blog-post" class="col-md-13">
			
			<button class="write btn btn-template-outlined" onclick="location.href='/cat/infoboard/writeForm'">글쓰기</button>
			<button class="list btn btn-template-outlined" id="btnList" onclick="location.href='/cat/infoboard/list'">
				<i class="fa fa-align-justify"></i>목록 
			</button>
			
			<div class="panel-heading">
				<h2 class="h3 panel-title">${boardinfo.TITLE}</h2>
			</div>
			
			<table>
				<tr>
					<td>
						<img src="/resources/img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle">
					</td>
					<td class=name>
						<div class="nav navbar-nav ml-auto">
							<a href="#" data-toggle="dropdown" class="dropdown">Pet</a>
							<div class="dropdown-menu">
								<div class="dropdown">
									<a href="#" class="nav-link">게시글보기</a>
								</div>
							<div class="dropdown">
									<a href="#" class="nav-link">쪽지보내기</a>
							</div>
							</div>
						</div>
					</td>

							<td class=grade>수의사</td>
							<td class=date><fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${boardinfo.CREATE_DATE}" /></td>
							<td class=view><i class="fa fa-eye"></i>${boardinfo.VIEW_COUNT}</td>
							<td class=like><a href='#' class="btn btn-template-outlined">
							<i class="fa fa-heart-o"></i>1</a></td>
				</tr>
			</table>

					<hr size="10px">
					<p class="lead">${boardinfo.CONTENT}</p>
					<div id="comments">
						<h4 class="text-uppercase">댓글 수 2</h4>
						<section class="bar bg-gray mb-0">
							<div class="row comment">
								<div class="col-sm-3 col-md-2 text-center-xs">
									<p>
										<img src="/resources/img/blog-avatar2.jpg" alt=""
											class="img-fluid rounded-circle">
									</p>
								</div>
								<div class="col-sm-9 col-md-10">
									<h5 class="text-uppercase">Julie Alma</h5>
							<div class=like><a href='#' class="btn btn-template-outlined" id="dislike_like_like">
							<i class="fa fa-heart-o"></i>추천 : ${dislike_like}</a>
							
							<a href='#' class="btn btn-template-outlined" id="dislike_like_dislike">
							<i class="fa fa-heart-o"></i>비추 : ${dislike_like}</a></div>
									<p class="posted">
										<i class="fa fa-clock-o"></i>
										<fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${boardinfo.CREATE_DATE}" />
									</p>
									<p>좋은 글 감사합니다.</p>

								</div>
							</div>
							<div class="row comment last">
								<div class="col-sm-3 col-md-2 text-center-xs">
									<p>
										<img src="/resources/img/blog-avatar.jpg" alt=""
											class="img-fluid rounded-circle">
									</p>
								</div>
								<div class="col-sm-9 col-md-10">
									<h5 class="text-uppercase">Louise Armero</h5>
									<p class="posted">
										<i class="fa fa-clock-o"></i> 2019-07-03 09:25:23
									</p>
									<p>도움이 되었습니다.</p>
								</div>
							</div>
						</section>
					</div>

					<div id="comment-form">
						<h4 class="text-uppercase">댓글</h4>
						<form role="form" method="post">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="name">아이디 <span
											class="required text-primary">*</span></label> <input id="name"
											type="text" class="form-control">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="comment">내 용 <span
											class="required text-primary">*</span></label>
										<textarea id="comment" rows="4" class="form-control"></textarea>
									</div>
								</div>
							</div>
						<div class="row">
							<div class="col-sm-12 text-right">
								<button class="re btn btn-template-outlined">
									<i class="fa fa-comment-o"></i> 댓글 등록
								</button>
								
								<div aria-label="Page navigation example" class="d-flex justify-content-left">
									<input type="hidden" name="ID" value="${boardinfo.ID}">
									<button type="submit" class="btn btn-template-outlined" id="btnModify">
										<i class="fa fa-pencil"></i>수정</button>
										
									<button type="button" class="btn btn-template-outlined" id="btnDelete">
										<i class="fa fa-trash-o"></i>삭제</button>
								</div>
								
								<button type="button" class="btn btn-danger"
									data-toggle="modal" data-target="#myModal" id="report-btn">신고
								</button>

								<div class="modal fade" id="myModal" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h3 class="modal-title" id="myModalLabel">신고</h3>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<table>
													<tr>
														<td>신고 분류</td>
														<td>
															<div class="form-group">

																<select id="state" class="form-control">
																	<option>부적절한 게시글</option>
																	<option>도배 게시글</option>
																	<option>광고 목적 게시글</option>
																	<option>기타</option>
																</select>
															</div>
														</td>
													<tr>
														<td>내용</td>
														<td><textarea id="comment" rows="4" cols="40" class="form-control"></textarea></td>
													</tr>
													<tr></tr>
													<tr>
														<td></td>
														<td>
															<button type="button" class="btn btn-template-outlined"
																	data-dismiss="modal">확인</button>
															<button type="button" class="btn btn-template-outlined"
																data-dismiss="modal">취 소</button>
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="modal-footer"></div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
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
	<script	src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>