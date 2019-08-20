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

<script>
$(document).ready(function(){

	commentList();
});

//댓글 목록
function commentList(param) {
	var params = $("#page_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	var dislike_like = "${dislike_like}";
	var dislike_like_like = $("#dislike_like_like");
	//alert("params"+params);
	$('#commentCount').empty();
	$('#commentList').empty();

	//alert('params='+params);
	//alert('commentList Test Start!');

	$.ajax({
		url:'/cat/infoboard/comments/commentList',
		type:'GET',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(result) {
			for(var i in result) {
				var count = '댓글 개수 : ' + result[i].count;
				
				//var image = '';
				var output = '';
				var modifyBtn = '';
				var deleteBtn = '';
				output += '<input type="hidden" id="commentCountVal" value='+result[i].count+'>';
				output += '<div class="col-sm-3 col-md-2 text-center-xs">'; //프로필 이미지
				output += '<p><img src="/resources/img/women.jpg" class="img-fluid rounded-circle" style="max-width:80%"></p>'; 
				output += '</div>';
				if(result[i].username == $("#USERNAME").val()) { 
					output += '<div class="col-sm-9 col-md-10">';
				} else {					
					output += '<div class="col-sm-9 col-md-10" style="height:150px">'; 
				}
				output += '<h5 class="text-uppercase">' + result[i].username + '</h5>';
				
				output += '<td class=like>';
				output += '<a href= "" class="btn btn-template-outlined" id="dislike_like_like">';
				output += '<i class="fa fa-heart-o"></i>'+dislike_like+'</a></td>';
				
				output += '<p class="posted">';
				output += '<i class="fa fa-clock-o"></i> 등록일: ' + result[i].created_DATE ;
				output += '&nbsp;&nbsp;&nbsp;&nbsp;수정일: ' + result[i].updated_DATE + '</p>';
				output += '<input type="hidden" class="form-control" id="commentContent'+result[i].id+'" value="'+result[i].content+'">';
				output += '<li id="commentBlock'+result[i].id+'" style="display:block">';
				output += '<p id="commentInnerText'+result[i].id+'">' + result[i].content +'</p>';   
				//본인이 작성한 댓글일 경우
				if(result[i].username == $("#USERNAME").val()) { 
					output += '<button id="commentUpdateBtn" class="btn btn-template-outlined" onclick="button('+result[i].id+')" style="float:right"><i class="fa fa-reply"></i> 수정</button></li>';
				}
				output += '<input id="commentCloseBtn'+result[i].id+'" onclick="closeComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="닫기" style="float:right; margin-top:20px">';	
				output += '<input id="commentDeleteBtn'+result[i].id+'" onclick="removeComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="삭제" style="float:right; margin-right:15px; margin-top:20px">';
				output += '<input id="commentModifyBtn'+result[i].id+'" onclick="modifyComment('+result[i].id+')" type="hidden" class="btn btn-template-outlined" value="수정" style="float:right; margin-right:15px; margin-top:20px">';
				output += '</div>';
				//console.log("output:"+output);
				$('#commentList').append(output);	
			}
			$('#commentCount').append(count);
			commentCount();
		},
		error:function() {
			alert("ajax통신 실패!!");
		},
		complete: function() {
			commentCount();
		}
	});
	
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
					dislike_like_like.html("<i class='fa fa-heart-o'></i>" + data);
				}
			},
			error : function(){
				alert("에러");
			}
		});
	});

}
//#comments > div.comment-footer
var CommentpageNum = 1;
var commentPageFooter = $(".comment-footer");

//댓글 페이지 번호 출력
function commentCount() {
	//alert("FOOTER에 들어오는 값 : " + JSON.stringify(commentPageFooter));
	console.log(document.getElementById('commentCountVal'));
	var commentCnt = document.getElementById('commentCountVal').value;
	//alert("commentCnt="+commentCnt);
	//alert(replyCnt);
		
	var endNum = Math.ceil(CommentpageNum / 10.0) * 10;
	var startNum = endNum - 9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= commentCnt) {
		endNum = Math.ceil(commentCnt/10.0);
	}
	
	if(endNum * 10 < commentCnt) {
		next = true;
	}
	
	var str = "<div><ul class='pagination pull-right'>";
	
	if(prev) {
		str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'><<</a></li>";
	}
	
	for(var i = startNum ; i <= endNum; i++) {
		var active = CommentpageNum == i? "active":"";
		
		str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next) {
		str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>>></a></li>";
	}
	
	str += "</ul></div>";
	
	console.log(str);
	$(".comment-footer").html(str);
}

//페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 하기
commentPageFooter.on("click", "li a", function(e){
	e.preventDefault();
	console.log("page click");
	
	var targetPageNum = $(this).attr("href");
	
	console.log("targetPageNum: " + targetPageNum);
	
	pageNum = targetPageNum;
	
	var actionForm = $("#page_form");
	actionForm.find("input[name='pageNum']").val(pageNum);
	
	var params = $("#page_form").serialize();
	commentList(params);
});

//버튼 속성 변경
function button(id) {
	//alert("button id="+id);
	
	var contentVal = $("#commentContent"+id+"").val();
	
	$('#commentBlock'+id+'').attr({"style":"display:none"});
	$('#commentContent'+id+'').attr({"type":"text", "value":contentVal});
	$('#commentCloseBtn'+id+'').attr({"type":"button"});
	$('#commentDeleteBtn'+id+'').attr({"type":"button"});
	$('#commentModifyBtn'+id+'').attr({"type":"button"});
}


//댓글 등록 버튼 눌렀을 경우
function inputData() {
	alert("등록?");
	var params = $("#insert_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	alert("Insertparams="+params);
	$.ajax({
		url : '/cat/infoboard/comments/insertComment',
		type : 'post',
		data : params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType : "json",
		success : function(retVal) {
			if(retVal.res == "OK") {
				alert("댓글을 추가하였습니다!");
				//초기화
				$('textarea').val('');
				var actionForm = $("#page_form");
				
				//현재 있는 페이지 유지
				commentList(actionForm.find("input[name='pageNum']").val());
			}
			else {
				alert("댓글 추가 실패!");
			}
		},
		error:function() {
			alert("ajax통신 실패!!!");
		}
	});
	//기본 이벤트 제거
	event.preventDefault();
}



//댓글 조회
function getComment(id) {

	jQuery.ajax({
		url : '/cat/infoboard/comments/'+id,
		type : 'GET',
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType : "json",
		success : function(result) {
			alert("댓글 조회 성공!");
		},
		error:function() {
			alert("ajax통신 실패!!!");
		}
	});
}

//댓글 수정
function modifyComment(id, callback, error) {

	var comment = {id:id, content:$('#commentContent'+id+'').val()};
	
	$.ajax({
		type : 'put',
		url : '/cat/infoboard/comments/modifyComment/' + id,
		data : JSON.stringify(comment),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			if(result) {		
				//alert(result);
				var commentInnerText = document.getElementById('commentInnerText'+id+'');
	
				$("#commentContent"+id+"").attr({"type":"hidden", "value":$('#commentContent'+id+'').val()});
				$("#commentModifyBtn"+id+"").attr({"type":"hidden"});
				$("#commentDeleteBtn"+id+"").attr({"type":"hidden"});
				$("#commentCloseBtn"+id+"").attr({"type":"hidden"});
				$("#commentBlock"+id+"").attr({"style":"display:block"});
				commentInnerText.innerText = $('#commentContent'+id+'').val();
				//alert('댓글을 수정하였습니다!');
			}
		},
		error : function(xhr, status, er) {
			if(error) {
				error(er);
			}
		}		
	});

}

//댓글 삭제
function removeComment(id) {
	//alert("remove!");
	if(confirm("삭제하시겠습니까?")) {		
		$.ajax({
			type : 'put',
			url : '/cat/infoboard/comments/removeComment/' + id,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(result) {
					//alert('댓글삭제!');
					commentList();
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	else {
		//alert('삭제 취소!');
		closeComment(id);
	}
}

//댓글 닫기
function closeComment(id) {
	$("#commentContent"+id+"").attr({"type":"hidden"});
	$("#commentModifyBtn"+id+"").attr({"type":"hidden"});
	$("#commentDeleteBtn"+id+"").attr({"type":"hidden"});
	$("#commentCloseBtn"+id+"").attr({"type":"hidden"});
	$("#commentBlock"+id+"").attr({"style":"display:block"});
}

</script>


</head>
<body class="bg-light">
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/cat_top.jspf"%>
<div class="container-fluid body-section">
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

						<!-- comment -->	
						<div id="comments">
							<h4 class="text-uppercase" id="commentCount"></h4>
							<section class="bar mb-0" id="commentSection">
								<div id="commentList" class="row comment">
								</div>
						
							</section>
					<!-- comment_page_form -->
							<form id="page_form">
								<input type="hidden" name="POST_ID" value="${boardinfo.ID}">
								<input type="hidden" name="USER_ID" value="${boardinfo.USER_ID}"> 
								<input type="hidden" name="CommentpageNum" value="${pageMaker.criComment.pageNum}"> 
								<input type="hidden" name="DISLIKE_LIKE" value="${DISLIKE_LIKE}">
					<!--input type="hidden" name="pageNum" value=1> -->
							</form>
	                        	<div class="comment-footer d-flex justify-content-center"></div>
						</div>

						<div id="comment-form">
							<h4 class="text-uppercase comment">댓글</h4>
					<!-- comment insert form -->
							<form id="insert_form" method="post">
								<input type="hidden" name="USER_ID" value="${boardinfo.USER_ID}"> 
								<input type="hidden" name="POST_ID" value="${boardinfo.ID}">
								<input type="hidden" name="CommentpageNum" value='${pageMaker.criComment.pageNum}'>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="name">아이디<span class="required text-primary">*</span></label> 
											<input id="NICKNAME" type="text" class="form-control" value="${boardinfo.USER_ID}" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">내 용 <span class="required text-primary">*</span></label>
											<textarea id="CONTENT" name="CONTENT" rows="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button class="re btn btn-template-outlined" id="inputbutton" onclick="inputData()">
											 댓글 등록
										</button>
									</div>
								</div>
								</form>
							</div>



								
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
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
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