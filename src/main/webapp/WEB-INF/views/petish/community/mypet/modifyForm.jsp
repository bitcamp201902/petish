<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"> <!-- fas 보기 위해서  -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/resources/css/mypet/mypet.css">
    <link rel="stylesheet" href="/resources/css/mypet/mypetForm.css">
    <script src="/resources/js/mypet/mypet.js"></script>
    
</head>
<body>
   <div id="all">
   
   	<%@ include file="/WEB-INF/views/commons/top.jspf" %>
   	
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
      <hr>
      <div class="text-center">      
		<div class="heading">
	      <h2>마이펫 글 수정</h2>
	    </div>
      </div>
          <div class="bar pt-0">
              <div class="col-md-8 mx-auto">
                <form>
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="firstname">제목</label>
                        <input id="firstname" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="message">내용</label>
                        <textarea id="message" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="email">사진 첨부</label>
                        <input id="email" type="file" class="form-control">
                      </div>
                    </div>
                    <!-- col-sm-12 가 한줄을 차지하기 때문에 div class로 button 속성들을 묶어줌 -->
                    <div class="col-sm-12">      
	                    <div class="text-right" id="deleteBtn">                    
		                      <button type="submit" class="btn btn-template-outlined">삭제</button>
	                    </div>              
	                    <div class="text-center" id="modifyBtn">
		                  <button type="submit" class="btn btn-template-outlined">수정</button>
		                  <button type="reset" class="btn btn-template-outlined">취소</button>
	                    </div>
                    </div>
                  	</div>
                </form>
              </div>
          </div>
   <!-- MyPet Write END -->
    </div>
  </body>
</html>