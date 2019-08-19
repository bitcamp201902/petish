<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/mypet/mypet.css">
    <link rel="stylesheet" href="/resources/css/mypet/mypetForm.css">

</head>
<body>
	<div id="all">

  	<%@ include file="/WEB-INF/views/commons/mypet_top.jspf" %>

    <!-- MyPet Write Start -->
    <div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">마이펫</h1>
				</div>

				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
	                	<li class="breadcrumb-item active">My Pet</li>
	              	</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="text-center">
		<div class="heading">
	      <h2>마이펫 글 작성</h2>
	    </div>
	</div>

	<div class="bar pt-0">
		<div class="col-md-8 mx-auto">

			<div id="write-form-carousel" class="col-sm-12">
				<div id="mypet-detail-carousel" class="carousel slide" data-ride="carousel" data-interval="false">
					<div class="carousel-inner">

					</div>
					<a class="carousel-control-prev" href="#mypet-detail-carousel" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#mypet-detail-carousel" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>


			<form enctype="multipart/form-data">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
	                   		<label for="fileInput">사진 첨부</label>
							<input id="fileInput" type="file" multiple="multiple" name="file">
						</div>
					</div>

					<div class="col-sm-12">
						<div class="form-group">
							<label for="firstname">제목</label>
							<input id="firstname" type="text" name="title" class="form-control">
                      	</div>
                    </div>

                    <div class="col-sm-12">
                    	<div class="form-group">
                    		<label for="message">내용</label>
                    		<textarea id="message" name="content" class="form-control"></textarea>
                      	</div>
                    </div>

                    <div class="col-sm-12 text-center">
                    	<input id="submit-button" class="btn btn-template-outlined" type="button" value='등록'/>
                   		<input type="reset" class="btn btn-template-outlined" value="취소" />
                    </div>
				</div>
			</form>
		</div>
	</div>
   <!-- MyPet Write END -->
	</div>
	</body>
	<script src="/resources/js/mypet/writeForm.js"></script>
</html>
