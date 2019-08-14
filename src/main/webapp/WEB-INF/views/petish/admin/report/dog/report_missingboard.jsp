<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>
<%@ page import="com.community.petish.community.dog.missingboard.dto.*"%>


<%
   DogLostPostResponseDetailDTO dto = (DogLostPostResponseDetailDTO) request.getAttribute("dto");

	//댓글 갯수
	int commentCount = Integer.parseInt((request.getAttribute("commentCount").toString()));
	
	//댓글 페이지  번호
	int pageNum = 1;
	if((DogLostPostPageDTO)request.getAttribute("pageMaker") != null){
		DogLostPostPageDTO pageDTO = (DogLostPostPageDTO)request.getAttribute("pageMaker");
		pageNum = pageDTO.getCri().getPageNum();	
		request.setAttribute("pageNum", pageNum);
	}
	
   //게시판 아이디
   Long boardId = 4L;
   
   //게시글 아이디   
   Long idLong = dto.getId();
   String ID = idLong.toString();
   System.out.println("게시글 아이디 : " + ID);
   
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
<title>Petish Admin</title>
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
<link href="/resources/css/report.css" rel="stylesheet">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="/resources/css/admin/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/resources/js/admin/jquery-3.2.1.min.js"></script>
</head>

<body class="app sidebar-mini rtl">
      <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">Petish</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
       
      </ul>
    </header>
     <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
    
      <ul class="app-menu">
        <li><a class="app-menu__item" href="/admin"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li><a class="app-menu__item" href="/admin/user"><i class="app-menu__icon fa fa-user-circle"></i><span class="app-menu__label">User</span></a></li>
        
                
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Pages</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/admin/report"><i class="icon fa fa-circle-o"></i> 신고페이지</a></li>
            <li><a class="treeview-item" href="/admin/question"><i class="icon fa fa-circle-o"></i> 문의페이지</a></li>
            
          </ul>
        </li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-text"></i>Pages</h1>
          <p>신고게시판</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active"><a href="/admin/report">신고게시판</a></li>
        </ul>
      </div>
      <div class="row">
		<div class="tile" style="width: 100%;">
         <!-- LEFT COLUMN _________________________________________________________-->
         <div id="blog-post" class="col-md-13">

            <!-- 글 제목 -->
            <div class="panel-heading">

               <%
                  if (dto.getFound() == 0) {
               %>
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
                  <!-- <td><img src="/resources/img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle" width="70px;" height="70px;"></td> -->
                  <td>
                     <div class="nav navbar-nav ml-auto">
                        <a href="#" data-toggle="dropdown" class="nickname dropdown"><%=dto.getNickname()%></a>
                        <div class="dropdown-menu">
                           <div class="dropdown">
                              <a href="/mypage/member/detail" class="nav-link">게시글보기</a>
                           </div>
                           <div class="dropdown">
                              <a href="#" id="message-btn" class="nav-link" data-toggle="modal">쪽지보내기</a>
                           </div>
                        </div>
                     </div>
                  </td>
                  				
                  <td class=date-view>
                  <i class="fa fa-clock-o"></i>
                  <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="<%=dto.getCreate_date() %>"/>
                  <i class="fa fa-eye" style="padding-left:2rem; padding-right:0.2rem"></i><%=dto.getView_count()%>
                  </td>
                  
               </tr>
            </table>
         </div>
         
         <hr size="10px">
         
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
                  <div style="padding-top:1rem;">사례금 <%=dto.getReward()%></div>              
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
						
			<% if (commentCount == 0) {%>
			<h4>댓글  0</h4>
			<a>등록된 댓글이 없습니다. 댓글을 작성해주세요!</a>
			<script>$('.d-flex').css("display","none")</script>		
			<%}
			
			else { %>
			<h4 class="text-uppercase" id="commentCount">
			<input type="text" id="commentCountVal">
			</h4>
			
			<section class="bar bg-gray mb-0">			
			<div id="commentList" class="row comment">
			<!-- 댓글 출력 -->
			</div>			
			</section>
			<%} %>
			
			<!-- 댓글 페이징 -->
			<div style="padding:3rem">
			<form id="page_form">			
				<!-- criteria -->
				<input type="hidden" name="pageNum" value=<%= pageNum %>>
				<input type="hidden" name="amount" value="10">				
				<input type="hidden" name="post_id" value=<%= dto.getId() %>>
			</form>
            <div class="comment-footer d-flex justify-content-center"></div>
		</div>
		
		
         
         <div style="margin: 2rem"></div>

         <!-- 수정/삭제/신고 버튼 -->
         <div id="comment-form">
               <div class="row">
                  <div class="col-sm-12 text-right">
                     <nav aria-label="Page navigation example"
                        class="d-flex justify-content-left">
                        
                        <button type="submit" class="btn btn-template-outlined">
                           <i class="fa fa-trash-o"></i>
                           <a href="/dog/missingboard/delete/<%=ID%>">삭제 </a>
                        </button>
                     </nav>
                  </div>
            </div>
         </div>
         <div class="row">
       		 <div class="col-md-12">
       			  <div class="tile">
          			  <div class="tile-body">
              			<table class="table table-hover table-striped" id="sampleTable">
               			 <thead>
               				<tr>
                  				<th>유저닉네임</th>
                  				<th>신고카테고리</th>
                  				<th>신고내용</th>
                    			<th>신고날짜</th>
                    		</tr>
                		</thead>
               		 	<tbody id="userTable">
                 			<c:forEach var="reportList" items="${dogMissingReportList }">
                 				<tr>
                 				<td>${reportList.nickname }</td>
                 				<td>${reportList.category_name }</td>
                 				<td>${reportList.description }</td>
                 				<td>${reportList.created_date }</td>
                 				</tr>
         					</c:forEach>
               		 	</tbody>	
              			</table>
            		</div>
          		</div>
       	 	</div>
    	</div>     
         
         
      </div>
   
   <!-- all -->
   </div> <!-- class tile -->
  </div> <!-- class row --> 
 </main>

   
   <!-- JS 파일 추가 -->
   
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
   <script type="text/javascript" src="/resources/js/missingboard/detail.js"></script>
   <script type="text/javascript" src="/resources/js/missingboard/comment.js"></script>
   <script type="text/javascript" src="/resources/js/report.js"></script>   
  	<script src="/resources/js/admin/popper.min.js"></script>
    <script src="/resources/js/admin/bootstrap.min.js"></script>
    <script src="/resources/js/admin/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/resources/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="/resources/js/admin/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/resources/js/admin/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript"></script>   
   <script>
   if(document.location.hostname == 'pratikborsadiya.in') {
     	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
     	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
     	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
     	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
     	ga('create', 'UA-72504830-1', 'auto');
     	ga('send', 'pageview');		
    }
   
   $(document).ready(function() {
	   $('#sampleTable').DataTable();
	   (function(){
          //var id = '<c:out value="${dto.id}"/>';
          
          $.getJSON("/dog/missingboard/getAttachList/<%=dto.getId()%>", function(arr){              
        	  
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
   
</body>
</html>