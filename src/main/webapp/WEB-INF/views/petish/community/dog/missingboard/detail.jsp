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
<title>[<%=addrSplit%>] <%=dto.getDog_species()%> / <%=dto.getDog_gender()%>
   / <%=dto.getDog_age()%></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
<!-- CSS파일 추가 -->
<link href="/resources/css/commons/kakaomap.css?ver=1" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<link href="/resources/css/missingboard/detail.css" rel="stylesheet">
<link href="/resources/css/missingboard/comment.css" rel="stylesheet">
<link href="/resources/css/report.css" rel="stylesheet">

<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif;">
<div class="all">
      <%@ include file="/WEB-INF/views/commons/dog_top.jspf"%>
      
      <%
    	//접속 아이디
    	Long userId = null;
        String userNickname = "";
    	if(loginedUser != null){
    		userId = loginedUser.getId();
    		userNickname = loginedUser.getNickname();
    		
    		System.out.println("유저아이디 : " + userId);
    		System.out.println("유저닉네임 : " + userNickname); 
      }
      %>

      <div class="content-fluid body-section">

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
            
            <button type="submit" class="list btn btn-template-outlined custom-button">
               <i class="fa fa-align-justify"></i>
               <a href="<c:url value='/dog/missingboard/'/>"> 목록 </a>
            </button>

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
                  <th colspan="2" class="poster-title">강아지를 찾습니다</th>
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
                  <th colspan="2" class="phonenumber-reward-info">
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
			
			<!-- 댓글 갯수 -->
			<h4 class="text-uppercase" id="commentCount">
			<input type="text" id="commentCountVal">
			</h4>
			<!-- 댓글 내용 -->
			<section>			
			<div id="commentList" class="row comment">
			<!-- 댓글 출력 -->
			</div>			
			</section>
			
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
		
		<!-- 댓글 입력창 -->
		<h4 class="comment">댓글 작성</h4>
		
		<form id="insert_form" method="post">
			<!-- comments -->
			<input type="hidden" name="user_id" value=<%= userId %>> 
			<input type="hidden" name="post_id" value=<%=dto.getId() %>>
			<input type="hidden" name="pageNum" value=<%= pageNum %>>
			
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<label for="name">아이디<span class="required text-primary">*</span></label>						
						<input id="NICKNAME" name="nickname" type="text" class="form-control" value="<%=userNickname %>" readonly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group comment-div">
						<label for="comment">내 용 <span class="required text-primary">*</span></label>
						
						<div class="comment-and-button">
							<div class="comment-form">							
							<textarea id="CONTENT" name="content" rows="4" class="form-control "></textarea>						
							</div>
							
							<div class="comment-button-div">
								<button class="re btn btn-template-outlined comment-input-button" id="input_data">댓글 등록</button>
							</div>
						</div>
					</div>		
				</div>
			</div>
			
		</form>
		<!-- comment insert form END -->
         
         <div style="margin: 2rem"></div>

         <!-- 수정/삭제/신고 버튼 -->
         <div id="comment-form">
               <div class="row">
                  <div class="col-sm-12 text-right">
                  
				<% if((loginedUser != null) && (userId == dto.getUser_id())) {%>
                     <nav aria-label="Page navigation example"
                        class="d-flex justify-content-left">
                        <button class="btn btn-template-outlined custom-button">
                           <i class="fa fa-pencil"></i>
                           <a href="/dog/missingboard/modifyForm/<%=ID%>">수정 </a>
                        </button>
                        <button type="submit" class="btn btn-template-outlined custom-button">
                           <i class="fa fa-trash-o"></i>
                           <a href="/dog/missingboard/delete/<%=ID%>">삭제 </a>
                        </button>
                     </nav>
                <%} %>
                
	                <div class="col-sm-12 text-right">                
	                  <!-- 게시글 신고 버튼 -->                     
	                   <button type="button" class="btn btn-danger" data-toggle="modal"
	                      style="float: right;" id="report-btn">신고
	                   </button>
	                </div>
                  </div>
            </div>
         </div>
         <div style="margin: 5rem"></div>
         
      </div>
   </div>
   <!-- all -->
  
   <!-- 신고 모달창 -->
   <div id="report-modal" tabindex="-1" role="dialog" aria-hidden="true"
      class="modal fade">
      <div role="document" class="modal-dialog modal-dialog-centered">
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

                  <input type="hidden" name="board_id" id="BOARD_ID" value=<%=boardId%>>
                  <input type="hidden" name="post_id" id="POST_ID" value=<%=ID%>>            
                  <input type="hidden" name="user_id" id="USER_ID" value=<%=userId %> >
                  
                  <label style="text-align: left !important;">신고 분류</label>
                  <div class="form-group">
                     <select id="state" name="category_id" id="category_id"
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
                     <textarea name="description" id="description" rows="10"
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
   
   <!-- 쪽지 보내기 모달창 -->
   <div id="message-modal" tabindex="-1" role="dialog" aria-hidden="true"
        class="modal fade">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 align="center" class="modal-title">쪽지보내기</h4>
                    <button type="button" data-dismiss="modal" aria-label="Close"
                        class="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                <form id="message_form" method="POST">
                	
			   		<input type="hidden" name="messageSender_id" id="sender_id" value=<%=userId%>>
                	<input type="hidden" name="messageReceiver_id" id="receiver_id" value=<%=dto.getUser_id() %>>
                
                    <div class="form-group">
                        <label>받는사람</label>
                        <input class="form-control" name='messageNickname' value=<%=dto.getNickname() %> readonly>
                    </div>
                    <div class="form-group">
                        <label>제목</label>
                        <input class="form-control" name='messageTitle'>
                    </div>
                    <div class="form-group">
                        <label>내용</label>
                        <textarea id="message_content" name='messageContent' rows="10" class="form-control"></textarea>
                    </div>
                    <p class="text-center">   
                        <input type="submit" value="보내기" id="modalSendBtn" class="btn btn-outline-primary">
                    </p>
                </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
   
   <!-- JS 파일 추가 -->
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
   <script type="text/javascript" src="/resources/js/missingboard/detail.js"></script>
   <script type="text/javascript" src="/resources/js/missingboard/comment.js"></script>
   <script type="text/javascript" src="/resources/js/report.js"></script>   
   
   <script>
   $(document).ready(function() {	
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
        
		 //쪽지 전송 시 로그인 확인
		   $('#message-btn').on("click", function(e){
			   <% if(loginedUser == null){ %>
				   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
				   $('#login-modal').modal("show");
				   
			   <%} else{%>		   
			   		$(this).attr('data-target',"#message-modal");
			   		$('#message-modal').modal("show");
			   <%}%>
		   });        
        
        //쪽지 전송
		 $('#modalSendBtn').click(function(event){			 
			   event.preventDefault();
			   
			   var newModal = $("#message-modal"); //모달창
			   
			   var modalInputTitle = newModal.find("input[name='messageTitle']"); //모달창 제목
			   var modalInputContent = newModal.find("textarea[name='messageContent']"); //모달창 내용
			   var modalInputSender_id = newModal.find("#sender_id"); // 모달창 보내는 user_id
			   var modalInputReceiver_id = newModal.find("input[name='messageReceiver_id']"); //모달창 받는 user_id
			   
			   var modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼
			   
			   //var msg = $("#message_form").serialize();
			   //alert(msg);
			   
			   var message = {
					    title : modalInputTitle.val(),
					    content : modalInputContent.val(),
					    sender_id : modalInputSender_id.val(),
					    receiver_id : modalInputReceiver_id.val()
					    }
		       
	           $.ajax({
	               url : '/mypage/api/message/new',
	               type : 'post',
	               data : JSON.stringify(message),
	               contentType : "application/json; charset=utf-8",
	               beforeSend : function(){
	            	   if(sender_id == "" || sender_id == "null"){
	            		   alert("로그인 후 이용할 수 있습니다. 로그인 해주세요.");		            		   
	            		   return false;
	            	   }
	            	   else{
	            		   return true;
	            	   }
	               },
	               success : function(result, status, xhr) {
	            	   if (callback) {
	            		   callback(result);
	            		   alert("쪽지가 성공적으로 전송됐습니다.");
	            		   $("#message-modal").modal("hide");
		               }
		           },
		           error : function(xhr, status, er) {
		               if (error) {
		                   error(er);
		                   alert("쪽지 전송 실패");
		               }
		           }
	           });
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
    var infowindow = new kakao.maps.InfoWindow({zindex:1});
	//원래 게시글의 모임장소 주소를 좌표로 바꿔주고 지도에 표시해주는 함수//********************************************************
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	var detailAddr ='<div>주소 : '+result[0].address_name+'</div>';
	    	var content = '<div class="bAddr">' +
            '<span class="title">법정동 주소정보</span>' + 
            detailAddr +  '</div>';
	        setMarker(result[0].x, result[0].y,content);
	    }
	};
	// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
	geocoder.addressSearch("<%=dto.getDog_lost_address()%>", callback);
	 var imageSrc = '/resources/img/missingboard/lostdogLocation.png', // 마커이미지의 주소입니다    
     imageSize = new kakao.maps.Size(100, 100), // 마커이미지의 크기입니다
     imageOption = {offset: new kakao.maps.Point(50, 100)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);  
     
     var marker = new kakao.maps.Marker({
        map: map,
        image: markerImage // 마커이미지 설정
	});
	//검색 하고 마커 찍어주는 함수
	function setMarker(fa, ga,content){
		//검색창에서 클릭한 좌표로 이동된 지도를 다시 생성
		mapOption = {
		        center: new kakao.maps.LatLng(ga, fa), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//해당 위치에 마커를 표시
		marker.setPosition(new kakao.maps.LatLng(ga, fa));
		marker.setMap(map);
		
        infowindow.setContent(content);
        infowindow.open(map, marker);
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