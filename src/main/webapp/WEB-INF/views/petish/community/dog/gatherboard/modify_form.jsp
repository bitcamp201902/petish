<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO" %>
<%
	DogGatherPostVO post = (DogGatherPostVO)request.getAttribute("post");
	Long dogSizeID = (Long)request.getAttribute("size");
	String dogSize = "";
	
	if(dogSizeID == 1L) {
		dogSize = "소";
	}
	else if(dogSizeID == 2L) {
		dogSize = "중";
	}
	else if(dogSizeID == 3L) {
		dogSize = "대";
	}	
%>
<!DOCTYPE html>
<html>
<head>
<title>정모게시판 글 수정</title>	
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
	<!-- datetimepicker 추가 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" >
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<link href="/resources/css/fonts.css" rel="stylesheet">        
    <link rel="stylesheet" href="/resources/css/gatherboard/write-modify.css">
    <link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
</head>

<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif; letter-spacing: 1.5px; font-weight: 100;">
	<%@ include file="/WEB-INF/views/commons/dog_top.jspf" %>
	<div id="all">	
		<div class="content-fluid body-section">
			<div id="heading-breadcrumbs">
				<div class="container">
					<div class="row d-flex align-items-center flex-wrap">
						<div class="col-md-7">
							<h1 class="h2">강아지 정모게시판</h1>
						</div>
						<div class="col-md-5">
							<ul class="breadcrumb d-flex justify-content-end">
								<li class="breadcrumb-item"><a href="/dog/gatherboard">정모게시판</a></li>
								<li class="breadcrumb-item active">글수정</li>
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
											<a href="/dog/gatherboard" id="listBtn" class="btn btn-template-outlined">목록</a>
								</div>
								
								<form id="searchMap" action="/dog/gatherboard/modifyPost/<%=post.getID() %>" onsubmit="return Check()"  method="post">
									<div class="row">
										<div class="col-sm-6 col-md-2">
											<div class="form-group">
												<label for="category">지역</label> 
												<select id="region" class="form-control" name="REGION_ID">
													<option value="">지역선택</option>
													<option value="1">서울</option>
													<option value="2">경기</option>
													<option value="3">인천</option>
													<option value="4">강원</option>
													<option value="5">대전</option>
													<option value="6">세종</option>
													<option value="7">충남</option>
													<option value="8">충북</option>
													<option value="9">부산</option>
													<option value="10">울산</option>
													<option value="11">경남</option>
													<option value="12">경북</option>
													<option value="13">대구</option>
													<option value="14">광주</option>
													<option value="15">전남</option>
													<option value="16">전북</option>
													<option value="17">제주</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6 col-md-2">
											<div class="form-group">
												<label for="category">크기</label> 
												<select id="size" class="form-control" name="DOG_SIZE" onchange="javascript:categoryChange();">
													<option value="">크기</option>
													<option value="1">소</option>
													<option value="2">중</option>
													<option value="3">대</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6 col-md-2">
											<div class="form-group">
												<label for="category">종 선택</label> 							
												<select id="species" class="form-control" name="SPECIES">
													<option value="<%= request.getAttribute("species") %>"><%= request.getAttribute("species") %></option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6 col-md-2">
											<div class="form-group">
												<label for="category">참여인원</label> 
												<select id="personnel" class="form-control" name="PEOPLE_COUNT">
													<option value="">인원</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6 col-md-4">
											<div class="form-group">
												<label for="category">모임일시</label> 
												<input id="datetimepicker" type="text" name="STR_GATHRING_DATE" value="<%= post.getGATHERING_DATE() %>" class="form-control">
											</div>
										</div>
									</div>
									<div class="row" >
										<div class="col-md-6">
											<div class="form-group">
												<label for="category">모임장소</label>									
												<input id="place" name="GATHERING_ADDRESS" type="text" value="<%= post.getGATHERING_ADDRESS() %>" class="form-control">
											</div>
										</div>
										<div class="col-md-1.5" style="padding-top: 6px;">
											<div class="form-group">
												<label for="category"></label>									
												<input type="button" class="form-control" id="button" value="검색" onclick="openZipcode(this.form)" />
											</div>
										</div>
									</div>
									<div class="map_wrap">
	    								<div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div>
	    							</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="password_old" id="title">제목</label> <input id="password_old"
													name="TITLE" type="text" value="<%= post.getTITLE() %>" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="password_1">내용</label>
												<textarea id="summernote" name="CONTENT" class="form-control"><%= post.getCONTENT() %></textarea>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<a href="/dog/gatherboard/deleteDogGatherPost/<%=post.getID() %>" class="btn btn-template-outlined" id="button"
												style="margin-top: 0px;">삭제</a>
										</div>
										<div class="col-md-9 text-right">
											<button type="submit" class="btn btn-template-outlined" id="button">수정</button>
											<button type="reset" class="btn btn-template-outlined"
												id="resetbtn">취소</button>
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
	<%@ include file="/WEB-INF/views/commons/script.jspf" %>			
	<!-- selectbox값 가져오기 -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script>
	//selectbox 값을 db에서 가져온다
	var region = <%= post.getREGION_ID()%>; //받아온값
	var personnel = <%= post.getPEOPLE_COUNT() %>;
	var size = <%= request.getAttribute("size") %>
	
	$("#region").val(region);
	$("#personnel").val(personnel);
	$("#size").val(size);
	</script>	
	<!-- 다음지도 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>	
	<script src="/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>		
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/resources/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote.js"></script>
	<script src="/resources/js/datepicker.js"></script>
	<script src="/resources/js/gatherboard/write_map.js"></script>
	<script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/writeForm.js"></script>

</body>
</html>