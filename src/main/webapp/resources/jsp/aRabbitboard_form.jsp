<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#head{
	display:inline;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Universal - All In 1 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
	href="resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
	href="resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/css/style.lightblue.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="resources/img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
	<div id="all">
		
		<!-- Login Modal-->
		<div id="login-modal" tabindex="-1" role="dialog"
			aria-labelledby="login-modalLabel" aria-hidden="true"
			class="modal fade">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="login-modalLabel" class="modal-title">Customer Login</h4>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="customer-orders.html" method="get">
							<div class="form-group">
								<input id="email_modal" type="text" placeholder="email"
									class="form-control">
							</div>
							<div class="form-group">
								<input id="password_modal" type="password"
									placeholder="password" class="form-control">
							</div>
							<p class="text-center">
								<button class="btn btn-template-outlined">
									<i class="fa fa-sign-in"></i> Log in
								</button>
							</p>
						</form>
						<p class="text-center text-muted">Not registered yet?</p>
						<p class="text-center text-muted">
							<a href="customer-register.html"><strong>Register
									now</strong></a>! It is easy and done in 1 minute and gives you access to
							special discounts and much more!
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Login modal end-->
		<!-- Navbar Start-->
		<header class="nav-holder make-sticky">
			<div id="navbar" role="navigation" class="navbar navbar-expand-lg">
				<div class="container">
					<a href="index.html" class="navbar-brand home"><img
						src="resources/img/logo.png" alt="Universal logo"
						class="d-none d-md-inline-block"><img
						src="resources/img/logo-small.png" alt="Universal logo"
						class="d-inline-block d-md-none"><span class="sr-only">Universal
							- go to homepage</span></a>
					<button type="button" data-toggle="collapse"
						data-target="#navigation"
						class="navbar-toggler btn-template-outlined">
						<span class="sr-only">Toggle navigation</span><i
							class="fa fa-align-justify"></i>
					</button>
					<div id="navigation" class="navbar-collapse collapse">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item dropdown active"><a
								href="javascript: void(0)" data-toggle="dropdown"
								class="dropdown-toggle">Home <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li class="dropdown-item"><a href="index.html"
										class="nav-link">Option 1: Default Page</a></li>
									<li class="dropdown-item"><a href="index2.html"
										class="nav-link">Option 2: Application</a></li>
									<li class="dropdown-item"><a href="index3.html"
										class="nav-link">Option 3: Startup</a></li>
									<li class="dropdown-item"><a href="index4.html"
										class="nav-link">Option 4: Agency</a></li>
									<li class="dropdown-item dropdown-submenu"><a
										id="navbarDropdownMenuLink2" href="#" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										class="nav-link dropdown-toggle">Dropdown link</a>
										<ul aria-labelledby="navbarDropdownMenuLink2"
											class="dropdown-menu">
											<li class="dropdown-item"><a href="#" class="nav-link">Action</a></li>
											<li class="dropdown-item"><a href="#" class="nav-link">Another
													action</a></li>
											<li class="dropdown-item"><a href="#" class="nav-link">Something
													else here</a></li>
										</ul></li>
								</ul></li>
							<li class="nav-item dropdown menu-large"><a href="#"
								data-toggle="dropdown" class="dropdown-toggle">Features<b
									class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-lg-6">
												<img src="resources/img/template-easy-customize.png" alt=""
													class="img-fluid d-none d-lg-block">
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Shortcodes</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a
														href="template-accordions.html" class="nav-link">Accordions</a></li>
													<li class="nav-item"><a href="template-alerts.html"
														class="nav-link">Alerts</a></li>
													<li class="nav-item"><a href="template-buttons.html"
														class="nav-link">Buttons</a></li>
													<li class="nav-item"><a
														href="template-content-boxes.html" class="nav-link">Content
															boxes</a></li>
													<li class="nav-item"><a href="template-blocks.html"
														class="nav-link">Horizontal blocks</a></li>
													<li class="nav-item"><a
														href="template-pagination.html" class="nav-link">Pagination</a></li>
													<li class="nav-item"><a href="template-tabs.html"
														class="nav-link">Tabs</a></li>
													<li class="nav-item"><a
														href="template-typography.html" class="nav-link">Typography</a></li>
												</ul>
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Header variations</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a
														href="template-header-default.html" class="nav-link">Default
															sticky header</a></li>
													<li class="nav-item"><a
														href="template-header-nosticky.html" class="nav-link">No
															sticky header</a></li>
													<li class="nav-item"><a
														href="template-header-light.html" class="nav-link">Light
															header</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul></li>
							<li class="nav-item dropdown menu-large"><a href="#"
								data-toggle="dropdown" class="dropdown-toggle">Portfolio <b
									class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-lg-6">
												<img src="resources/img/template-homepage.png" alt=""
													class="img-fluid d-none d-lg-block">
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Portfolio</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="portfolio-2.html"
														class="nav-link">2 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-2.html" class="nav-link">2
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-3.html"
														class="nav-link">3 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-3.html" class="nav-link">3
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-4.html"
														class="nav-link">4 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-4.html" class="nav-link">4
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-detail.html"
														class="nav-link">Portfolio - detail</a></li>
													<li class="nav-item"><a href="portfolio-detail-2.html"
														class="nav-link">Portfolio - detail 2</a></li>
												</ul>
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>About</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="about.html"
														class="nav-link">About us</a></li>
													<li class="nav-item"><a href="team.html"
														class="nav-link">Our team</a></li>
													<li class="nav-item"><a href="team-member.html"
														class="nav-link">Team member</a></li>
													<li class="nav-item"><a href="services.html"
														class="nav-link">Services</a></li>
												</ul>
												<h5>Marketing</h5>
												<ul class="list-unstyled">
													<li class="nav-item"><a href="packages.html"
														class="nav-link">Packages</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul></li>
							<!-- ========== FULL WIDTH MEGAMENU ==================-->
							<li class="nav-item dropdown menu-large"><a href="#"
								data-toggle="dropdown" data-hover="dropdown" data-delay="200"
								class="dropdown-toggle">All Pages <b class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-md-6 col-lg-3">
												<h5>Home</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="index.html"
														class="nav-link">Option 1: Default Page</a></li>
													<li class="nav-item"><a href="index2.html"
														class="nav-link">Option 2: Application</a></li>
													<li class="nav-item"><a href="index3.html"
														class="nav-link">Option 3: Startup</a></li>
													<li class="nav-item"><a href="index4.html"
														class="nav-link">Option 4: Agency</a></li>
													<li class="nav-item"><a href="index5.html"
														class="nav-link">Option 5: Portfolio</a></li>
												</ul>
												<h5>About</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="about.html"
														class="nav-link">About us</a></li>
													<li class="nav-item"><a href="team.html"
														class="nav-link">Our team</a></li>
													<li class="nav-item"><a href="team-member.html"
														class="nav-link">Team member</a></li>
													<li class="nav-item"><a href="services.html"
														class="nav-link">Services</a></li>
												</ul>
												<h5>Marketing</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="packages.html"
														class="nav-link">Packages</a></li>
												</ul>
											</div>
											<div class="col-md-6 col-lg-3">
												<h5>Portfolio</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="portfolio-2.html"
														class="nav-link">2 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-2.html" class="nav-link">2
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-3.html"
														class="nav-link">3 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-3.html" class="nav-link">3
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-4.html"
														class="nav-link">4 columns</a></li>
													<li class="nav-item"><a
														href="portfolio-no-space-4.html" class="nav-link">4
															columns with negative space</a></li>
													<li class="nav-item"><a href="portfolio-detail.html"
														class="nav-link">Portfolio - detail</a></li>
													<li class="nav-item"><a href="portfolio-detail-2.html"
														class="nav-link">Portfolio - detail 2</a></li>
												</ul>
												<h5>User pages</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="customer-register.html"
														class="nav-link">Register / login</a></li>
													<li class="nav-item"><a href="customer-orders.html"
														class="nav-link">Orders history</a></li>
													<li class="nav-item"><a href="customer-order.html"
														class="nav-link">Order history detail</a></li>
													<li class="nav-item"><a href="customer-wishlist.html"
														class="nav-link">Wishlist</a></li>
													<li class="nav-item"><a href="customer-account.html"
														class="nav-link">Customer account / change password</a></li>
												</ul>
											</div>
											<div class="col-md-6 col-lg-3">
												<h5>Shop</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="shop-category.html"
														class="nav-link">Category - sidebar right</a></li>
													<li class="nav-item"><a href="shop-category-left.html"
														class="nav-link">Category - sidebar left</a></li>
													<li class="nav-item"><a href="shop-category-full.html"
														class="nav-link">Category - full width</a></li>
													<li class="nav-item"><a href="shop-detail.html"
														class="nav-link">Product detail</a></li>
												</ul>
												<h5>Shop - order process</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="shop-basket.html"
														class="nav-link">Shopping cart</a></li>
													<li class="nav-item"><a href="shop-checkout1.html"
														class="nav-link">Checkout - step 1</a></li>
													<li class="nav-item"><a href="shop-checkout2.html"
														class="nav-link">Checkout - step 2</a></li>
													<li class="nav-item"><a href="shop-checkout3.html"
														class="nav-link">Checkout - step 3</a></li>
													<li class="nav-item"><a href="shop-checkout4.html"
														class="nav-link">Checkout - step 4</a></li>
												</ul>
											</div>
											<div class="col-md-6 col-lg-3">
												<h5>Contact</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="contact.html"
														class="nav-link">Contact</a></li>
													<li class="nav-item"><a href="contact2.html"
														class="nav-link">Contact - version 2</a></li>
													<li class="nav-item"><a href="contact3.html"
														class="nav-link">Contact - version 3</a></li>
												</ul>
												<h5>Pages</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="text.html"
														class="nav-link">Text page</a></li>
													<li class="nav-item"><a href="text-left.html"
														class="nav-link">Text page - left sidebar</a></li>
													<li class="nav-item"><a href="text-full.html"
														class="nav-link">Text page - full width</a></li>
													<li class="nav-item"><a href="faq.html"
														class="nav-link">FAQ</a></li>
													<li class="nav-item"><a href="404.html"
														class="nav-link">404 page</a></li>
												</ul>
												<h5>Blog</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item"><a href="blog.html"
														class="nav-link">Blog listing big</a></li>
													<li class="nav-item"><a href="blog-medium.html"
														class="nav-link">Blog listing medium</a></li>
													<li class="nav-item"><a href="blog-small.html"
														class="nav-link">Blog listing small</a></li>
													<li class="nav-item"><a href="blog-post.html"
														class="nav-link">Blog Post</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul></li>
							<!-- ========== FULL WIDTH MEGAMENU END ==================-->
							<!-- ========== Contact dropdown ==================-->
							<li class="nav-item dropdown"><a href="javascript: void(0)"
								data-toggle="dropdown" class="dropdown-toggle">Contact <b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li class="dropdown-item"><a href="contact.html"
										class="nav-link">Contact option 1</a></li>
									<li class="dropdown-item"><a href="contact2.html"
										class="nav-link">Contact option 2</a></li>
									<li class="dropdown-item"><a href="contact3.html"
										class="nav-link">Contact option 3</a></li>
								</ul></li>
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
		<!-- Navbar End-->

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">토끼게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">기타 반려동물</a></li>
							<li class="breadcrumb-item active">토끼게시판</li>
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
										<a href="#" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
							<form>
								<div class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="category">카테고리</label> <select id="category"
												class="form-control">
												<option value="1">카테고리 선택</option>
												<option value="fulldress">일상</option>
												<option value="tshirts">정보</option>
												<option value="shirts">질문</option>
												<option value="pants">웃긴자료</option>
												<option value="shoes">뉴스</option>
											</select>
										</div>
									</div>

									
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="password_old">제목</label> <input id="password_old"
												type="text" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="password_1">내용</label>
											<textarea id="summernote" class="form-control"></textarea>
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
	<!-- Javascript files-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="resources/vendor/waypoints/lib/jquery.waypoints.min.js">
		
	</script>
	<script src="resources/vendor/jquery.counterup/jquery.counterup.min.js">
		
	</script>
	<script src="resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="resources/js/front.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<!-- include libraries(jQuery, bootstrap) -->

	<!-- include summernote css/js-->
	<link
		href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
		rel="stylesheet">
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="resources/lang/summernote-ko-KR.js"></script>
	<script>
		$(document)
				.ready(
						function() {

							$('#summernote')
									.summernote(
											{
												height : 300, // set editor height
												minHeight : null, // set minimum height of editor
												maxHeight : null, // set maximum height of editor
												focus : true, // set focus to editable area after initializing summernote
												lang : 'ko-KR',
												toolbar : [
														[ 'style', [ 'style' ] ],
														[
																'font',
																[
																		'bold',
																		'italic',
																		'underline',
																		'clear' ] ],
														[ 'fontname',
																[ 'fontname' ] ],
														[ 'color', [ 'color' ] ],
														[
																'para',
																[ 'ul', 'ol',
																		'paragraph' ] ],
														[ 'height',
																[ 'height' ] ],

														[
																'insert',
																[
																		'link',
																		'picture',
																		'hr' ] ],

												],
												popover : {
													image : [],
													link : [],
													air : []
												}
											});
							$('#resetbtn').click(function() {

								$('#summernote').summernote('reset');
							});
						});
	</script>
</body>
</html>