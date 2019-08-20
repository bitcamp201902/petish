<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page
	import="com.community.petish.community.user.dto.response.LoginedUser"%>
<%@ page import="com.community.petish.community.dog.freeboard.dto.*"%>

<%
	DogFreePostResponseDTO dto = (DogFreePostResponseDTO) request.getAttribute("dto");
	System.out.println(dto);
	
	//댓글 갯수
	int commentCount = Integer.parseInt((request.getAttribute("commentCount").toString()));
	
	//댓글 페이지  번호
	int pageNum = 1;
	if((DogFreePostPageDTO)request.getAttribute("pageMaker") != null){
		DogFreePostPageDTO pageDTO = (DogFreePostPageDTO)request.getAttribute("pageMaker");
		pageNum = pageDTO.getCri().getPageNum();	
		request.setAttribute("pageNum", pageNum);
	}
	
	//게시판 아이디
	Long boardId = 1L;
%>
<!DOCTYPE html>
<html>
<head>
<%-- <title><%=dto.getTitle()%></title> --%>

<%@ include file="/WEB-INF/views/commons/link.jspf"%>

<link rel="stylesheet" href="/resources/css/freeboard/detail.css">
<link rel="stylesheet" href="/resources/css/missingboard/comment.css">

<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<body style="font-family: 'Do Hyeon', sans-serif;">

	<div id="all">
		<%@ include file="/WEB-INF/views/commons/cat_top.jspf"%>
		<%
			Long userId = null;
			String userNickname = "";

			if (loginedUser != null) {
				userId = loginedUser.getId();
				userNickname = loginedUser.getNickname();

				System.out.println("유저아이디 : " + userId);
				System.out.println("유저닉네임 : " + userNickname);
			}
		%>

		<!-- 게시판명 -->
		<div id="heading-breadcrumbs" class="border-top-0 border-bottom-0" style="padding-bottom:10px;">
			<div class="container">
	            <div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-12" style="margin-top:2rem">
						<div style="float:left"><h1 class="h2">자유게시판</h1></div>
		                <div style="float:right">
		                	<button type="submit" class="list btn btn-template-outlined custom-button to-list-btn">
		              		<i class="fa fa-align-justify"></i>
		              		<a href="/dog/freeboard"> 목록 </a>
		              		</button>
		              	</div>
		              	<hr style="color:rgba(0,0,0,0.10); margin-top:4rem">
		           </div>
	           </div>
           </div>
		</div>

		<div class="container">
			<div class="col-md-13">
			
				<!-- 글 제목 -->
				<div class="panel-heading">
					<a class="btn btn-sm btn-template-main catrgory-btn"><%=dto.getCategory_name()%></a>
					<h2 class="h3 panel-title" style="color:black!important;"><%=dto.getTitle()%></h2>
				</div>

				<table>
					<tr>
						<!-- <td><img src="/resources/img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle"></td> -->
						<td>
							<div class="nav navbar-nav ml-auto">
								<a href="#" data-toggle="dropdown" class="nickname dropdown" style="color:black!important;"><%=dto.getNickname()%></a>
						
								<div class="dropdown-menu writerDetail">
									<div class="dropdown">
										<a href="#" class="nav-link">게시글보기</a>
									</div>
									<div class="dropdown">
										<a href="#" class="nav-link">쪽지보내기</a>
									</div>
								</div>
							</div>
						</td>

						<td class=date-view><i class="fa fa-clock-o"></i> <fmt:formatDate
								pattern="yyyy-MM-dd hh:mm" value="<%=dto.getCreated_date()%>" />
							<i class="fa fa-eye"
							style="padding-left: 2rem; padding-right: 0.2rem"></i><%=dto.getView_count()%>
						</td>
					</tr>
				</table>
			</div>

			<hr size="10px">

			<!-- 글 내용 -->
			<div id="post-content" style="color:black!important;">
				<%=dto.getContent()%>
			</div>
			
			<div style="padding: 5rem"></div>
			<hr size="10px" style="padding:1rem;">

			<!-- 댓글창 -->
			<div id="comments">

				<!-- 댓글 갯수 -->
				<h4 class="text-uppㄹercase" id="commentCount">
					<input type="text" id="commentCountVal">
				</h4>
				<!-- 댓글 내용 -->
				<section>
					<div id="commentList" class="row comment">
						<!-- 댓글 출력 -->
					</div>
				</section>

				<!-- 댓글 페이징 -->
				<div style="padding: 3rem">
					<form id="page_form">
						<!-- criteria -->
						<input type="hidden" name="pageNum" value=<%=pageNum%>> <input
							type="hidden" name="amount" value="10"> <input
							type="hidden" name="post_id" value=<%=dto.getId()%>>
					</form>
					<div class="comment-footer d-flex justify-content-center"></div>
				</div>

				<!-- 댓글 입력창 -->
				<h4 class="comment">댓글 작성</h4>

				<form id="insert_form" method="post">
					<!-- comments -->
					<input type="hidden" name="user_id" value=<%=userId%>>
					<input type="hidden" name="post_id" value=<%=dto.getId()%>>
					<input type="hidden" name="pageNum" value=<%=pageNum%>>

					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label for="name">아이디<span class="required text-primary">*</span></label>
								<input id="NICKNAME" name="nickname" type="text"
									class="form-control" value="<%=userNickname%>" readonly>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group comment-div">
								<label for="comment">내 용 <span
									class="required text-primary">*</span></label>

								<div class="comment-and-button">
									<div class="comment-form">
										<textarea id="CONTENT" name="content" rows="4"
											class="form-control "></textarea>
									</div>

									<div class="comment-button-div">
										<button class="re btn btn-template-outlined comment-input-button" id="input_data" style="height:7.5rem!important">댓글 등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				<div style="margin: 2rem"></div>

				<!-- 수정/삭제/신고 버튼 -->
				<div id="comment-form">
					<div class="row">
						<div class="col-sm-12 text-right">

							<%
								if ((loginedUser != null) && (userId == dto.getUser_id())) {
							%>
							<nav aria-label="Page navigation example"
								class="d-flex justify-content-left">
								<button class="btn btn-template-outlined custom-button">
									<i class="fa fa-pencil"></i> <a
										href="/dog/freeboard/modifyForm/<%=dto.getId()%>">수정 </a>
								</button>
								<button type="submit"
									class="btn btn-template-outlined custom-button">
									<i class="fa fa-trash-o"></i> <a
										href="/dog/freeboard/delete/<%=dto.getId()%>">삭제 </a>
								</button>
							</nav>
							<%
								}
							%>

							<div class="col-sm-12 text-right">
								<!-- 게시글 신고 버튼 -->
								<button type="button" class="btn btn-danger" data-toggle="modal"
									style="float: right;" id="report-btn">신고</button>
							</div>
						</div>
					</div>
				</div>
				<div style="margin: 5rem"></div>

				<!-- 신고 모달 -->
				<div id="report-modal" tabindex="-1" role="dialog"
					aria-hidden="true" class="modal fade">
					<div role="document" class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 align="center" class="modal-title">게시글 신고</h4>
								<button type="button" data-dismiss="modal" aria-label="Close"
									class="close">
									<span aria-hidden="true">×</span>
								</button>
							</div>

							<div class="modal-body">
								<form id="report_form" method="POST">

									<input type="hidden" name="board_id" id="BOARD_ID"
										value=<%=boardId%>> <input type="hidden"
										name="post_id" id="POST_ID" value=<%=dto.getId()%>> <input
										type="hidden" name="user_id" id="USER_ID" value=<%=userId%>>
									<label style="text-align: left !important;">신고 분류</label>
									<div class="form-group">
										<select id="state" name="category_id" id="category_id"
											class="form-control">
											<option value="0">신고 사유 선택</option>
											<option value="1">부적절한 게시물</option>
											<option value="2">도배 게시물</option>
											<option value="3">광고성 게시물</option>
											<option value="4">비방/비하/욕설 게시물</option>
											<option value="5">음란성 또는 청소년 유해 게시물</option>
											<option value="6">기타</option>
										</select>
									</div>
									<label>내용</label>
									<div class="form-group">
										<textarea name="description" id="description" rows="10"
											class="form-control"></textarea>
									</div>
									<p class="text-center">
										<input type="submit" value="신고"
											class="btn btn-outline-primary" id="input_report"> <a
											style="padding-right: 0.5rem;"></a> <input type="reset"
											class="btn btn-outline-primary" value="취소">
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 신고모달 끝 -->
			</div>
		</div>
	</div>
	
	<script>
	 //신고 시 로그인 확인
	   $('#report-btn').on("click", function(e){
		   <% if(loginedUser == null){ %>
			   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
			   $('#login-modal').modal("show");
			   
		   <%} else{%>		   
		   		$(this).attr('data-target',"#report-modal");
		   		$('#report-modal').modal("show");
		   <%}%>
	   });
	 
	 //쪽지 전송 시 로그인 확인
	   $('#message-btn').on("click", function(e){
		   <% if(loginedUser == null){ %>
			   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
			   $('#login-modal').modal("show");
			   
		   <%} else{%>		   
		   		$(this).attr('data-target',"#message-modal");
		   		$('#message-modal').modal("show");
		   <%}%>
	   });  
	 
	 
	</script>

	<!-- script 파일 추가 -->
	<%-- <%@ include file="/WEB-INF/views/commons/script.jspf" %>--%>
	<!-- include category.js -->
	
	<script type="text/javascript" src="/resources/js/freeboard/comment.js"></script>
	<script src="/resources/js/report.js"></script>
	<script src="/resources/js/freeboard/detail.js"></script>

</body>
</html>