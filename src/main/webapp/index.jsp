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
                            <li class="nav-item cta-btn"><a href="/mypage/message/list" class="nav-link" style="font-size:0.9rem;">쪽지함   <i class='fa fa-envelope' style='font-size:15px;color:grey;'>3</i></a></li>
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

                    <!-- <li class="nav-item cta-btn">
                      <a class="nav-link" href="contact.html">Contact Us</a>
                    </li> -->
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
                                <select id="region" onchange="categoryChange(this)" class="form-control">
                                    <option value="0">지역</option>
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
                        <div class="col-md-3">
                            <div class="form-group">
                                <select id="sml_region" class="form-control">
                                    <option value="0" selected>시 / 군 / 구</option>
                                </select>
                            </div>
                        </div>

                        <input id="emergency" type="checkbox" style="color:#fff;"> 응급진료

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
<!— </div> —>
</body>
</html>