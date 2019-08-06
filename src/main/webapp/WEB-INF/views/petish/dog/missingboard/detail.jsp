<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="com.community.petish.user.dto.response.LoginedUser"%>
<%@ page import="com.community.petish.dog.missingboard.dto.*"%>
<%
   DogLostPostResponseDetailDTO dto = (DogLostPostResponseDetailDTO) request.getAttribute("dto");

   //게시판 아이디
   Long boardId = 4L;

   //게시글 아이디   
   Long idLong = dto.getId();
   String ID = idLong.toString();
   System.out.println("게시글 아이디 : " + ID);

   //작성자 아이디
   Long writerId = dto.getUser_id();
   System.out.println("작성자 아이디 : " + writerId);
   
   //실종 장소
   String address = dto.getDog_lost_address();
   String[] array = address.split(" ");

   String addr1 = null;
   String addr2 = null;

   if (array[0] != null)
      addr1 = array[0];

   if (array[1] != null)
      addr2 = array[1];

   String addrSplit = addr1 + " " + addr2;
%>
<!DOCTYPE html>
<html>
<head>
<title>[<%=addrSplit%>] <%=dto.getDog_species()%> / <%=dto.getDog_gender()%>
   / <%=dto.getDog_age()%></title>
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
   href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
   href="/resources/img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
<!-- CSS파일 추가 -->
<link href="/resources/css/commons/kakaomap.css?ver=1" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">

<link href="/resources/css/missingboard/detail.css" rel="stylesheet">

<style>
#report-btn {
   justify-content: right;
}
.btn.btn-danger{
   float:right;
   margin-top:20px;
   margin-right:20px;
}

table{
   border-collapse: unset!important;
}

button.btn.btn-template-outlined{
   float: right;
   margin-right:15px;
   margin-top:20px;
}
.name{
   text-align:center;
   width:40px;
}
td.grade{
   text-align:left;
   width:80px;
}

td.date{
   text-align:left;
   width:150px;
}

td.view{
   text-align:left;
   width:150px;
}
div.panel-heading{
   margin-top:40px;
}
.dropdown{
   text-align:center;
}

main.img-fluid rounded-circle{
   width:70px;
   height:70px;

}
div#post-content{
   margin-top:50px;
}

div.panel.panel-default.sidebar-menu{
   margin-top:40px;   
}

button.btn.btn-template-outlined{
   margin-right: 2rem;
}

@charset "EUC-KR";


.poster-table {
   width: 70%;
   margin: 1rem;
   background-color: #FFDB58;
   text-align: center;
   font-size: 23px;
   border-spacing:0px;
   border:solid 20px #b42233;
}

th, td {
   text-align: left;
}

.poster-title {
   background-color: #b42233;
   text-align: center;   
   padding-bottom: 1rem;
   font-size: 60px;
   font-weight: 900;
   color: #ffdb58;
   /* -webkit-text-stroke: 2px black; */
}

.poster-info {
   background-color: black;
   text-align: center;
   color: white;
   font-size: 40px;
   color: white;
   padding:30px;
}

.phonenumber-info {
   background-color: #b42233;
   text-align: center;
   color: white;
   font-size: 40px;
   color: white;
   padding:10px;
}

.text-uppercase {
   margin: 5px;
}

.bar {
   padding: 15px 0;
}

#lostdog {
   width:100% !important;
   height:100% !important;
   min-width: 700px !important;
   max-width: 750px !important;
   min-height: 400px !important;
   max-height: 400px !important;
}

#phone-icon {
   padding-right: 1rem;
}

.date {
   min-width: 200px;
}

.index{
   padding:20px;
   font-size:25px;
   text-align:center;
}

.index {
   
}

/* 이미지 슬라이드 */
* {
   box-sizing: border-box
}

/* Slideshow container */
.slideshow-container {
   max-width: 1000px;
   position: relative;
   margin: auto;
}

/* Hide the images by default */
.mySlides {
   display: none;
}

.prev, .next {
   cursor: pointer;
   position: absolute;
   top: 50%;
   width: auto;
   margin-top: -22px;
   padding: 20px;
   color: white;
   font-weight: bold;
   font-size: 20px;
   transition: 0.6s ease;
   border-radius: 0 3px 3px 0;
   user-select: none;
}

/* Position the "next button" to the right */
.next {
   right: 0;
   border-radius: 3px 0 0 3px;
}
.prev {
   left: 0;
   border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
   background-color: rgba(192,192,192,0.3);
}

/* Caption text */
.text {
   color: #f2f2f2;
   font-size: 15px;
   padding: 8px 12px;
   position: absolute;
   bottom: 8px;
   width: 100%;
   text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
   color: #f2f2f2;
   font-size: 12px;
   padding: 8px 12px;
   position: absolute;
   top: 0;
}

/* The dots/bullets/indicators */
.dot {
   cursor: pointer;
   height: 15px;
   width: 15px;
   margin: 0 2px;
   border: 2.5px solid #b42233;
   border-radius: 50%;
   display: inline-block;
   transition: background-color 0.6s ease;
}

.active, .dot:hover {
   background-color: #b42233;
}

/* Fading animation */
.fade {
   -webkit-animation-name: fade;
   -webkit-animation-duration: 1.5s;
   animation-name: fade;
   animation-duration: 1.5s;
}

.reply-image {
   max-width: 100%;
   height: auto;
   border-radius: 50%;
}

.report-modal-title {
   min-width: 65px;
}

@
-webkit-keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}
@
keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}
label {
   text-align: left !important;
}

}

/* 반응형 */
@media ( max-width :400px) {
   .poster-table {
      width: 100%;
      padding: 15px;
      font-size: 18px;
   }
   .index {
      min-width: 100px;
      width: 130px;
   }
   .poster-title {
      margin: 50px;
      font-size: 30px;
   }
   th, td {
      padding: 10px;
   }
   #lostdog {
      /* width:100%;
      height:flex; */
   }
}

@media screen and (max-width:750px){

   .btn.btn-template-outlined{
      margin-bottom:10px;
   }
   .date{
      display:none;
   }
   .view{
      display:none;
   }
   span.badge.badge-danger{
      margin-top:30px;
   }
   div.col-sm-3.col-md-2.text-center-xs{
      display:none;
   }
   button.btn.btn-template-outlined{
      margin-right: 1rem
   }
   button.re.btn.btn-template-outlined{
      width:110px;
      margin-right:1px;
   }
   button.write.btn.btn-template-outlined{
      margin-right:1px;
   }
   button.list.btn.btn-template-outlined{
      margin-right:10px;
   }
   .btn.btn-danger{
      margin-right:1px;
   }
   div.bg_white{
      display:none;
   }
   
   

}
</style>
</head>

<body>
   <div id="all">

      <%@ include file="/WEB-INF/views/commons/top.jspf"%>
      
      <%
    	//접속 아이디
    	Long userId = 0L;
    	if(loginedUser != null){
    		userId = loginedUser.getId();
    		System.out.println("유저아이디 : " + userId);    		 
      }
      %>
      
      <!-- 게시판명 -->
      <div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
         <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
               <div class="col-md-7">
                  <h1 class="h2">실종견 게시판</h1>
               </div>
               <div class="col-md-5">
                  <ul class="breadcrumb d-flex justify-content-end">
                  </ul>
               </div>
            </div>
         </div>
      </div>


      <div class="container">

         <!-- LEFT COLUMN _________________________________________________________-->
         <div id="blog-post" class="col-md-13">
            
            <button type="submit" class="btn btn-template-outlined">
               <i class="fa fa-align-justify"></i>
               <a href="<c:url value='/dog/missingboard/list'/>"> 목록 </a>
            </button>

            <!-- 글 제목 -->
            <div class="panel-heading">

               <%
                  if (dto.getFound() == 0) {
               %>`
               <span class="badge badge-danger">미발견</span>
               <%
                  } else {
               %>
               <span class="badge badge-info">발견</span>
               <%
                  }
               %>

               <h2 class="h3 panel-title">
                  [<%=addrSplit%>]
                  <%=dto.getDog_species()%>
                  /
                  <%=dto.getDog_gender()%>
                  /
                  <%=dto.getDog_age()%></h2>
            </div>

            <!-- 게시 정보 -->
            <table>
               <tr>
                  <td><img src="/resources/img/blog-avatar2.jpg" alt=""
                     class="img-fluid rounded-circle" width="70px;" height="70px;"></td>
                  <td>
                     <div class="nav navbar-nav ml-auto">
                        <a href="#" data-toggle="dropdown" class="dropdown"><%=dto.getNickname()%></a>
                        <div class="dropdown-menu">
                           <div class="dropdown">
                              <a href="/mypage/member/detail" class="nav-link">게시글보기</a>
                           </div>
                           <div class="dropdown">
                              <a href="#" class="nav-link" data-toggle="modal"
                                 data-target="#messageWrite-modal">쪽지보내기</a>
                           </div>
                        </div>
                     </div>
                  </td>

                  <td class=grade>준회원</td>
                  <td class=date><i class="fa fa-clock-o"></i> <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="<%=dto.getCreate_date() %>"/></td>
                  <td class=view><i class="fa fa-eye"></i> <%=dto.getView_count()%></td>

               </tr>
            </table>
         </div>
         <!-- blog-post -->

         <hr size="10px">



         <!-- <div class="heading"> -->
         <!-- <blockquote class="blockquote"> -->

         <!-- <p>
            <img src="/resources/img/blog2.jpg" alt="Example blog post alt"
               class="img-fluid"> 
         </p> -->


         <!-- 글 내용 -->
         <!-- 포스터 -->
         <div class="d-flex justify-content-center">
            <table class="poster-table">
               <tr>
                  <th colspan="2" class="poster-title"><b>강아지를 찾습니다</b></th>
               </tr>
               <tr>
               
                  <th colspan="2" style="text-align: center">
                     <div class="slideshow-container">
                        <div id="imageSlides">
                        <!-- 이미지 들어갈 곳 -->
                        </div>
                                                
                        <!-- 이전/다음 버튼 -->
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                     </div> 
                     
                     <br>
                     <!-- Dots -->
                     <div style="text-align: center" id="dots">
                     <!-- Dot 들어갈 곳 -->
                     </div>
                  </th>
               </tr>
               
               <tr>
                  <th colspan="2" class="poster-info"><%=dto.getDog_species()%> / <%=dto.getDog_gender()%> / <%=dto.getDog_age()%>살</th>
               </tr>
               
               <tr>
                  <th class="index">이름</th>
                  <th class="dog-content"><%=dto.getDog_name()%></th>
               </tr>
               
               <tr>
                  <th class="index">특징</th>
                  <th class="dog-content">"<%=dto.getDog_description() %>"</th>
               </tr>

               <tr>
                  <th class="index">실종 날짜</th>
                  <th class="dog-content"><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="<%=dto.getDog_lost_date() %>"/></th>
               </tr>

               <tr>
                  <th class="index">실종 장소</th>
                  <th class="dog-content"><%=dto.getDog_lost_address()%></th>
               </tr>
               
               <tr>
                  <th colspan="2" class="phonenumber-info">
                  <i class="fa fa-phone" id="phone-icon"></i><b><%=dto.getPhone_number()%></b>
                  <div>사례금 <%=dto.getReward()%></div>              
                  </th>
               </tr>
               
            </table>
         </div>
         <div style="margin: 1rem"></div>

		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
		</div>


         <!-- 댓글창 -->
         <div id="comments">

            <h4 class="text-uppercase">댓글 수 2</h4>
            <section class="bar bg-gray mb-0">
               <div class="row comment">
                  <div class="col-sm-3 col-md-2 text-center-xs">
                     <p>
                        <img src="/resources/img/blog-avatar2.jpg" alt=""
                           class="reply-image">
                     </p>
                  </div>
                  <div class="col-sm-9 col-md-10">
                     <h5 class="text-uppercase">Julie Alma</h5>
                     <p class="posted">
                        <i class="fa fa-clock-o"></i> 2019-07-03 09:24:26
                     </p>
                     <p>안타깝네요.</p>

                  </div>
               </div>

               <hr style="margin: 10px;">

               <div class="row comment last">
                  <div class="col-sm-3 col-md-2 text-center-xs">
                     <p>
                        <img src="/resources/img/blog-avatar.jpg" alt=""
                           class="reply-image">
                     </p>
                  </div>
                  <div class="col-sm-9 col-md-10">
                     <h5 class="text-uppercase">Louise Armero</h5>
                     <p class="posted">
                        <i class="fa fa-clock-o"></i> 2019-07-03 09:25:23
                     </p>
                     <p>어디서 봤더라....</p>

                  </div>
               </div>
            </section>
         </div>
         
         <div style="margin: 2rem"></div>

         <!-- 댓글 입력창 -->
         <div id="comment-form">
            <h4 class="text-uppercase">댓글 작성</h4>
               <!-- <div class="row">
                  <div class="col-sm-4">
                     <div class="form-group">
                        <label for="name">아이디 <span
                           class="required text-primary">*</span></label> <input id="name"
                           type="text" class="form-control">
                     </div>
                  </div>
               </div> -->

               <div class="row">
                  <div class="col-sm-12">
                     <div class="form-group">
                        <!-- <label for="comment">내 용 <span
                           class="required text-primary">*</span></label> -->
                        <textarea id="comment" rows="4" class="form-control"></textarea>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-sm-12 text-right">
                     <button class="re btn btn-template-outlined">
                        <i class="fa fa-comment-o"></i> 댓글 등록
                     </button>

				<% if((loginedUser != null) && (userId == dto.getUser_id())) {%>
                     <nav aria-label="Page navigation example"
                        class="d-flex justify-content-left">
                        <button class="btn btn-template-outlined">
                           <i class="fa fa-pencil"></i>
                           <a href="/dog/missingboard/modifyForm/<%=ID%>">수정 </a>
                        </button>
                        <button type="submit" class="btn btn-template-outlined">
                           <i class="fa fa-trash-o"></i>
                           <a href="/dog/missingboard/delete/<%=ID%>">삭제 </a>
                        </button>
                     </nav>
                <%} %>

                     <!-- 게시글 신고 버튼 -->                     
                     <button type="button" class="btn btn-danger" data-toggle="modal"
                        style="float: right;" id="report-btn">신고
                     </button>                     
                     
                  </div>
               </div>
         </div>
         <!-- comment form -->
         <div style="margin: 5rem"></div>
         
      </div>
      <!--  -->
   </div>
   <!-- all -->

   <!-- 쪽지 쓰기 모달창 -->
   <div id="messageWrite-modal" tabindex="-1" role="dialog"
      aria-hidden="true" class="modal fade">
      <div role="document" class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 align="center" class="modal-title">쪽지 작성</h4>
               <button type="button" data-dismiss="modal" aria-label="Close"
                  class="close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>

            <div class="modal-body">
               <form action="" method="get">
                  <div class="form-group">
                     <label>받는 사람</label> <input id="message_reveiver" type="text"
                        class="form-control" value="" readonly>
                  </div>
                  <div class="form-group">
                     <label>내용</label>
                     <textarea id="message_content" rows="10" class="form-control"></textarea>
                  </div>
                  <p class="text-center">
                     <input type="button" class="btn btn-outline-primary"
                        id="message_send">전송</button>
                     <a style="padding-right: 0.5rem;"></a>
                     <button type="reset" class="btn btn-outline-primary"
                        id="message_cancle">취소</button>
                  </p>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <!-- 신고 모달창 -->
   <div id="report-modal" tabindex="-1" role="dialog" aria-hidden="true"
      class="modal fade">
      <div role="document" class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 align="center" class="modal-title">게시글 신고</h4>
               <button type="button" data-dismiss="modal" aria-label="Close"
                  class="close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>

            <div class="modal-body">
               <form id="report_form" method="POST">

                  <input type="hidden" name="BOARD_ID" id="BOARD_ID" value=<%=boardId%>>
                  <input type="hidden" name="POST_ID" id="POST_ID" value=<%=ID%>>            
                  <input type="hidden" name="USER_ID" id="USER_ID" value=<%=userId %> >
                   
                  
                  <label style="text-align: left !important;">신고 분류</label>
                  <div class="form-group">
                     <select id="state" name="CATEGORY_ID" id="CATEGORY_ID"
                        class="form-control">
                        <option value="0">신고 사유 선택</option>
                        <option value="1">부적절한 게시물</option>
                        <option value="2">도배 게시물</option>
                        <option value="3">광고성 게시물</option>
                        <option value="4">비방/비하/욕설 게시물</option>
                        <option value="5">음란성 또는 청소년 유해 게시물</option>
                        <option value="6">기타</option>
                     </select>
                  </div>
                  <label>내용</label>
                  <div class="form-group">
                     <textarea name="DESCRIPTION" id="DESCRIPTION" rows="10"
                        class="form-control"></textarea>
                  </div>
                  <p class="text-center">
                  
                     <input type="submit" value="신고" class="btn btn-outline-primary"
                        id="input_report">
                     <a style="padding-right: 0.5rem;"></a>
                     <input type="reset" class="btn btn-outline-primary" value="취소">
                  </p>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   
   <!-- JS 파일 추가 -->
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>   
   <script type="text/javascript" src="/resources/js/missingboard/detail.js"></script>
   
   <script>
   $(document).ready(function() {
	   (function(){
          //var id = '<c:out value="${dto.id}"/>';
          
          $.getJSON("/dog/missingboard/getAttachList/"+${dto.id}, function(arr){              
        	  
              console.log(arr);
              
              var str = "";
              var dotStr = "";
              
              var dots = document.getElementsByClassName("dot");
              
              $(arr).each(function(i, attach){                  
                  //이미지 파일
                  if(attach.fileType){                	
                    var fileCallPath =  encodeURIComponent( attach.uploadPath+"/"+attach.uuid +"_"+attach.fileName); //파일 이름                   
                    
                    str += "<div class='mySlides active'>"
                    str += "<img id='lostdog' style='width:100%' src='/display?fileName="+fileCallPath+"'>";                                   
                    str += "</div>";
                    
                    //사진 갯수만큼 dot 생성
                    dotStr += "<span class='dot' onclick='currentSlide("+(i+1)+")' style='margin:0.3rem!important;'></span>"        
                  }                  
              });
              
              //이미지 생성
              $("#imageSlides").html(str);
              //dot 생성
              $("#dots").html(dotStr);              
              
              //맨 처음 로딩 시 첫번째 사진만 보여줌
              showSlides(1);
              
              });//end getjson
              
        })();//end function
        
        
		 //신고 시 로그인 확인
		   $('#report-btn').on("click", function(e){
			   <% if(loginedUser == null){ %>
				   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
				   $('#login-modal').modal("show");
				   
			   <%} else{%>		   
			   		$(this).attr('data-target',"#report-modal");
			   		$('#report-modal').modal("show");
			   <%}%>
		   });
   }); 
   
   
   //지도
   //지도 api 선택한 곳 마커 표시하기(주소까지 출력)
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
   };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//원래 게시글의 모임장소 주소를 좌표로 바꿔주고 지도에 표시해주는 함수//********************************************************
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        setMarker(result[0].x, result[0].y);
	    }
	};
	// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
	geocoder.addressSearch("<%=dto.getDog_lost_address()%>", callback);
	
	var marker = new kakao.maps.Marker();

	//검색 하고 마커 찍어주는 함수
	function setMarker(fa, ga){
		//검색창에서 클릭한 좌표로 이동된 지도를 다시 생성
		mapOption = {
		        center: new kakao.maps.LatLng(ga, fa), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//해당 위치에 마커를 표시
		marker.setPosition(new kakao.maps.LatLng(ga, fa));
		marker.setMap(map);
	}
   </script>
   
   <script>   
   //이미지 슬라이드
   var slideIndex = 1;   

   function plusSlides(n) {
     showSlides(slideIndex += n);
   }

   function currentSlide(n) {
	 showSlides(slideIndex = n);
   }

   function showSlides(n) {
	 
	 var i;
     var slides = document.getElementsByClassName("mySlides");
     var dots = document.getElementsByClassName("dot");
     
     if (n > slides.length) {slideIndex = 1}    
     if (n < 1) {slideIndex = slides.length}
     //if (n = 1) {slideIndex = 1}
     
     //슬라이드 사진 모두 안보이게
     for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";  
     }
     for (i = 0; i < dots.length; i++) {
         dots[i].className = dots[i].className.replace(" active", "");
     }
     
     //업로드 된 사진 1장이면 이전,다음버튼, dot 안보이게
     if($('.dot').length <= 1){
      	  $('.prev').css('display','none');
      	  $('.next').css('display','none');
      	  $('.dot').css('display','none');
     }
     
     //첫번째 슬라이드 사진 보이게
     slides[slideIndex-1].style.display = "block"; 
     
     dots[slideIndex-1].className += " active";
   }   
   </script>   
   
   <!-- Javascript files-->
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
   <script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
   <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
   <script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
   <script
      src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
   <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
   <script
      src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
   <script src="/resources/js/jquery.parallax-1.1.3.js"></script>
   <script
      src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
   <script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
   <script src="/resources/js/front.js"></script>
</body>
</html>