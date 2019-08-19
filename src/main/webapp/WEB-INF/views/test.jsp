<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="top-bar">
	<div class="container">
		<div class="row d-flex align-items-center">
			<div class="col-md-6 d-md-block d-none"></div>
			<div class="col-md-6">
				<div class="d-flex justify-content-md-end justify-content-between">
					<ul class="list-inline contact-info d-block d-md-none">
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-phone"></i></a></li>
						<li class="list-inline-item"><a href="#"><i
								class="fa fa-envelope"></i></a></li>
					</ul>
					<!-- Login User -->
					<div class="login">
						<li class="nav-item dropdown"><a href="javascript: void(0)"
							style="color: #fff;" data-toggle="dropdown"
							class="dropdown-toggle"><i class="fa fa-user"></i><span
								class="d-none d-md-inline-block">&nbsp;&nbsp;petish님</span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-item"><a href="MyPage_Main.html" class="nav-link"
									style="font-size: 0.9rem;">마이페이지</a></li>
								<li class="dropdown-item"><a href="header.html"
									class="nav-link" style="font-size: 0.9rem;">로그아웃</a></li>
							</ul></li>
					</div>
					<!-- Login User END -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Top bar end-->
<!-- Navbar Start-->
<header class="nav-holder make-sticky">
	<div id="navbar" role="navigation" class="navbar navbar-expand-lg">
		<div class="container">
			<a href="index.html" class="navbar-brand home"><img
				src="./resources/img/logo.png" id="logo" alt="Universal logo"
				class="d-none d-md-inline-block"><img
				src="./resources/img/logo.png" id="logo"
				alt="Universal logo" class="d-inline-block d-md-none"><span
				class="sr-only">Petish</span></a>
			<button type="button" data-toggle="collapse"
				data-target="#navigation"
				class="navbar-toggler btn-template-outlined">
				<span class="sr-only">Toggle navigation</span><i
					class="fa fa-align-justify"></i>
			</button>
			<div id="navigation" class="navbar-collapse collapse">
				<ul class="nav navbar-nav ml-auto">
					<!--Dog -->
					<li class="nav-item dropdown menu-large"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">강아지 <b
							class="caret"></b></a>
						<ul class="dropdown-menu megamenu">
							<li>
								<div class="row">
									<div class="col-lg-6">
										<img src="./resources/img/dog.jpg" alt=""
											class="img-fluid d-none d-lg-block">
									</div>
									<div class="col-lg-3 col-md-6">
										<h5>커뮤니티</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#" class="nav-link">자유게시판</a></li>
											<li class="nav-item"><a href="#" class="nav-link">정모게시판</a></li>
											<li class="nav-item"><a href="#" class="nav-link">분양게시판</a></li>
										</ul>
									</div>
									<div class="col-lg-3 col-md-6">
										<h5>기타</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="about.html"
												class="nav-link">건강</a></li>
											<li class="nav-item"><a href="team.html"
												class="nav-link">실종견</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul></li>
					<!-- Dog END -->
					<!-- Cat -->
					<li class="nav-item dropdown menu-large"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">고양이 <b
							class="caret"></b></a>
						<ul class="dropdown-menu megamenu">
							<li>
								<div class="row">
									<div class="col-lg-6">
										<img src="./resources/img/cat.jpg" alt=""
											class="img-fluid d-none d-lg-block">
									</div>
									<div class="col-lg-3 col-md-6">
										<h5>커뮤니티</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#" class="nav-link">자유게시판</a></li>
											<li class="nav-item"><a href="#" class="nav-link">정모게시판</a></li>
											<li class="nav-item"><a href="#" class="nav-link">분양게시판</a></li>
										</ul>
									</div>
									<div class="col-lg-3 col-md-6">
										<h5>기타</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="about.html"
												class="nav-link">건강</a></li>
											<li class="nav-item"><a href="team.html"
												class="nav-link">실종견</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul></li>
					<!-- Cat END -->
					<!-- Etc -->

					<!-- ========== My Pet ==================-->
					<li class="nav-item dropdown menu-large"><a href="#">마이펫
							<b class="caret"></b>
					</a></li>
					<!-- ========== My Pet END ==================-->
					<!-- ========== Contact dropdown ==================-->
					<li class="nav-item dropdown"><a href="#">병원 <b
							class="caret"></b></a></li>
					<!-- ========== Contact dropdown end ==================-->
				</ul>
			</div>
			<div id="search" class="collapse clearfix">
				<form role="search" class="navbar-form">
					<div class="input-group">
						<input type="text" placeholder="Search" class="form-control"><span
							class="input-group-btn">
							<button type="submit" class="btn btn-template-main">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>

</body>
</html>