<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat,com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO,com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO,com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO,
				com.community.petish.community.user.dto.response.LoginedUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	DogGatherPostVO post = (DogGatherPostVO)request.getAttribute("post");

	String addr = post.getGATHERING_ADDRESS();
	String writer = (String)request.getAttribute("writer");
	Long boardId = 2L;
	
	//DogSize
	Long sizeID = (Long)request.getAttribute("sizeID");
	String size = "";
	if(sizeID == 1L) {
		size = "소";
	}
	else if(sizeID == 2L) {
		size = "중";
	}
	else if(sizeID == 3L) {
		size = "대";
	}
	
	//정모 참여자 - DTO List
	List<DogGatherParticipantDTO> participantList = (ArrayList<DogGatherParticipantDTO>)request.getAttribute("participantList");
	int participantCount = (int)request.getAttribute("participantCount");
	
	Timestamp GATHRING_DATE = post.getGATHERING_DATE();
	// 정모 날짜 지나면 신청 못하도록 구현
	// 현재 시간 Timestamp 형식으로 구하기
	// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = null;
	today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	
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
<link rel="stylesheet" href="/resources/css/gatherboard/chat.css">
<link rel="stylesheet" href="/resources/css/gatherboard/detail.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1&display=swap&subset=korean" rel="stylesheet">
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
        <div id="content">
			<div class="container">
			      <div class="row bar">
					<div class="col-md-12">
						<div class="panel-heading">
							<h2 class="h3 panel-title"><%= post.getTITLE() %></h2>
						</div>

						<table>
								<tr>
									<td><img src="/resources/img/blog-avatar2.jpg" alt=""
										class="img-fluid rounded-circle"></td>
									<td>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown"> <%= writer %></a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
											</div>
										</div>
									</td>
									<td class=grade>정회원</td>
									<td class=date>작성일 : <%= post.getCREATED_DATE() %></td>
									<td class=date>수정일 : <%= post.getUPDATED_DATE() %></td>
									<td class=view><i class="fa fa-eye"></i> 조회 : <%= post.getVIEW_COUNT() %></td>
								</tr>
							</table>
							<hr size="10px">

						<div id="post-content">						
							<h3>모임 안내</h3>
							<blockquote class="blockquote">
									<p><strong>모임 일시 :</strong> <%= post.getGATHERING_DATE() %></p>
									<p><strong>장소 :</strong> <%= post.getGATHERING_ADDRESS() %></p>
									<p id="sizeID"><strong>크기  :</strong> <%= size %>
									<p><strong>반려견 :</strong> <%= request.getAttribute("dogSpecies") %> </p>
									<p><strong>내용 :</strong> <%= post.getCONTENT() %></p>
							</blockquote>
						</div>
						
						<div id="map" style="width:100%;height:350px;"></div>

						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						
				        var imageSrc = '/resources/img/gatherboard/dog.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(64, 60), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				          
					    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
							
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('<%=addr%>', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
					
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						

							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({
							        map: map,
							        image: markerImage, // 마커이미지 설정 
							        position: coords,
							    });

						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=addr%></div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>

					<!-- comment -->	
						<div id="comments">
							<h4 class="text-uppercase" id="commentCount"></h4>
							<section class="bar mb-0" id="commentSection">
								<div id="commentList" class="row comment">
								</div>
						
							</section>
							<!-- comment_page_form -->
							<form id="page_form">
								<input type="hidden" name="POST_ID" value=<%= post.getID() %>>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
							</form>
	                         <div class="comment-footer d-flex justify-content-center"></div>
	                         <button id="deleteBtn" type="submit" class="btn btn-template-outlined">
												<i class="fa fa-trash-o"></i> <a href="/dog/gatherboard/deleteDogGatherPost/<%=post.getID()%>">삭제</a>
										</button>
						</div>
						
						<div id="comment-form">
							
								<!-- comment insert form END -->
							<div class="col-sm-12"> 
										
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
					                 			<c:forEach var="reportList" items="${dogGatherReportList }">
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
						</div>
					</div>
				</div>
    		</div>
		</div>
   </div> <!-- class tile -->
  </div> <!-- class row --> 
 </main>

   
   <!-- JS 파일 추가 -->
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
   <script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/chat.js"></script>
	<script src="/resources/js/gatherboard/comment.js"></script>
	<script src="/resources/js/report.js"></script>
	 <script>
   $(document).ready(function() {
	   //$('#sampleTable').DataTable();
   });
   </script>
   
</body>
</html>