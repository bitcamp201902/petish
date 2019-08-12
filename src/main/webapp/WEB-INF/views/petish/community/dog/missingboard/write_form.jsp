<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- CSS 파일 추가 -->
<link rel="stylesheet" type="text/css" href="/resources/css/missingboard/write_modify.css">
<!-- 지도 추가 -->
<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
<!-- datetimepicker 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">

</head>

<body>
	<div id="all">
		<%@ include file="/WEB-INF/views/commons/top.jspf"%>
		<%
			//로그인 확인
			System.out.println("Login???? : " + loginedUser);
			if(loginedUser == null){
				System.out.println("here!!");
				out.println("<script>");
				out.println("location.href='/dog/missingboard/list'");
				out.println("</script>");
			}
		%>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 실종견게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">강아지</a></li>
							<li class="breadcrumb-item active">실종견게시판</li>
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
								<h3 class="text-uppercase">글 쓰기</h3>
							</div>
							<div class="col-lg-10 text-right p-3"
								style="display: inline-block;">
								<a href="/dog/missingboard"
									class="btn btn-template-outlined" style="margin-top: 10px;">목록</a>
							</div>
							<h4>[실종견 정보 작성]</h4>
							<form role="form" name="dogLostPostForm" id="dogLostPostForm" onsubmit="return formCheck()"
								action="/dog/missingboard/register" method="post">

								<input type="hidden" name="user_id" id="USER_ID"
									value=<%=loginedUser.getId()%>>
								<div class="row">
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="DOG_NAME">이름</label>
                                            <input id="DOG_NAME" name="dog_name" type="text" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="DOG_AGE">나이</label>
                                            <input type="text" class="form-control" name="dog_age" id="DOG_AGE">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="SPECIES_ID">종</label>
											<select name="species_id" id="SPECIES_ID" class="form-control">
												<option value="0">종 선택</option>
												<option value="0">--------소형견--------</option>
												<option value="1">믹스견</option>
												<option value="2">스피츠</option>
												<option value="3">꼬똥 드 툴레아</option>
												<option value="4">시츄</option>
												<option value="5">요크셔테리어</option>
												<option value="6">포메라니안</option>
												<option value="7">푸들</option>
												<option value="8">치와와</option>
												<option value="9">미니핀</option>
												<option value="10">슈나우저</option>
												<option value="11">페키니즈</option>
												<option value="12">닥스훈트</option>
												<option value="13">빠삐용</option>
												<option value="14">기타 소형견</option>												
												<option value="0">--------중형견--------</option>												
												<option value="15">비숑프리제</option>
												<option value="16">보스턴테리어</option>
												<option value="17">샤페이</option>
												<option value="18">웰시코기</option>
												<option value="19">비글</option>
												<option value="20">코카스파니엘</option>
												<option value="21">불독</option>
												<option value="22">기타 중형견</option>									
												<option value="0">--------대형견--------</option>												
												<option value="23">사모에드</option>
												<option value="24">피레니즈</option>
												<option value="25">리트리버</option>
												<option value="26">말라뮤트</option>
												<option value="27">한국토종견</option>
												<option value="28">허스키</option>
												<option value="29">세퍼트</option>
												<option value="30">하운드</option>
												<option value="31">달마시안</option>
												<option value="32">콜리</option>
												<option value="33">쉽독</option>
												<option value="34">기타 대형견</option>
											</select>
										</div>
									</div>

									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label>성별</label>
											<div class="checkbox" style="padding-top: 10px;">
												<label class="radioContainer" style="border-right:2rem;">수컷
												  <input type="radio" value="수컷" id="male" name="radio" >
												  <span class="radioCheckmark"></span>
												</label>
												<label class="radioContainer">암컷
												  <input type="radio" value="암컷" id="female" name="radio">
												  <span class="radioCheckmark"></span>
												</label>												
												<input type="hidden" value="" name="dog_gender" id="DOG_GENDER">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="form-group uploadDiv">
													<label>사진</label>
													<input type="file" id="uploadFile" name='dog_image' multiple>
												</div>
												<div class='uploadResult'>
													<ul>
													<!-- 썸네일,파일 이름 출력 -->
													</ul>
												</div>												
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label style="display: block">특징(최대 5개까지 입력 가능합니다.)</label>

											<table class="addTable">
												<input type="text" class="form-control" id="description1"
													name="dog_description"
													style="display: inline-block; width: 80%;">
												<button id="addButton" class="btn btn-sm btn-template-main"
													type="button" onClick="insRow()"
													style="font-size: 0.9rem; margin-left: 0.2rem;'">추가</button>

												<div id="addHere">
                                    			<!-- 특징 입력 폼 추가될 자리 -->
                                    			</div>
											</table>
										</div>
									</div>
								</div>

								<hr>

								<h4>[실종 관련 정보 작성]</h4>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="datetimepicker">실종 일시</label> <input
												id="datetimepicker" name="dog_lost_date"
												type="datetime" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="place">실종 장소</label> <input
												name="dog_lost_address" id="place" type="text"
												class="form-control">
										</div>
									</div>
									<div class="col-md-1.5" style="padding-top: 6px;">
										<div class="form-group">
											<label for="category"></label> <input type="button"
												class="form-control" value="검색"
												onclick="openZipcode(this.form)" />
										</div>
									</div>
								</div>
								<!-- 지도 -->
								<div class="map_wrap">
									<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
								</div>
								<div style="padding: 20px;"></div>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="REWARD">사례금</label> <input type="text"
												class="form-control" name="reward" id="REWARD">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="PHONE_NUMBER">연락처</label> <input type="text"
												class="form-control" name="phone_number" id="PHONE_NUMBER">
										</div>
									</div>
								</div>
								<div class="row" style="padding-top: 10px;">
									<div class="col-md-12 text-right">
										<input type="submit" value="확인"
											class="btn btn-outline-primary" id="input_post"
											name="input_post" style="margin: 1rem">
										<button type="button" onclick="href='/dog/missingboard'"
											class="btn btn-outline-primary">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JS 파일 추가 -->
	<script src="/resources/js/missingboard/write_modify.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script src="/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
	<script src="/resources/js/datepicker_missingboard.js"></script>
	<script src="/resources/js/boardMap/write_map.js"></script>
	<script src="/resources/js/region.js"></script>
	
</body>
</html>