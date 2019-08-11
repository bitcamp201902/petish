<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.community.petish.community.mypage.dto.response.WritingPageDTO" %>
<%@page import="com.community.petish.community.mypage.dto.response.Writings_LikedDTO"%>
<%@page import="com.community.petish.community.mypage.dto.response.Writings_CommentedDTO"%>
<%@ page import="com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage" %>
<%
	UserResponseDTO_Mypage member = (UserResponseDTO_Mypage) request.getAttribute("member");
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

<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: grey;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>

</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout">
					<div style="max-width: 20cm; margin: auto;">
						<h3 style="margin-top: 10%;">My Page</h3>
						<div class="memberInfo">
							<div style="margin: 0.5cm;">
								<img class="profile" src="\resources\img\<%=member.getPicture()%>"
									style="margin-right: 30px;"> <a><%=member.getNickname()%>(<%=member.getUsername().substring(0, 5)%>***)</a>
								│ 정회원 │ <a href="" data-toggle="modal"
									data-target="#new-modal" class="showmodal" data-id=<%=member.getId() %> data-nick=<%=member.getNickname() %> style="color:black;"><i
									class="fa fa-envelope" style="margin-right: 10px;color:black;"></i>쪽지 보내기</a>
								<script>
									var user_id =
								<%=session.getAttribute("user_id")%>
									;
								</script>
								<%
									long user_id = member.getId();
								%>
							</div>
						</div>
						<ul id="pills-tab" role="tablist"
							class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item" id="writing"><a id="pills-profile-tab"
								data-toggle="pill" href="#writingList" role="tab"
								aria-controls="pills-profile" aria-selected="false"
								class="nav-link active"><%=member.getNickname() %>님이 쓴 글</a></li>
							<li class="nav-item" id="commented"><a id="pills-home-tab"
								data-toggle="pill" href="#" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link"><%=member.getNickname() %>님이
									댓글 쓴 글</a></li>
							<li class="nav-item" id="liked"><a id="pills-home-tab"
								data-toggle="pill" href="#s" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link"><%=member.getNickname() %>님이
									좋아요 한 글</a></li>
						</ul>

						<div id="pills-tabContent" class="tab-content">
							<div id="writingList" role="tabpanel"
								aria-labelledby="pills-home-tab"
								class="tab-pane fade show active">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">


												<table class="table table-hover table-bordered" id="ajaxList">

												</table>
												<!-- paging start -->
                                    <div class="d-flex justify-content-center">
                                       <ul class="pagination">
                                          <c:if test = "${pageMaker.prev}">
                                             <li class="wp-example"><a href="${pageMaker.startPage -1}">Previous</a>
                                             </li>
                                          </c:if>
                                          
                                          <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                             <li class="page-item3 ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}" class="page-link">${num}</a></li>
                                          </c:forEach>
                                          
                                          <c:if test="${pageMaker.next}">
                                             <li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
                                          </c:if>
                                       </ul>
                                    </div>
                                    <form id='actionForm3' action="/mypage/" method='get'>
                                       <input type="hidden" name='pageNum3' value='${pageMaker.cri.pageNum}'>
                                       <input type="hidden" name='amount3' value='${pageMaker.cri.amount}'>
                                    </form>
                                    <!-- paging end -->

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 쪽지쓰기 모달 -->
	<div id="new-modal" tabindex="-1" role="dialog" aria-hidden="true"
		class="modal fade">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">쪽지보내기</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>받는사람</label> <input class="form-control" name='nickname'
							readonly>
					</div>
					<input type="hidden" name="receiver_id">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content'></textarea>
					</div>
					<div class="text-left">
						<input type="button" value="보내기" class="modalSendBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						
						function() {					
						openMessageForm();
							//내가 쓴 글 외 글리스트 관련 변수
							var writing = $("#writing");
							var commented = $("#commented");
							var liked = $("#liked");
							
							//리스트 넣을 곳
							var listUL = $("#ajaxList");

							//내가 쓴 글 외 글리스트 관련 이벤트
							//1. 내가 쓴 글 
							writing.on("click", function(e){
								showWritingList();
							})
							
							//2. 내가 댓글 쓴 글
							commented.on("click", function(e){
								showCommentedList();	
							})
							
							//3. 내가 좋아요 한 글 
							liked.on("click", function(e){
								showLikedList();
							})
							
							//내가 쓴 글 외 글리스트 ajax메서드
							var listService = (function() {
								//1. 내가 쓴 글
								function getWritingList(callback, error) {
									$.getJSON("/user/api/Writinglist/"+<%=member.getId()%>+".json",
											function(data) {
												if (callback) {
													callback(data);
												}
											}).fail(function(xhr, status, err) {
										if (error) {
											error();
										}
									});
								}
								//2. 내가 댓글 단 글
								function getCommentedList(callback, error) {
									$.getJSON("/user/api/Commentedlist/"+<%=member.getId()%>+".json",
											function(data) {
												if (callback) {
													callback(data);
												}
											}).fail(function(xhr, status, err) {
										if (error) {
											error();
										}
									});
								}
								//3. 내가 좋아요 한 글
								function getLikedList(callback, error){
									$.getJSON("/user/api/Likedlist/"+<%=member.getId()%>+".json",
											function(data) {
												if (callback) {
													callback(data);
												}
											}).fail(function(xhr, status, err) {
										if (error) {
											error();
										}
									});
								}
								
								return {
									getWritingList : getWritingList,
									getCommentedList : getCommentedList,
									getLikedList : getLikedList
								};
							})();
							
							
							//1. ajax메서드 사용해서 내가 쓴 글 가져오기(default)
							function showWritingList() {
								listService.getWritingList(function(list) {
											var str = "";
											if (list == null
													|| list.length == 0) {
												listUL.html("<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성일자</th><th>조회수</th></tr>");
												return;
											}
											str += "<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성일자</th><th>조회수</th></tr>";

											for (var i = 0, len = list.length || 0; i < len; i++) {
												str += "<tr><td class='font-grey'>자유게시판</td>";
												str += "<td><a href='' class='nondeco'>"
														+ list[i].title
														+ "</td>";
												str += "<td><a href='' class='nondeco'>"
														+ list[i].created_date
																.substring(2, 4)
														+ "/"
														+ list[i].created_date
																.substring(5, 7)
														+ "/"
														+ list[i].created_date
																.substring(8,
																		10)
														+ "</td>";
												str += "<td><a href='' class='nondeco'>"
														+ list[i].view_count
														+ "</td>";
											}
											
											listUL.html(str);
										});
							};

							showWritingList();
							
							//2. ajax메서드 사용해서 내가 댓글 쓴 글 가져오기
							function showCommentedList() {
								listService.getCommentedList(function(list) {
											var str = "";
											if (list == null
													|| list.length == 0) {
												
												listUL.html("<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>");
												return;
											}
											str += "<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>";
											for (var i = 0, len = list.length || 0; i < len; i++) {
												str += "<tr><td class='font-grey'>자유게시판</td>";
												str += "<td><a href='' class='nondeco'>"
														+ list[i].title
														+ "</a></td>";
												str += "<td><div class='dropdown'><a href='#' class='nondeco'>"
													+ list[i].nickname
													+ "</a>";
												if(user_id==list[i].user_id){
													
												}else{
		                                        str += "<div class='dropdown-content'><a href='./member/detail/"+list[i].id+"'>작성게시글 보기</a>";
		                                        str += "<a href='#' data-toggle='modal' class='showmodal' data-target='#new-modal'"
		                                        str += "data-id="+list[i].id+"";
		                                        str += " data-nick="+list[i].nickname;
		                                        str += ">쪽지보내기</a></div>"
												};
												str += "</div></td>";
				
												str += "<td><a href='' class='nondeco'>"
														+ list[i].created_date
																.substring(2, 4)
														+ "/"
														+ list[i].created_date
																.substring(5, 7)
														+ "/"
														+ list[i].created_date
																.substring(8,
																		10)
														+ "</td>";
												str += "<td><a href='' class='nondeco'>"
														+ list[i].view_count
														+ "</td>";
											}
											listUL.html(str);
											openMessageForm();
										});
							};
							//3. ajax메서드 사용해서 내가 좋아요 한 글 가져오기
							function showLikedList() {
								listService.getLikedList(function(list) {
									var str = "";
									if (list == null
											|| list.length == 0) {
										listUL.html("");
										return;
									}
									str += "<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>"
										for (var i = 0, len = list.length || 0; i < len; i++) {
											str += "<tr><td class='font-grey'>자유게시판</td>";
											str += "<td><a href='' class='nondeco'>"
													+ list[i].title
													+ "</a></td>";
											str += "<td><div class='dropdown'><a href='#' class='nondeco'>"
												+ list[i].nickname
												+ "</a>";
											if(user_id==list[i].user_id){
												
											}else{
	                                        str += "<div class='dropdown-content'><a href='./member/detail/"+list[i].id+"'>작성게시글 보기</a>";
	                                        str += "<a href='#' data-toggle='modal' class='showmodal' data-target='#new-modal'"
	                                        str += "data-id="+list[i].id+"";
	                                        str += " data-nick="+list[i].nickname;
	                                        str += ">쪽지보내기</a></div>"
											};
											str += "</div></td>";
			
											str += "<td><a href='' class='nondeco'>"
													+ list[i].created_date
															.substring(2, 4)
													+ "/"
													+ list[i].created_date
															.substring(5, 7)
													+ "/"
													+ list[i].created_date
															.substring(8,
																	10)
													+ "</td>";
											str += "<td><a href='' class='nondeco'>"
													+ list[i].view_count
													+ "</td>";
										}
										listUL.html(str);
										openMessageForm();
											});
							};
							
							//쪽지보내기 메서드 선언
							function openMessageForm(){
								
								var showmodal = $(".showmodal");
								
								//쪽지보내기(모달)관련 이벤트
								showmodal.on("click",function(e) {
									var id = $(this).data("id");
									var nick = $(this).data("nick");
									modalInputReceiver_id3.val(id);
									modalInputReceivedNickname3.val(nick);
									$("#new-modal").modal("show");
								});
								
							}
		
							//쪽지보내기(모달)관련 변수
							var newModal = $("#new-modal");
							
							var modalInputReceivedNickname3 = newModal
									.find("input[name='nickname']");
							var modalInputTitle3 = newModal
									.find("input[name='title']");
							var modalInputContent3 = newModal
									.find("textarea[name='content']");
							var modalInputReceiver_id3 = newModal
									.find("input[name='receiver_id']");

							var modalSendBtn = $(".modalSendBtn");
							
							
							modalSendBtn.on("click", function(e) {
								var message = {
									title : modalInputTitle3.val(),
									content : modalInputContent3.val(),
									sender_id : user_id,
									receiver_id : modalInputReceiver_id3.val()

								}
								messageService.writeMessage(message, function(
										result) {
									alert("result : " + result);
									$("#new-modal").modal("hide");
									location.reload();
								});
							});
							
							//쪽지보내기 ajax메서드
							var messageService = (function() {
								function writeMessage(message, callback, error) {
									$.ajax({
												type : 'post',
												url : '/mypage/api/message/new',
												data : JSON.stringify(message),
												contentType : "application/json; charset=utf-8",
												success : function(result,
														status, xhr) {
													if (callback) {
														callback(result);
													}
												},
												error : function(xhr, status,
														er) {
													if (error) {
														error(er);
													}
												}
											})
								}
								return {
									writeMessage : writeMessage
								};
							})();
							
						});
	</script>
</body>
</html>