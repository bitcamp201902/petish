<%@page import="com.community.petish.community.mypage.dto.response.QuestionResponseDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	QuestionResponseDTO dto = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mypage</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/img/apple-touch-icon-152x152.png">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<script src="/resources/js/mypage/mypage.js"></script>
</head>
<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout">
					<div style="max-width: 20cm; margin: auto;">
						<!-- <form method="get" action=""> -->
						<h3 style="margin-top: 10%; font-weight: 700;">Q & A</h3>
						<ul id="pills-tab" role="tablist"
							class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item"><a id="pills-profile-tab"
								data-toggle="pill" href="#message-receive" role="tab"
								aria-controls="pills-profile" aria-selected="false"
								class="nav-link active"　id="questionList">　문의내역</a></li>
							<li class="nav-item"><a id="pills-home-tab"
								data-toggle="pill" href="#message-send" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									문의하기</a></li>
						</ul>
						<div id="pills-tabContent" class="tab-content">
							<div id="message-receive" role="tabpanel"
								aria-labelledby="pills-home-tab"
								class="tab-pane fade show active">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered" id="qnaList">
													
												</table>
												<div class="questionfooter"></div>
												<select name='type'>
														<option value=''>--</option>
														<option value='T'>제목</option>
														<option value='C'>문의유형</option>
												</select>
												<input type='text' name='keyword' />
												<button>Search</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="message-send" role="tabpanel"
								aria-labelledby="pills-profile-tab" class="tab-pane fade">
								<div class="row">
									<form action="./insert">
										<div class="row">
											<div class="col-sm-6 col-md-3">
												<div style='padding-left:15px;padding-right:15px;min-width:5cm;'>
													<label for="category">문의 유형</label> <select id="category"
														class="form-control" name="category_id">
														<option >문의유형 선택</option>
														<option value="1">게시판요청</option>
														<option value="2">회원등급</option>
														<option value="3">기타</option>
													</select>
												</div>
											</div>
											<div class="col-sm-12">
												<div style='padding-left:15px;padding-right:15px;'>
													<label>문의 제목</label> <input type="text"
														class="form-control" name="title">
												</div>
											</div>
											<div class="col-sm-12" style="left-">
												<div style='padding-left:15px;padding-right:15px;'>
													<label>문의 내용</label>
													<textarea class="form-control" rows="15" name="content"></textarea>
												</div>
											</div>
											<input type="hidden" name="user_id" value='<%=loginedUser.getId() %>'>
											<div class="col-sm-12 text-center">
												<!-- 문의 form 전송 -->
												<button type="submit" class="btn btn-outline-primary"
													id="question_submit">확인</button>
												<button type="reset" class="btn btn-outline-primary"
													id="question_submit">취소</button>
												<a style="padding-right: 0.5rem;"></a>
												<!-- 문의 리스트 화면으로 -->
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
						<div class="content"></div>
					</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>
	<script>
		//쪽지 상세보기
	$(document).ready(
			function() {
				
				$("#qnaList tr:odd").addClass("odd");
				$("#qnaList tr:not(.odd)").hide();
				$("#qnaList tr:first-child").show(); // 열머리글 보여주기

				$("#qnaList tr.odd").click(function() {
					$(this).next("tr").toggle();
					$(this).find(".arrow").toggleClass("up");

				});
				
				var questionList = $("#questionList");
				var questionfooter = $(".questionfooter");
				var listUL = $("#qnaList");
				
				var questionService = (function(){
					function getQuestionList(param, callback, error){
					var page = param.page || 1;
					$.get("/mypage/api/questionList/"+ page + ".json",
						function(data){
							if (callback){
							callback(data.questionCnt, data.list);
							}
						}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
				}
					return {
						getQuestionList : getQuestionList
					};
				})();
				
				function moveQuestionPage(){
					questionfooter.on("click", "li a", function(e){
					e.preventDefault();
					console.log("page click");
					var targetPageNum = $(this).attr("href");
					console.log("targetPageNum:" + targetPageNum);
					pageNum = targetPageNum;
					showQuestionList(pageNum);
					})
				};
				
				var pageNum = 1;
				function showQuestionPage(questionCnt){
					
					questionfooter.html("");
					
					var endNum = Math.ceil(pageNum / 10.0) * 10;
					var startNum = endNum - 9;
					var prev = startNum != 1;
					var next = false;
					
					if (endNum * 10 >= questionCnt) {
						endNum = Math.ceil(questionCnt / 10.0);
					}

					if (endNum * 10 < questionCnt) {
						next = true;
					}
					var str = "<div><ul class='pagination pull-right'>";
					if (prev) {
						str += "<li class='page-item'><a class='page-link' href='"
								+ (startNum - 1) + "'>Previous</a></li>";

					}
					
					for (var i = startNum; i <= endNum; i++) {

						var active = pageNum == i ? "active" : "";
						str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
								+ i + "</a></li>";
					}
					
					if (next) {
						str += "<li class='page-item'><a class='page-link' href='"
								+ (endNum + 1) + "'>Next</a></li>";
					}
					
					str += "</ul></div>";

					console.log(str);

					questionfooter.html(str);
					moveQuestionPage();
				}
				
				function showQuestionList(page){
					questionService.getQuestionList(
						{
						      page : page || 1
						},
						function(questionCnt, list){
							if (page == -1) {
							pageNum = Math.ceil(questionCnt / 10.0);
							showQuestionList(pageNum);
							return;
							}
							var str = "";
							str += "<tr align='cen;ter' class='font-grey'><th>문의내용</th><th>제목</th><th>문의일자</th><th>답변상태</th></tr>"	
							if (list == null || list.length == 0) {
							return;
							}
																
							for (var i = 0, len = list.length || 0; i < len; i++) {
							str += "<tr class='odd'><td class='font-grey'>"
							+ list[i].category + "</td>";
							str += "<td><a href='' class='nondeco'>"
							+ list[i].title + "</td>";
							str += "<td>"
							+ list[i].created_date + "</td>";
							str += "<td style='text-align:center;''>";
																	
							if(list[i].replied == 0){
							str += "<button type='button' class='btn btn-sm btn-default'>답변대기</button></a></td>";
							}else if(list[i].replied == 1){
							str += " <button type='button' class='btn btn-sm btn-danger'>답변완료</button></td>";
							}
							str += "</tr><tr><td colspan='4'><pre>";
							str += list[i].content+"</pre></td></tr>";
							}
																
							listUL.html(str);
							showQuestionPage(questionCnt);
							$("#qnaList tr:odd").addClass("odd");
							$("#qnaList tr:not(.odd)").hide();
							$("#qnaList tr:first-child").show(); // 열머리글 보여주기

							$("#qnaList tr.odd").click(function() {
								$(this).next("tr").toggle();
								$(this).find(".arrow").toggleClass("up");

							});
							});
						};
						
						showQuestionList();
						
						questionList.on("click", function(e){
							showQuestionList();
							pageNum=1;
						});

									
			});
	</script>
	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script
		src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>