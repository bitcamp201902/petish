<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>문의 작성하기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<style>
h5 {
	margin-left: 1.8cm;
	color: #6c757d !important;
}

tr {
	height: 0.7cm;
	border: 1px solid #ddd;
}

#viewMore1, #viewMore2, #viewMore3 {
	margin-left: auto;
}

.nondeco {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
	color: black;
}

.font-grey {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
}
 .top-bar {
        background: #38a7bb;
      }

      #email-login {
        width:365px;
      }

      #name-login {
        width:365px;
      }

      #adress1-login {
        width:305px;
      }

      #jumin1, #jumin2 {
        width:215px;
      }

      #logo {
        width:170px;
      }
      
      li {
      	list-style:none;
      }
      
      /* 드랍다운 메뉴 글씨 크기*/
      .nav-link {
      	font-size:0.9rem;
      }
      
      #firstname{
      	width:500px;
      }
</style>

<body>
	<div id="all">
		
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">MY PAGE</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">My Page</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="heading text-center">
							<h2>문의 작성하기</h2>
						</div>
					</div>
					<div class="col-md-8 mx-auto">
						<form>
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="firstname">문의 제목</label> <input id="firstname"
											type="text" class="form-control">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label for="message">문의 내용</label>
										<textarea id="message" class="form-control" rows="15"></textarea>
									</div>
								</div>
								<div class="col-sm-12 text-center">
									<!-- 문의 form 전송 -->
									<button type="submit" class="btn btn-outline-primary"
										id="question_ok">확인</button>
									&nbsp;&nbsp;
									<!-- 문의 리스트 화면으로 -->
									<button type="submit" class="btn btn-outline-primary"
										id="question_cancle">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>