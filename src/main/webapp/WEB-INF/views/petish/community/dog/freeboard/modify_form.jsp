<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>
<%@ page import="com.community.petish.community.dog.freeboard.dto.*"%>
<%
	DogFreePostResponseDTO dto = (DogFreePostResponseDTO)request.getAttribute("dto");

	System.out.println(dto);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>자유게시판 글 작성</title>

<%--<%@ include file="/WEB-INF/views/commons/link.jspf" %>--%>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/gatherboard/write-modify.css">
<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<body style="font-family: 'Do Hyeon', sans-serif;">
	<%@ include file="/WEB-INF/views/commons/cat_top.jspf"%>
	<%
		response.setContentType("text/html; charset=UTF-8");

		//로그인 확인
		if(loginedUser == null){
			out.println("<script>");
			out.println("location.href='/dog/missingboard/list'");
			out.println("</script>");
		}
	
		else{
			LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
			Long userId = user.getId();
		}
	%>
	<div id="all">
		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 정모게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">강아지</a></li>
							<li class="breadcrumb-item active">자유게시판</li>
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
								<h3 id="title" class="text-uppercase">글 수정</h3>
								<a href="/dog/freeboard" id="listBtn"
									class="btn btn-template-outlined">목록</a>
							</div>
							
							<form id="write_form" action="/dog/freeboard/modify" method="post">

							<input type="hidden" name="id" value=<%=dto.getId()%>>

							<div class="row">
								<div class="col-sm-6 col-md-2">
									<div class="form-group">
										<label for="category">카테고리</label> 
										<select id="category_id" class="form-control" name="category_id">
											<option value="0">카테고리 선택</option>
											<option value="1">질문</option>
											<option value="2">일상</option>
											<option value="3">웃긴자료</option>
											<option value="4">정보</option>
										</select>
									</div>
								</div>
							</div>
									
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>제목</label>
										<input name="title" type="text" class="form-control" value=<%=dto.getTitle() %>>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>내용</label>
										<textarea id="summernote" name="content" class="form-control"><%=dto.getContent()%></textarea>
									</div>
								</div>

							</div>
							<div class="col-md-12 text-right">
								<button type="submit" class="btn btn-template-outlined">확인</button>
								<button type="reset" class="btn btn-template-outlined"
									id="resetbtn">취소</button>
							</div>
							
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	var category = "<%=dto.getCategory_id()%>"	
	
	//수정 전 강아지 종류 SELECT
    $('#category_id option').each(function() {
        if (this.value == category) {
            this.selected=true;
        }
	});
	
	</script>
	
	<%--	<%@ include file="/WEB-INF/views/commons/script.jspf" %>	--%>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote.js"></script>
	<!-- include category.js -->
	<script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/writeForm.js"></script>
</body>
</html>