<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>

<%
    LoginedUser loginedUser = (LoginedUser) session.getAttribute("LOGIN_USER");
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<%--    <script src="/resources/js/index/jquery-3.2.1.min.js"></script>--%>

    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/index/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/index/animate.css">
    <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/index/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/index/style.css">

    <link rel="stylesheet" href="/resources/css/index/ionicons.min.css">
    <link rel="stylesheet" href="/resources/css/index/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/index/flaticon.css">

<%--    <link rel="stylesheet" href="/resources/css/top/top.css">--%>
<%--    <link rel="stylesheet" href="/resources/css/top/modal.css?after">--%>
<%--    <link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">--%>

    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">

    <!-- Theme Style -->
    <script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- <script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script> -->
    <script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
    <!-- <script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
    <script src="/resources/js/jquery.parallax-1.1.3.js"></script>
    <script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script> -->
    
    <!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css">
	<!-- 평점 별  -->
	
	<link rel="stylesheet" href="/resources/css/hospital/main_search.css">
	<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
	<script src="/resources/js/region.js"></script>
	
</head>
<%-- <%@ include file="/WEB-INF/views/commons/link.jspf" %> --%>
<body>
<!-- <div id="all"> -->
<%-- <%@ include file="/WEB-INF/views/commons/top.jspf" %> --%>
<!-- 		<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
    		  <source src="/resources/catdog.mp4" type="video/mp4">
		</video> -->


<header role="banner">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">

            <!-- 로고    -->
            <a href="/" class="navbar-brand " style="color:#b5e3d5;font-size : 3.0rem;">
                <!--  <img src="/resources/img/logo.png" id="logo" alt="Universal logo" class="d-none d-md-inline-block">
                 <img src="/resources/img/logo.png" id="logo" alt="Universal logo" class="d-inline-block d-md-none">
                 <span class="sr-only"></span> -->
                <b> Petish</b>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample05">
                <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                    <!--Dog -->
                    <li class="nav-item dropdown pr-2">
                        <a href="javascript: void(0)" data-toggle="dropdown04" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false">강아지<b class="caret"></b></a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a href="/dog/freeboard/list" class="dropdown-item">자유게시판</a>
                            <a href="/dog/gatherboard" class="dropdown-item">정모게시판</a>
                            <a href="/dog/infoboard/list" class="dropdown-item">건강</a>
                            <a href="/dog/missingboard" class="dropdown-item">실종견</a>
                        </div>
                    </li>
                    <!-- Dog END -->
                    <!-- Cat -->
                    <li class="nav-item dropdown pr-2">
                        <a href="javascript: void(0)" data-toggle="dropdown04" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false">고양이<b class="caret"></b></a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a href="/cat/freeboard/list" class="dropdown-item">자유게시판</a>
                            <a href="/cat/gatherboard" class="dropdown-item">정모게시판</a>
                            <a href="/cat/infoboard/list" class="dropdown-item">건강</a>
                            <a href="/cat/missingboard" class="dropdown-item">실종묘</a>
                        </div>
                    </li>
                    <!-- Cat END -->
                    <!-- Etc -->
                    <!-- My Pet -->
                    <li class="nav-item pr-2">
                        <a href="/mypet" class="nav-link">마이펫
                            <b class="caret"></b>
                        </a>
                    </li>
                    <!--  My Pet END -->
                    <!--  Hospital -->
                    <li class="nav-item">
                        <a href="/hospital/search" class="nav-link">병원
                            <b class="caret"></b>
                        </a>
                    </li>


                </ul>
                <ul class="navbar-nav ml-auto">
                    <% if (loginedUser != null) { %>

                    <li class="nav-item cta-btn">
                        <a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle" class="nav-link">
                            <i class="fa fa-user"></i>
                            <span class="d-none d-md-inline-block"><%= loginedUser.getNickname() %>님</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="nav-item cta-btn"><a href="/mypage/" class="nav-link" style="font-size: 0.9rem;">마이페이지</a></li>
                            <li class="nav-item cta-btn"><a href="/mypage/message/list" class="nav-link" style="font-size:0.9rem;">쪽지함   <i class='fa fa-envelope' style='font-size:15px;color:grey;'></i></a></li>
                            <li class="nav-item cta-btn"><a href="/mypage/question/list" class="nav-link" style="font-size:0.9rem;">문의함</a></li>
                            <li class="nav-item cta-btn"><a href="#" class="nav-link" id="logout-button" style="font-size: 0.9rem;">로그아웃</a></li>
                        </ul>
                    </li>
                    <%} else { %>
                    <li class="nav-item cta-btn">
                        <a href="#" data-toggle="modal" class="nav-link" data-target="#login-modal" id="loginModalButton">
                            <i class="fa fa-sign-in"></i>로그인
                        </a>
                    </li>
                    <%} %>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- END header -->

<section class="home-slider owl-carousel">
    <div class="slider-item" style="background-image: url('http://i.imgur.com/ZmUALeT.jpg'); opacity:0.7;">

        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 element-animate">
                    <h3 style="color : #fff;">#고양이 #냥이 #개냥이 #은묘 #집사 #꾹꾹 #고양이발바닥 #깍쟁이</h3><br>
                    <p><a href="/cat/freeboard" class="btn btn-white btn-outline-white">더보기</a></p>
                </div>
            </div>
        </div>

    </div>

    <div class="slider-item" style="background-image: url('http://kr.hdwall365.com/wallpapers/1809/Cute-puppy-sleeping-dreaming_m.jpg');">
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 element-animate">
                    <h3 style="color : #fff;">#강아지 #멍멍이 #똘이 #비글미 #육아 #개판오분전 #애교쟁이</h3><br>
                    <p><a href="/dog/freeboard" class="btn btn-white btn-outline-white">더보기</a></p>
                </div>
            </div>
        </div>

    </div>

    <div class="slider-item" style="background-image: url('http://eknews.net/xe/files/attach/images/1178/709/540/1b36ec79e933ff37bc0e57b36ba5473a.jpg');">
        <!-- http://blogfiles.naver.net/data42/2009/4/21/276/00847023779-hangaori_kjiys9901.jpg -->
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 element-animate">
                    <h3 style="color : #fff;">#햄찌 #햄스터 #쥐시키 #쪼꼬미 #볼빵빵 #터질꺼가탱 #킁킁킁</h3><br>
                    <p><a href="#" class="btn btn-white btn-outline-white">더보기</a></p>
                </div>
            </div>
        </div>

    </div>

    <div class="slider-item" style="background-image: url('http://dimg.donga.com/ugc/CDB/WEEKLY/Article/5a/d0/5c/e0/5ad05ce00110d2738de6.jpg');">
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 element-animate">
                    <h3 style="color : #fff;">#고슴도치 #밤송이 #가시투성이 #밀웜먹방 #귀요미 #따끔따끔 #친해지길바래</h3><br>
                    <p><a href="#" class="btn btn-white btn-outline-white">더보기</a></p>
                </div>
            </div>
        </div>

    </div>

</section>
<!-- END slider -->

<section class="section bg-light element-animate">

    <div class="clearfix mb-5 pb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center heading-wrap">
                    <h2>마이 펫 </h2>
                    <span class="back-text-dark">My Pet</span>
                </div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="row no-gutters">
            <div class="col-md-6">
                <div class="sched d-block d-lg-flex">
                    <div class="bg-image order-2" style="background-image: url('https://c.pxhere.com/photos/7b/38/cat_pet_look_animal_feline_animals_kitten_cute-795388.jpg!d');"></div>
                    <div class="text order-1">
                        <h3>냥이보러와요오오오 제목이여요오오오 </h3>
                        <p>냥냐얀얀얀야냥냐얀야ㄴㅇㄹㄴㅇ라ㅓ니얼넝리ㅏㅓㅇ니라ㅓㄴ이ㅏ러ㅣㅏㄴ어리ㅏㄴ어ㅣㅏㄹ...</p>

                    </div>

                </div>

                <div class="sched d-block d-lg-flex">
                    <div class="bg-image" style="background-image: url('https://c.pxhere.com/photos/b1/90/dog_puppy_pet_animal_cute_labrador-855217.jpg!d');"></div>
                    <div class="text">
                        <h3>시무룩한머어어어어ㅓ어엉지이이이ㅣ이</h3>
                        <p>캬캬캬캬캬캬캬캬캬캬캬캬캬캬캬캬캬캬ㅑ캬캬캬캬캬캬ㅑ캬캬캬캬캬캬캬캬캬캬캬캬ㅑ캬캬캬캬캬ㅑㅋ...</p>


                    </div>

                </div>

            </div>

            <div class="col-md-6">
                <div class="sched d-block d-lg-flex">
                    <div class="bg-image order-2" style="background-image: url('https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/22224952/beagle-puppy-in-large-cushion-chair.jpg');"></div>
                    <div class="text order-1">
                        <h3>강아지멍멍멍멍멍멍멍멍멍멍멍멍멍멍</h3>
                        <p>멍멍멍멍내요오오오오오오ㅗ오오오오오오ㅗ오오오오오오오오오오오ㅗ오오오오오오오ㅗ...</p>

                    </div>

                </div>

                <div class="sched d-block d-lg-flex">
                    <div class="bg-image" style="background-image: url('https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/Puppy_Up_Close.jpg/1062px-Puppy_Up_Close.jpg');"></div>
                    <div class="text">
                        <h3>기여운깜대이이이이이이이이이이ㅣ이</h3>
                        <p>캬캬캬캬캬캬캬캬캬캬어냐어랴너리ㅓㅇ나러ㅣㅇ나ㅓ리ㅏㅇ느라ㅣ어나러이ㅏ너...</p>

                    </div>

                </div>

            </div>
        </div>


    </div>
</section> <!-- .section -->

<section class="section element-animate">

    <div class="clearfix mb-5 pb-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 text-center heading-wrap">
                    <h2>병 원</h2>
                    <span class="back-text-dark">Hospital</span>
                </div>
            </div>
        </div>
    </div>

    <div class="container">

        <div class="row no-gutters">

            <div class="col-md-12" style="background-color: #b5e3d5;">
                <div class="card-body">
                    <div class="row pb-2">
                        <div class="col-md-12">
                            <h4 style="color:#fff;">Search Hospital</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <select id="region" onchange="categoryChange(this)" style="padding-bottom: 6px;padding-top: 6px;"class="form-control">
                                    <option value="0">지역</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="강원">강원</option>
                                    <option value="대전">대전</option>
                                    <option value="세종">세종</option>
                                    <option value="충남">충남</option>
                                    <option value="충북">충북</option>
                                    <option value="부산">부산</option>
                                    <option value="울산">울산</option>
                                    <option value="경남">경남</option>
                                    <option value="경북">경북</option>
                                    <option value="대구">대구</option>
                                    <option value="광주">광주</option>
                                    <option value="전남">전남</option>
                                    <option value="전북">전북</option>
                                    <option value="제주">제주</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <select id="sml_region" class="form-control" style="padding-bottom: 6px;padding-top: 6px;">
                                    <option value="0" selected>시 / 군 / 구</option>
                                </select>
                            </div>
                        </div>

                        <input id="emergency" type="checkbox" style="color:#fff;"> 응급진료
						<img src="/resources/img/placeholder_red.png" style="width: 35px;height: 35px;">
                        <div class="col-md-3">
                            <button type="button" id="hos_search" class="btn btn-primary btn-block" style="background-color: #b5e3d5; border-color:#fff;">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>

    <!-- 지도 화면 시작-->
    <div class="container">
        <div class="map_wrap">
            <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
        </div>
        <br>
        <!-- 지도 화면 끝 -->
        <div id="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="hospital_list">
                            <h2>PET Hospital List</h2>
                        </div>

                        <p class="lead"></p>
                        <div class="row text-center" id="hospList">


                        </div>
                        <!-- 번호   -->
                        <div aria-label="Page navigation" class="d-flex justify-content-center">
                            <ul class="pagination" id="paging">

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section> <!-- .section -->

<%
    if ( loginedUser == null ) {
%>
<!-- Login Modal-->
<div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
    <div role="document" class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="login-modalLabel" class="modal-title">로그인</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">

                <div class="text-center">
                    <label for="email_input" class="inp">
                        <input type="text" id="email_input">
                        <span class="label">이메일</span>
                        <span class="border"></span>
                    </label>
                    <label for="inp" class="inp">
                        <input type="password" id="password_input">
                        <span class="label">비밀번호</span>
                        <span class="border"></span>
                    </label>
                </div>
                <div class="text-center">
                    <button class="btn btn-template-outlined" id="login-button" ><i class="fa fa-sign-in"></i> 로그인</button>
                </div>

                <p class="text-center text-muted">
                    <a href="#" data-toggle="modal" data-target="#join-modal" id="joinFormButton"><strong>회원가입</strong></a>
                    <a href="#" data-toggle="modal" data-target="#find-modal" id="findFormButton"><strong>아이디/비밀번호 찾기</strong></a>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- Login modal end-->

<!-- Sign Up Modal -->
<div id="join-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
    <div role="document" class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="join-modalLabel" class="modal-title">회원가입</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>

            <div class="modal-body">
                <form name="joinform" id="joinform">
                    <div class="join-form text-center">
                        <label for="usernameInput" class="inp">
                            <input type="text" id="usernameInput" name="username" placeholder=" " required>
                            <input type="hidden" id="usernameDuplicationCheckResult" name="usernameDuplicationCheckResult" value="false">
                            <span class="label">이메일</span>
                            <span class="border"></span>
                        </label>
                        <button type="button" class="btn btn-template-outlined joinBtn" id="usernameCertificationRequestButton">중복확인</button>
                        <label id="usernameCheckFalseResult" class="inp" style="display:none; margin-top:0px;">
                            <font size="1" color='red'>이미 존재하는 email입니다.</font>
                        </label>
                        <label for="certificateNumberInput" class="inp certificate-input">
                            <input type="text" id="certificateNumberInput" name="certificate" placeholder="" required>
                            <span class="label">인증번호</span>
                            <span class="border"></span>
                        </label>
                        <button type="button" class="btn btn-template-outlined certificate-input" id="usernameCertificationCheckButton">인증번호 확인</button>
                        <label for="passwordInput" class="inp">
                            <input type="password" id="passwordInput" name="password" placeholder=" " required>
                            <span class="label">비밀번호</span>
                            <span class="border"></span>
                        </label>
                        <label for="passwordCheckInput" class="inp">
                            <input type="password" id="passwordCheckInput" name="passwordCheck" placeholder=" " required>
                            <span class="label">비밀번호 확인</span>
                            <span class="border"></span>
                        </label>
                        <label id="passwordCheckFalseResult" class="inp" style="display:none; margin-top:0px;">
                            <font size="1" color='red'>비밀번호가 일치하지 않습니다.</font>
                        </label>
                        <label for="nicknameInput" class="inp">
                            <input type="text" id="nicknameInput" name="nickname" placeholder=" " required>
                            <input type="hidden" id="nicknameDuplicationCheckResult" name="nicknameDuplicationCheckResult" value="false">
                            <span class="label">닉네임</span>
                            <span class="border"></span>
                        </label>
                        <button type="button" class="btn btn-template-outlined joinBtn" id="nicknameDuplicationCheckButton" >중복확인</button>
                        <label id="nicknameCheckFalseResult" class="inp" style="display:none; margin-top:0px;">
                            <font size="1" color='red'>이미 존재하는 nickname입니다.</font>
                        </label>
                        <label for="addressInput" class="inp">
                            <input type="text" id="addressInput" name="address" placeholder="" readonly required>
                            <span class="label">주소</span>
                            <span class="border"></span>
                        </label>
                        <button class="btn btn-template-outlined joinBtn" id="zipcodeButton" >주소검색</button>
                        <div class="form-group" id="genderInput">
                            <label for="gender">성별</label>
                            <div class="row" id="gender">
                                <input type="radio" name="gender" value="여자" checked> <p>여자</p>
                                <input type="radio" name="gender" value="남자"> <p>남자</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <a></a>
                            <label for="concern">관심사</label>
                            <div class="row" id="concern">
                                <input type="radio" name="concern" value="dog"> <p>강아지</p>
                                <input type="radio" name="concern" value="cat"> <p>고양이</p>
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-template-outlined" id="joinButton" onclick="handledJoinClick(event)"><i class="fa fa-user-md"></i> 회원가입</button>
                        </div>
                    </div>
                </form>
            </div> <!-- modal-body -->
        </div>
    </div>
</div>
<!-- Sign Up Modal end-->

<!-- Find Id/Password Modal-->
<div id="find-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
    <div role="document" class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="find-modalLabel" class="modal-title">아이디/비밀번호 찾기</h4>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>

            <div class="modal-body">
                <form action="#" method="post">
                    <div class="form-group">
                        <label for="find-login">이름과 주민등록번호를 정확히 입력해주세요.</label>
                    </div>
                    <div class="text-center">
                        <label for="nameInput" class="inp">
                            <input type="text" id="nameInput" placeholder=" ">
                            <span class="label">이름</span>
                            <span class="border"></span>
                        </label>
                        <label for="SSNInput" class="inp">
                            <input type="password" id="SSNInput" placeholder=" ">
                            <span class="label">주민번호</span>
                            <span class="border"></span>
                        </label>
                    </div>
                    <div class="text-center" id="find-button">
                        <button type="submit" class="btn btn-template-outlined">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Find Id/Password Modal end-->

<% } %>

<%
    if (loginedUser != null) {
%>
<script src="/resources/js/top/logined.js"></script>
<% } else { %>
<script src="/resources/js/top/non-logined.js"></script>
<% } %>

<!-- footer -->
<footer class="site-footer" role="contentinfo">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-4 mb-5">
                <h3>About Us</h3>
                <p class="mb-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus et dolor blanditiis consequuntur ex voluptates perspiciatis omnis unde minima expedita.</p>
                <ul class="list-unstyled footer-link d-flex footer-social">
                    <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
                    <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
                    <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
                    <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
                </ul>

            </div>
            <div class="col-md-5 mb-5">
                <div class="mb-5">
                    <h3>Opening Hours</h3>
                    <p><strong class="d-block">Sunday-Thursday</strong> 5AM - 10PM</p>
                </div>
                <div>
                    <h3>Contact Info</h3>
                    <ul class="list-unstyled footer-link">
                        <li class="d-block">
                            <span class="d-block">Address:</span>
                            <span class="text-white">34 Street Name, City Name Here, United States</span></li>
                        <li class="d-block"><span class="d-block">Telephone:</span><span class="text-white">+1 242 4942 290</span></li>
                        <li class="d-block"><span class="d-block">Email:</span><span class="text-white">info@yourdomain.com</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 mb-5">
                <h3>Quick Links</h3>
                <ul class="list-unstyled footer-link">
                    <li><a href="#">About</a></li>
                    <li><a href="#">Terms of Use</a></li>
                    <li><a href="#">Disclaimers</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3">

            </div>
        </div>
        <div class="row">
            <div class="col-12 text-md-center text-left">
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </div>
</footer>
<!-- END footer -->

<!-- loader -->
<div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#cf1d16"/></svg></div>




<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>

<script src="/resources/js/index/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/index/magnific-popup-options.js"></script>

<script src="/resources/js/index/main.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
<script src="/resources/js/hospital/hospital.js?ver=1"></script>
<script src="/resources/js/hospital/star.js"></script>
<script>
	var latitude ='';
	var longitude ='';
	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	//지역 시/군 을 저장할 변수
	var region = '';
	
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var defaultaddr = result[0].address_name.split(" ");
            console.log(defaultaddr[0].substring(0,2));
            console.log(defaultaddr[1]);
            $('#region').val(defaultaddr[0].substring(0,2));
          	//지역구 셀렉트박스 다시 불러오는 함수.
			setSelectbox($('#region').val());
			//지역 시/구/군 카테고리 값을 뒤로가기 하기전의 값으로 받아옴
			$('#sml_region').val(defaultaddr[1]);
			region = $('#sml_region').val();
			gethospital(region,$('#emergency').prop('checked') ,1);
	    }
	};
	
	
	//지도 api 선택한 곳 마커 표시하기(주소까지 출력)
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	mapOption = {
   	  center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
  	   level: 3 // 지도의 확대 레벨
	 };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	

	var marker = new kakao.maps.Marker();
	// 마커를 담을 배열입니다
	var markers = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map, marker,name,address_name,hours,score) {
		
		var content = '<div class="bAddr"><span class="title">' + name + '</span><div>주소 : '+address_name+'</div><div>진료시간 : '+hours+'</div>';
			content += '<div><span class="star-rating-40"style="text-align:left;">';
			content += '<span style ="width:'+(score*10.0)+'%"></span>';
			content += '</span><span class="title" style="display:inline-block;">'+score+'</span></div></div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	function clickInfowindow(map, marker, name,fa,ga){
		var iwContent = '<div style="padding:5px;">'+name+' <br><a href="https://map.kakao.com/link/map/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">길찾기</a></div>';
		 infowindow= new kakao.maps.InfoWindow({
		        position : new kakao.maps.LatLng(ga, fa), 
		        content : iwContent 
		    });
		    
		    infowindow.open(map,marker);
	}
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	// 마커를 찍는 함수
	function createMarker(fa,ga, imgsrc,name,addr,hours,score){
		
		// 마커 이미지의 이미지 크기 입니다
		   var imageSize = new kakao.maps.Size(35, 35); 
		// 마커 이미지를 생성합니다    
	  	  var markerImage = new kakao.maps.MarkerImage(imgsrc, imageSize);
	 	// 마커를 생성합니다
	 	
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng(ga, fa),
	        image : markerImage // 마커 이미지 
	    });
	    
	   
	  //마커 클릭시 병원이름, 병원주소가 나오는 클릭이벤트.
		kakao.maps.event.addListener(marker, 'mouseover',function(){
			displayInfowindow(map, marker,name,addr,hours,score);
		});
		kakao.maps.event.addListener(marker, 'mouseout',function(){
			//infowindow.close();
		});
		kakao.maps.event.addListener(marker, 'click',function(){
			infowindow.close();
			clickInfowindow(map,marker,name,fa,ga);
		});
	  //마커 배열에 현재마커를 추가
		markers.push(marker);
	}
		
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	//var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	//검색된 마커들 위치로 지도를 재조정
	function setBounds(){
		map.setBounds(bounds);
	}
	//페이지 버튼 클릭 이벤트
	function pageClick(page){
		gethospital(region, $('#emergency').prop('checked') ,page);
	}
	//-- check hash
	function checkForHash() {	
		//뒤로가기를 했으면
		if(document.location.hash)
		{
		//hash 가 있다면 ^ 를 구분자로 하나씩 string을 추출하여 각각 페이지정보를 가져옵니다.
			var str_hash = document.location.hash;
			str_hash = str_hash.replace("#","");
			var back=str_hash.split("^");
						
			// 지역 변수에 뒤로가기전에 검색했던 지역을 저장
			region = back[0];
			//지역구 셀렉트박스 다시 불러오는 함수.
			setSelectbox($('#region').val());
			//지역 시/구/군 카테고리 값을 뒤로가기 하기전의 값으로 받아옴
			$('#sml_region').val(decodeURI(back[0]));
			//ajax콜 날릴 함수
			gethospital(back[0],$('#emergency').prop('checked'),back[1]);
		} 
		else 
		{
			navigator.geolocation.getCurrentPosition(function(position) {
				  console.log(position.coords.latitude + ", " + position.coords.longitude);
				  latitude = position.coords.latitude;
				  longitude = position.coords.longitude;
				  geocoder.coord2RegionCode(longitude, latitude, callback);
			});
		}
	}

	</script>
	<script>
	$(document).ready(function(){
		
		//-- 문서가 로드 될때마다 hash 체크  뒤로가기를 위한 함수
		checkForHash();

		//--click 이벤트를 걸어 이벤트가 발생할때마다 현재 페이지를 내부링크처럼 hash에 저장해둡니다.
		
		
		

		$('#hos_search').click(function(event){
			if($('#sml_region').val()=="0" || $('#region').val()=="0" ){
				
				alert('지역을 선택해 주세요.');
			}
			else{
				region = $('#sml_region').val();
				gethospital(region,$('#emergency').prop('checked') ,1);
			}
		});
	});
	//$('#sml_region') 지역구 카테고리로 검색하고 병원리스트 가져오는 함수.
	function gethospital(addr, isEmer,page){
		//마커의 정보창 닫아주기
		//console.log('gethospital');
		infowindow.close();
		$('#hospList').empty();
		$('#paging').empty();
		 $.ajax({
			url:'/hospital/search/'+addr+'/'+isEmer+'/'+page,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				//console.log(page);
				
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
				//console.log(data.length);
				//좌표 객체 초기화
				bounds = new kakao.maps.LatLngBounds(); 
				$.each(data.totalList, function(index, item){
					//console.log(data.scorelist.length);
					//console.log(data.scorelist[0]);
					//console.log(item.hospital_name);
					geocoder.addressSearch(item.hospital_addr, function(result, status){
						
				        //응급지료가능 병원일경우 마커 이미지교체
				        if(item.isEmergency == 1){
				    		 createMarker(result[0].x, result[0].y, "/resources/img/placeholder_red.png",item.hospital_name, item.hospital_addr ,item.hospital_hours,data.totalScoreList[index]);
				        }
				        else{
				        	
							/* //새로운 마커를 찍음						
							var marker = new kakao.maps.Marker();
							//마커 위치설정
							marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
							//마커 찍음
							marker.setMap(map); */
				        	// 마커 이미지의 이미지 크기 입니다
				     		createMarker(result[0].x, result[0].y,"/resources/img/placeholder.png",item.hospital_name, item.hospital_addr ,item.hospital_hours,data.totalScoreList[index]);
				        }
						
						// LatLngBounds 객체에 좌표를 추가합니다
					    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
						
						//console.log('index='+index);
						//표시된 마커들로 지도를 재조정하는 함수
						setBounds();
						
					});
				});
				$.each(data.hospitalList, function(index,item){
					
						//병원 리스트 지도 밑에 출력
						var output='';
						output += '<div data-animate="fadeInUp" class="col-md-3">';
						output += '<div class="team-member">';
						output += '<div class="image">';
						output += '<a href="/hospital/'+item.id+'"name="link">';
						var imglist = item.hospital_img.split(",");
						output += '<img src="/resources/img/hospital/'+imglist[0]+'" alt="" class="img-fluid rounded-circle" style="height: 250px; width:250px;"></a>';
						output += '</div>';
						output += '<h4 style="font-size: 25px;">';
						output += '<a href="/hospital/'+item.id+'"name="link">'+item.hospital_name+'</a></h4>';
						output += '<span class="star-rating"style="text-align:left;">';
						output += '<span style ="width:'+(data.scoreList[index]*10.0)+'%"></span>';
						output += '</span>';
						output += '<div class="text">';
						output += '<div>'+item.hospital_addr+'</div>';
						output += '<div>'+item.hospital_phone+'</div>';
						output += '</div></div></div>';
						$('#hospList').append(output);
						
						//병원 상세보기를 클릭했을때 발생하는 이벤트
						$('a[name=link]').click(function(e) {
							//상세보기를 눌렀을때의 페이지
							var currentPage=page;
													

							//상세보기를 누르기 전에 불러왔던 페이지 정보와 지역정보를 hash에 저장
							document.location.hash = "#" + region + "^"+currentPage;

						});
				});
						
						
				
			
				//페이징 처리 반복문
				for(var i = data.paging.startPage; i<=data.paging.endPage; i++){
					var output='';
					if(i == data.paging.startPage){
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+1+')"> <i class="fa fa-angle-double-left"></i></a></li>';
						if(page != 1){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page-1)+')"> <i class="fa fa-angle-left"></i></a></li>';
						}
					}
					output += '<li class="page-item"id="page'+i+'"><a href="#" class="page-link" onclick="pageClick('+i+');">'+i+'</a></li>';
					if(i == data.paging.endPage){
						if(page != data.paging.realEnd){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page+1)+')"> <i class="fa fa-angle-right"></i></a></li>';
						}
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+data.paging.realEnd+')"> <i class="fa fa-angle-double-right"></i></a></li>';
					}
					$('#paging').append(output);
					$("#page"+page).attr('class','page-item active');
				}
				
				
				
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		 });
		//window.location.href = "/hospital/search"+"?"+$.param({"hospital_addr":addr});
	}
	
	</script>
</body>
</html>