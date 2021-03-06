<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Universal - All In 1 Template</title>

<!-- 부트스트랩 추가 -->
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
	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" >
	
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
        <link rel="stylesheet" href="/resources/css/write-modify.css">
        <link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
</head>

<body>
	<div id="all">
		<script src="/resources/vendor/jquery/jquery.min.js"></script>
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">고양이 실종견게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">고양이</a></li>
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
							<div class="col-lg-10 text-right p-3" style="display:inline-block;">
										<a href="/cat/missingboard/list" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
							<h4>[실종견 정보]</h4>
							<form id="missingMap">
								<div class="row">
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="category">이름</label>
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="category">나이</label>
											<input type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">	
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">종</label> <select id="size"
												class="form-control">
												<option value="">종</option>
												<option value="1">오드아이</option>
												<option value="2">노령 고양이</option>
												<option value="3">코리안 숏헤어</option>
												<option value="4">믹스 고양이</option>
												<option value="5">페르시안</option>
												<option value="6">터키쉬 앙고라</option>
												<option value="7">러시안 블루</option>
												<option value="8">샴</option>
												<option value="9">스코티쉬 폴드</option>
												<option value="10">뱅갈</option>
												<option value="11">아메리칸 숏헤어</option>
												<option value="12">노르웨이 숲</option>
												<option value="13">랙돌</option>
												<option value="14">브리티쉬 숏헤어</option>
												<option value="15">먼치킨</option>
												<option value="16">아비시니안</option>
												<option value="17">스핑크스</option>
												<option value="18">기타 고양이</option>
												
												
											</select>
										</div>
									</div>
									
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label>성별</label>
											<div class="checkbox" style="padding-top:10px;">
												<label>
													<input type="radio" value="male" name="gender" >
													수컷
												</label>
												<label>
													<input type="radio" value="female" name="gender" >
													암컷
												</label>
											</div>
											
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label for="password_old">사진</label> 
											<input type="file" >
												
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label for="password_old">특징</label> 
											<input type="text" class="form-control">
												
										</div>
									</div>
								</div>
								<hr>
								<h4>[실종 관련 정보]</h4>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">연락처</label> <input type="text" class="form-control">
											
										</div>
									</div>
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">사례금</label> <input type="text" class="form-control">
											
										</div>
									</div>
								</div>
								
								<div class="row">
									
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="category">지역</label> <select id="region" onchange="categoryChange(this)"
												class="form-control">
												<option value="">지역</option>
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
											<label for="category">시/구</label> <select id="sml_region"
												class="form-control">
												<option>시/구</option>
												
											</select>
										</div>
									</div>
									
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">실종 일시</label> <input id="datetimepicker" type="text" class="form-control">
											
										</div>
									</div>
									
								</div>
								<div class="row" >
									<div class="col-md-6">
										<div class="form-group">
											<label for="category">실종 장소</label>									
											<input id="place" name="ADDR" type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-1.5" style="padding-top: 6px;">
										<div class="form-group">
											<label for="category">    </label>									
											<input type="button" class="form-control" value="검색" onclick="openZipcode(this.form)" />
										</div>
									</div>
								</div>
								<div class="map_wrap">
    								<div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div>
    							</div>
								
									
								
								
								
								<div class="row" style="padding-top: 10px;">
									<div class="col-md-12 text-right">
										<button type="submit" class="btn btn-outline-primary">확인</button>
										<button type="reset" class="btn btn-outline-primary"
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
	<!-- Javascript files-->
	
	<script src="/resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js">
		
	</script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js">
		
	</script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
	
	
	<!-- 다음지도 api 추가 -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	
	<!-- datetimepicker 추가 -->
	
	<script src="/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
		
	<!-- 지도 -->
	<script src="/resources/js/datepicker.js"></script>
	<script src="/resources/js/boardMap/write_map.js"></script>
	<script src="/resources/js/region.js"></script>
	
</body>
</html>