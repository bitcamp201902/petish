<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>안녕하세요</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57" href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<link href="/resources/css/freeboard/detail.css" rel="stylesheet">

</head>
<body>
	<div id="all">
	
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 자유게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				
					<!-- LEFT COLUMN _________________________________________________________-->
					<div id="blog-post" class="col-md-13">

						<button class="write btn btn-template-outlined">
							<a href="/dog/freeboard/writeForm">
							글쓰기
							</a>
						</button>
						<button class="btn btn-template-outlined">
							<i class="fa fa-align-justify"></i><a href="/dog/freeboard/list">목록</a>
						</button>
																	
						<div class="panel-heading">
							<h2 class="h3 panel-title">안녕하세요!!!!!!!!!!!!!!</h2>
						</div>

						<table>
						
								<tr>
									<td><img src="/resources/img/blog-avatar2.jpg" alt=""
										class="img-fluid rounded-circle" width="70px;" height="70px;"></td>
									<td>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown">Pet</a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
											</div>
										</div>
									</td>
									<td class=grade>준회원</td>
									<td class=date>2019-07-01 23:02:53</td>
									<td class=view><i class="fa fa-eye"></i>130186321</td>
									<td class=like><a href="#" class="btn btn-template-outlined"><i
											class="fa fa-heart-o"></i>13</a></td>

								</tr>																			
						</table>

						<hr size="10px">

						<p class="lead">This is the lead paragraph of the article.
							Pellentesque habitant morbi tristique senectus et netus et
							malesuada fames ac turpis egestas. Vestibulum tortor quam,
							feugiat vitae, ultricies eget.</p>
						<div id="post-content">
							<p class="text-sm">
								<strong>Pellentesque habitant morbi tristique</strong> senectus
								et netus et malesuada fames ac turpis egestas. Vestibulum tortor
								quam, feugiat vitae, ultricies eget, tempor sit amet, ante.
								Donec eu libero sit amet quam egestas semper. <em>Aenean
									ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque
								sit amet est et sapien ullamcorper pharetra. Vestibulum erat
								wisi, condimentum sed,
								<code>commodo vitae</code>
								, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt
								condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim
								ac dui. <a href="#">Donec non enim</a> in turpis pulvinar
								facilisis. Ut felis.
							</p>
							<p>
								<img src="/resources/img/blog2.jpg" alt="Example blog post alt"
									class="img-fluid">
							</p>
							<h2>Header Level 2</h2>
							<ol>
								<li>Lorem ipsum dolor sit amet, consectetuer adipiscing
									elit.</li>
								<li>Aliquam tincidunt mauris eu risus.</li>
							</ol>
							<blockquote class="blockquote">
								<p class="text-sm">Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Vivamus magna. Cras in mi at felis aliquet
									congue. Ut a est eget ligula molestie gravida. Curabitur massa.
									Donec eleifend, libero at sagittis mollis, tellus est malesuada
									tellus, at luctus turpis elit sit amet quam. Vivamus pretium
									ornare est.</p>
							</blockquote>
							<h3>Header Level 3</h3>
							<p>Pellentesque habitant morbi tristique senectus et netus et
								malesuada fames ac turpis egestas. Vestibulum tortor quam,
								feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu
								libero sit amet quam egestas semper. Aenean ultricies mi vitae
								est. Mauris placerat eleifend leo. Quisque sit amet est et
								sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum
								sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum,
								elit eget tincidunt condimentum, eros ipsum rutrum orci,
								sagittis tempus lacus enim ac dui. Donec non enim in turpis
								pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus
								faucibus, tortor neque egestas augue, eu vulputate magna eros eu
								erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis,
								accumsan porttitor, facilisis luctus, metus</p>
							<ul>
								<li>Lorem ipsum dolor sit amet, consectetuer adipiscing
									elit.</li>
								<li>Aliquam tincidunt mauris eu risus.</li>
							</ul>
							<p>
								<img src="/resources/img/blog.jpg" alt="Example blog post alt"
									class="img-fluid">
							</p>
							<p>Pellentesque habitant morbi tristique senectus et netus et
								malesuada fames ac turpis egestas. Vestibulum tortor quam,
								feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu
								libero sit amet quam egestas semper. Aenean ultricies mi vitae
								est. Mauris placerat eleifend leo. Quisque sit amet est et
								sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum
								sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum,
								elit eget tincidunt condimentum, eros ipsum rutrum orci,
								sagittis tempus lacus enim ac dui. Donec non enim in turpis
								pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus
								faucibus, tortor neque egestas augue, eu vulputate magna eros eu
								erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis,
								accumsan porttitor, facilisis luctus, metus</p>
						</div>

						<div id="comments">
							<h4 class="text-uppercase">댓글 수 2</h4>
							<section class="bar bg-gray mb-0">
								<div class="row comment">
									<div class="col-sm-3 col-md-2 text-center-xs">
										<p>
											<img src="/resources/img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle">
										</p>
									</div>
									<div class="col-sm-9 col-md-10">
										<h5 class="text-uppercase">Julie Alma</h5>
										<p class="posted">
											<i class="fa fa-clock-o"></i> 2019-07-03 09:24:26
										</p>
										<p>Pellentesque habitant morbi tristique senectus et netus
											et malesuada fames ac turpis egestas. Vestibulum tortor quam,
											feugiat vitae, ultricies eget, tempor sit amet, ante. Donec
											eu libero sit amet quam egestas semper. Aenean ultricies mi
											vitae est. Mauris placerat eleifend leo.</p>

									</div>
								</div>
								<div class="row comment last">
									<div class="col-sm-3 col-md-2 text-center-xs">
										<p>
											<img src="/resources/img/blog-avatar.jpg" alt="" class="img-fluid rounded-circle">
										</p>
									</div>
									<div class="col-sm-9 col-md-10">
										<h5 class="text-uppercase">Louise Armero</h5>
										<p class="posted">
											<i class="fa fa-clock-o"></i> 2019-07-03 09:25:23
										</p>
										<p>Pellentesque habitant morbi tristique senectus et netus
											et malesuada fames ac turpis egestas. Vestibulum tortor quam,
											feugiat vitae, ultricies eget, tempor sit amet, ante. Donec
											eu libero sit amet quam egestas semper. Aenean ultricies mi
											vitae est. Mauris placerat eleifend leo.</p>
									</div>
								</div>
							</section>
						</div>

						<div id="comment-form">
							<h4 class="text-uppercase">댓글</h4>
							<form>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="name">닉네임 <span class="required text-primary">*</span></label> <input id="name"
												type="text" class="form-control">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">내 용 <span class="required text-primary">*</span></label>
											<textarea id="comment" rows="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button class="re btn btn-template-outlined">
											<i class="fa fa-comment-o"></i> 댓글 등록
										</button>
									

										<nav aria-label="Page navigation example"class="d-flex justify-content-left">
											<button class="btn btn-template-outlined"style="margin-right: 2rem">
												<i class="fa fa-pencil"></i><a href="/dog/freeboard/modifyForm">수정</a>
											</button>
											<button type="submit" class="delete btn btn-template-outlined">
												<i class="fa fa-trash-o"></i>삭제
											</button>
										</nav>

										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
											style="float: right;" id="report-btn">신고
										</button>

										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h3 class="modal-title" id="myModalLabel">신고</h3>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<table>
															<tr>
																<td>신고 분류 </td>
																<td>
																	<div class="form-group">

																		<select id="state" class="form-control">
																			<option>부적절한 게시글</option>
																			<option>도배 게시글</option>
																			<option>광고 목적 게시글</option>
																			<option>기타</option>
																		</select>
																	</div>
																</td>
															</tr>
															
															<tr>
																<td>내용</td>
																<td>
																<textarea id="comment" rows="4" cols="40" class="form-control"></textarea>
																</td>
															</tr>
															
															<tr></tr>
															<tr>
																<td></td>
																<td>
																<button type="button" class="btn btn-template-outlined" data-dismiss="modal">확인</button>
																<button type="button" class="btn btn-template-outlined" data-dismiss="modal">취 소</button></td>
															</tr>
														</table>
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>		
	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>
