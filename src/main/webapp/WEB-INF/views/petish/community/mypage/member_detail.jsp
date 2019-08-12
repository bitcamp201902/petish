<%@page import="com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage"%>
<%@page import="com.community.petish.community.mypage.dto.response.Writings_LikedDTO"%>
<%@page import="com.community.petish.community.mypage.dto.response.Writings_CommentedDTO"%>
<%@page import="com.community.petish.community.mypage.dto.response.MyWritingsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
								<img class="profile" src="<%=member.getPicture()%>"
									style="margin-right: 30px;"> <a><%=member.getNickname()%>(<%=member.getUsername()%>***)</a>
								│ 정회원 │ <a href="" data-toggle="modal"
									data-target="#new-modal" class="showmodal" data-id=<%=member.getId() %> data-nick=<%=member.getNickname() %> style="color:black;"><i
									class="fa fa-envelope" style="margin-right: 10px;color:black;"></i>쪽지 보내기</a>
								<script>
									var user_id =
								<%=member.getId()%>
									;
								</script>
								<%
									Long user_id = member.getId();
								%>
							</div>
						</div>
						<ul id="pills-tab" role="tablist"
							class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item" id="writing"><a id="pills-profile-tab"
								data-toggle="pill" href="#writingList" role="tab"
								aria-controls="pills-profile" aria-selected="false"
								class="nav-link active">내가 쓴 글</a></li>
							<li class="nav-item" id="commented"><a id="pills-home-tab"
								data-toggle="pill" href="#" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									댓글 쓴 글</a></li>
							<li class="nav-item" id="liked"><a id="pills-home-tab"
								data-toggle="pill" href="#s" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
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


												<table class="table table-hover table-bordered"
													id="ajaxList">

												</table>
												<div class="writingfooter"></div>
												<div class="commentedfooter"></div>
												<div class="likedfooter"></div>

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
		var writingfooter = $(".writingfooter");
		var commentedfooter = $(".commentedfooter");
		var likedfooter = $(".likedfooter");
		//리스트 넣을 곳
		var listUL = $("#ajaxList");
		
		var member_id = <%=member.getId()%>;

		//내가 쓴 글 외 글리스트 관련 이벤트


		//내가 쓴 글 외 글리스트 ajax메서드
		var listService = (function() {
			//1. 내가 쓴 글
			function getWritingList(param, callback, error) {

				 var page = param.page || 1; 
				var member_id = <%=member.getId()%>
				$.getJSON("/member/api/Writinglist/" + member_id + "/" + page + ".json",
						function(data) {
							if (callback) {
								callback(data.writingsCnt, data.list);
							}
						}).fail(function(xhr, status, err) {
					if (error) {
						error();
					}
				});
			}

			//2. 내가 댓글 단 글
			function getCommentedList(param, callback, error) {

				var page = param.page || 1;
				var member_id = <%=member.getId()%>;

				$.getJSON("/member/api/Commentedlist/" + member_id + "/" + page + ".json",
						function(data) {
							if (callback) {
								callback(data.commentedCnt, data.list);
							}
						}).fail(function(xhr, status, err) {
					if (error) {
						error();
					}
				});
			}
			//3. 내가 좋아요 한 글
			function getLikedList(param, callback, error) {
				var page = param.page || 1;
				var member_id = <%=member.getId()%>;
				
				$.getJSON("/member/api/Likedlist/" +member_id + "/" + page + ".json",
						function(data) {
							if (callback) {
								callback(data.likedCnt, data.list);
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

		//버튼 클릭시 해당 페이지의 리스트로 넘어가는 메서드
		function moveWritingPage() {
			writingfooter.on("click", "li a", function(e) {
				e.preventDefault();
				console.log("page click");
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum:" + targetPageNum);
				pageNum = targetPageNum;
				showWritingList(pageNum);
				
			})
		};

		function moveCommentedPage() {
			commentedfooter.on("click", "li a", function(e) {
				e.preventDefault();
				console.log("page click");
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum:" + targetPageNum);
				pageNum = targetPageNum;
				showCommentedList(pageNum);
			})
		};

		function moveLikedPage() {
			likedfooter.on("click", "li a", function(e) {

				e.preventDefault();
				console.log("page click");
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum:" + targetPageNum);
				pageNum = targetPageNum;
				showLikedList(pageNum);
			})
		};

		var pageNum = 1;
		//페이징 버튼 생성을 호출하는 메서드
		function showWritingPage(writingsCnt) {
			commentedfooter.html("");
			likedfooter.html("");
			writingfooter.html("");

			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;

			if (endNum * 10 >= writingsCnt) {
				endNum = Math.ceil(writingsCnt / 10.0);
			}

			if (endNum * 10 < writingsCnt) {
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

			writingfooter.html(str);
			moveWritingPage();
		}

		function showCommentedPage(commentedCnt) {
			commentedfooter.html("");
			likedfooter.html("");
			writingfooter.html("");
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;

			if (endNum * 10 >= commentedCnt) {
				endNum = Math.ceil(commentedCnt / 10.0);
			}

			if (endNum * 10 < commentedCnt) {
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

			commentedfooter.html(str);
			moveCommentedPage()
		}

		function showLikedPage(likedCnt) {
			commentedfooter.html("");
			likedfooter.html("");
			writingfooter.html("");
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;

			if (endNum * 10 >= likedCnt) {
				endNum = Math.ceil(likedCnt / 10.0);
			}

			if (endNum * 10 < likedCnt) {
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

			likedfooter.html(str);
			moveLikedPage();
		}
		 
		
		//1. ajax메서드 사용해서 내가 쓴 글 가져오기(default)
		function showWritingList(page) {
			listService
					.getWritingList(
							
							{
								page : page || 1
								
							},
							
							
							function(writingsCnt, list) {

								if (page == -1) {
									pageNum = Math.ceil(writingsCnt / 10.0);
									showWritingList(pageNum);
									return;
								}
								var str = "";
								str += "<tr align='cen;ter' class='font-grey'><th>게시판명</th><th>제목</th><th>작성일자</th><th>조회수</th></tr>"

								if (list == null || list.length == 0) {
									listUL.html(str);
									return;
								}

								for (var i = 0, len = list.length || 0; i < len; i++) {
									str += "<tr><td class='font-grey'>"
											+ list[i].boardType + "</td>";
									str += "<td><a href='' class='nondeco'>"
											+ list[i].title + "</td>";
									str += "<td class='nondeco'>"
											+ list[i].created_date + "</td>";
									str += "<td class='nondeco'>"
											+ list[i].view_count + "</td>";

								}

								listUL.html(str);
								showWritingPage(writingsCnt);

							});
		};

		showWritingList(member_id, 1);

		//2. ajax메서드 사용해서 내가 댓글 쓴 글 가져오기
		function showCommentedList(page) {
			listService
					.getCommentedList(
							{
								page : page || 1
							},
							function(commentedCnt, list) {
								if (page == -1) {
									pageNum = Math.ceil(commentedCnt / 10.0);
									showWritingList(pageNum);
									return;
								}
								var str = "";
								str += "<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>"

								if (list == null || list.length == 0) {
									listUL.html(str);
									return;
								}

								for (var i = 0, len = list.length || 0; i < len; i++) {
									str += "<tr><td class='font-grey'>"
											+ list[i].boardType + "</td>";
									str += "<td><a href='' class='nondeco'>"
											+ list[i].title + "</td>";
									str += "<td class='dropdown'><div class='nondeco'>"
											+ list[i].nickname
											+ "</div>"
									if(<%=loginedUser.getId()%>==list[i].user_id){
												
									}else{
									str += "<div class='dropdown-content'><a href='/member/detail/"+list[i].user_id+"'>작성게시글 보기</a>";
                                    str += "<a href='' data-toggle='modal' class='showmodal' data-target='#new-modal'"
                                    str += "data-id="+list[i].user_id+"";
                                    str += " data-nick="+list[i].nickname;
                                    str += ">쪽지보내기</a></div>"
									};
									str += "</div></td>";
									str += "<td class='nondeco'>"
											+ list[i].created_date + "</td>";
									str += "<td class='nondeco'>"
											+ list[i].view_count + "</td>";

								}

								listUL.html(str);
								showCommentedPage(commentedCnt);
								openMessageForm();
							});
		};
		//3. ajax메서드 사용해서 내가 좋아요 한 글 가져오기
		function showLikedList(page) {
			listService
					.getLikedList(
							{
								page : page || 1
							},
							function(likedCnt, list) {
								if (page == -1) {
									pageNum = Math.ceil(likedCnt / 10.0);
									showWritingList(pageNum);
									return;
								}
								var str = "";
								str += "<tr align='center' class='font-grey'><th>게시판명</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr>"

								if (list == null || list.length == 0) {
									listUL.html(str);
									return;
								}

								for (var i = 0, len = list.length || 0; i < len; i++) {
									str += "<tr><td class='font-grey'>자유게시판</td>";
									str += "<td><a href='' class='nondeco'>"
											+ list[i].title
											+ "</a></td>";
									str += "<td><div class='dropdown'><div class='nondeco'>"
										+ list[i].nickname
										+ "</a>";
									if(<%=loginedUser.getId()%>==list[i].user_id){
										
									}else{
                                    str += "<div class='dropdown-content'><a href='/member/detail/"+list[i].user_id+"'>작성게시글 보기</a>";
                                    str += "<a href='#' data-toggle='modal' class='showmodal' data-target='#new-modal'"
                                    str += "data-id="+list[i].id+"";
                                    str += " data-nick="+list[i].nickname;
                                    str += ">쪽지보내기</a></div>"
									};
									str += "</div></td>";
	
									str += "<td class='nondeco'>"
											+ list[i].created_date
											+ "</td>";
									str += "<td class='nondeco'>"
											+ list[i].view_count
											+ "</td>";
								}
								listUL.html(str);
								showLikedPage(likedCnt);
								openMessageForm();
									});
		};

		//1. 내가 쓴 글 
		writing.on("click", function(e) {
			showWritingList();
			pageNum=1;
		})

		//2. 내가 댓글 쓴 글
		commented.on("click", function(e) {
			showCommentedList();
			pageNum=1;
		})

		//3. 내가 좋아요 한 글 
		liked.on("click", function(e) {
			showLikedList();
			pageNum=1;
		})
		
		//쪽지보내기 메서드 선언
		function openMessageForm() {

			var showmodal = $(".showmodal");

			//쪽지보내기(모달)관련 이벤트
			showmodal.on("click", function(e) {
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
			messageService.writeMessage(message, function(result) {
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
					success : function(result, status, xhr) {
						if (callback) {
							callback(result);
						}
					},
					error : function(xhr, status, er) {
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