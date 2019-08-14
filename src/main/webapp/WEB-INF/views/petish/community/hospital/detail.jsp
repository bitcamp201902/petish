<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>PET HOSPITAL</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css?ver=1">
	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/detail.css">
	<link rel="stylesheet" href="/resources/css/write-modify.css">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
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
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.prev{
	left:0;
	border-radius: 3px 0 0 3px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: grey;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>


<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf" %>



		<div id="content">
			<div class="container">
				<div class="bar">
					
						<div class="col-md-12">
							<div class="heading" id="head">
								<h2 class="text-uppercase">PET HOSPITAL</h2>
							</div>
							<div class="col-lg-8 text-right p-3" style="display:inline-block;">
										<a onclick="javascript:history.back();" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
						</div>
					
					<div class="row portfolio text-center">
						<div class="col-md-6">
								<%-- <div class="image">
									<img src="/resources/img/hospital/${hospital.hospital_img }" alt="" class="img-fluid" style="height: 350px;">
								</div> --%>
							<div class="slideshow-container">
							<c:forEach var="img" items="${imglist }">
								<div class="mySlides">
  									<img src="/resources/img/hospital/${img}" style="width:100%; height: 400px;">
								</div>
								
							</c:forEach>
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>

							</div>
							<br>

							<div style="text-align:center">
							<c:forEach var="item" items="${imglist }" varStatus="status">
								<span class="dot" onclick="currentSlide(${status.index+1})"></span> 
							</c:forEach>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="icon">
							<ul>
									<div class="fa fa-star" id="spec" aria-hidden="true"style="font-size:24px;">
										평점 : <span class='star-rating'>
											<span style ="width:${score_star }%"></span>
										</span><span class="title" style="display:inline-block;font-size:40px;">${score }</span>
									</div>
								
									<div class="fa fa-home fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_name">${hospital.hospital_name }</span>
									</div>
								
								
									<div class="fa fa-map-marker fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_address">${hospital.hospital_addr }</span>
									</div>
								
								
									<div class="fa fa-phone fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="phone_number">${hospital.hospital_phone }</span>
									</div>
								
								
									<div class="fa fa-clock-o fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="opertion_time">${hospital.hospital_hours }</span>
									</div>
								
								
									<div class="fa fa-laptop fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="site_address">${hospital.hospital_website }</span>
									</div>
								
								<c:if test="${hospital.isParking == 1 }">
									<div class="fa fa-car fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="parking">주차가능</span>
									</div>
								</c:if>
								 
								 <c:if test="${hospital.isEmergency == 1 }">
									<div class="fa fa-plus-square fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="emergency">응급진료</span>
									</div>
								</c:if>
								
							</ul>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="fa fa-list fa-2x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-size: 23px;">진료 과목</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px; display:inline-block;" id="subject">
				<c:forTokens var="jinryo" items="${hospital.hospital_check }" delims=",">
					<span>${ jinryo} / </span>
				</c:forTokens>
			</div>
			
		</div>

		<div class="container">
			<div class="fa fa-map-marker fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-size: 23px;">찾아오시는길</span>
			</div>
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>

		<div class="container">
			<div class="fa fa-comments fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-size: 23px;">한 줄로 말하기</span>
			</div>
		<div id="reviewList" style="display: block;">
			<table class="table table-stripped" >
				<thead>
					<tr style="font-size: 15px;">
						<th width=15%>평점</th>
						<th width=25%>글쓴이</th>
						<th>내용</th>
					</tr>
				</thead>

				<tbody id="reviews">
				
				</tbody>
			</table>
			<div>
					<span class="star-input">
						  <span class="input">
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
    						<input style="visibility: hidden;" type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
    						<input style="visibility: hidden;" type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
    						<input style="visibility: hidden;" type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
    						<input style="visibility: hidden;" type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
						  </span>
	  					<output style="line-height: 50px; vertical-align: middle;" for="star-input"><b>0</b>점</output>
					</span>
					

					<textarea style="width:90%; height:100%; boder:2px solid #38A7BB;" placeholder="자유롭게 작성하되 욕설 및 상대방에게 불쾌감을 줄 수 있는 단어는 금지합니다.(100자 이내)" 
					 id="review_content" maxlength="100"></textarea>
						<button type="button" class="btn btn-template-outlined" id="reInsert" style="margin-bottom: 25px;">작성완료</button>
			
			</div>
		</div>
		<div id="modifyForm">
		</div>
			
			<!-- 번호   -->
			<div aria-label="Page navigation" class="d-flex justify-content-center">
				<ul class="pagination" id="paging">
												
           		</ul>
       		</div>
		</div>
	</div>
	
	<div id="new-modal" tabindex="-1" role="dialog" aria-hidden="true"
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
					<div class="form-group">
						<label>받는사람</label> <input class="form-control" name='nickname'
							readonly>
					</div>
					<input type="hidden" name="receiver_id">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content'></textarea>
					</div>
					<div class="text-left">
						<input type="button" value="보내기" class="modalSendBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Javascript files-->
	
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
		
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	
	<script src="/resources/js/hospital/star.js"></script>
	<script>
	var newModal = $("#new-modal"); //모달창
	var modalInputReceivedNickname3 = newModal.find("input[name='nickname']"); //모달창 받는사람
	var modalInputReceiver_id3 = newModal.find("input[name='receiver_id']"); //모달창 받는 user_id
	var modalInputTitle3 = newModal.find("input[name='title']"); //모달창 제목
	var modalInputContent3 = newModal.find("textarea[name='content']"); //모달창 내용
	var modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼


	//쪽지작성 모달 열기(닉네임 및 아이디 전달)
	function openMessageForm() {
		var showmodal = $(".showmodal");
		showmodal.on("click", function(e) {
			<%if(loginedUser == null){%>
				$('#login-modal').modal('show');
			<%}else{%>
				var id = $(this).data("id");
				var nick = $(this).data("nick");
				modalInputReceiver_id3.val(id);
				modalInputReceivedNickname3.val(nick);
				$("#new-modal").modal("show");
			<%}%>
			}); 
		}


	//쪽지보내기 버튼 클릭시
	modalSendBtn.on("click", function(e) {
		<%if(loginedUser == null){%>
			$('#login-modal').modal('show');
		<%}else{%>
			var user_id = '<%=loginedUser.getId()%>';
			var message = {
			title : modalInputTitle3.val(),
			content : modalInputContent3.val(),
			sender_id : user_id,
			receiver_id : modalInputReceiver_id3.val()
			}
			messageService.writeMessage(message, function(result) {
			alert("result : " + result);
			$("#new-modal").modal("hide");
			location.reload();
			});
		<%}%>
	});


	//쪽지보내기 ajax메서드
	var messageService = (function() {
		function writeMessage(message, callback, error) {
			$.ajax({
				type : 'post',
				url : '/mypage/api/message/new',
				data : JSON.stringify(message),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
			if (callback) {
			callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
			})
		}
		return {
			writeMessage : writeMessage
			};
		})();
	
	
	var slideIndex = 1;
	showSlides(slideIndex);

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
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	}
	//반응형 적용
	 function resizeStar(){
		if(window.innerWidth <= 768) {
			$(".star-rating").attr('class','star-rating-40');
		}
		else{
			$(".star-rating-40").attr('class','star-rating');
		}
	 }
		
	
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
	        setMarker(result[0].x, result[0].y,"${hospital.hospital_name }");
	    }
	};
	// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
	geocoder.addressSearch("${hospital.hospital_addr }", callback);
	
	var marker = new kakao.maps.Marker();

	//검색 하고 마커 찍어주는 함수
	function setMarker(fa, ga, name){
		//검색창에서 클릭한 좌표로 이동된 지도를 다시 생성
		mapOption = {
		        center: new kakao.maps.LatLng(ga, fa), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//해당 위치에 마커를 표시
		marker.setPosition(new kakao.maps.LatLng(ga, fa));
		marker.setMap(map);
		kakao.maps.event.addListener(marker, 'click',function(){
			clickInfowindow(map,marker,name,fa,ga);
		});
	}
	//지도 마커 클릭시 길찾기, 더큰지도에서보기 기능
	function clickInfowindow(map, marker, name,fa,ga){
		var iwContent = '<div style="padding:5px;">'+name+' <br><a href="https://map.kakao.com/link/map/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">길찾기</a></div>';
		 infowindow= new kakao.maps.InfoWindow({
		        position : new kakao.maps.LatLng(ga, fa), 
		        content : iwContent 
		    });
		    
		    infowindow.open(map,marker);
	}
	
	//페이지 버튼 클릭 이벤트
	function pageClick(page){
		getReview("${hospital.id}",page);
	}
	//본인이 쓴 댓글에 경우 수정 버튼 클릭시 실행되는 함수
	function modifyReviewForm(vo,page){
		$('#reviewList').attr('style', "display:none;");
		$('#paging').attr('style', "display:none;");
		var output = '';
		output +='<span class="star-modify">';
		output += '<span class="input">';
		output += '<input style="visibility: hidden;" type="radio" name="star-modify" id="mp1" value="1"><label for="mp1">1</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp2" value="2"><label for="mp2">2</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp3" value="3"><label for="mp3">3</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp4" value="4"><label for="mp4">4</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp5" value="5"><label for="mp5">5</label>';
		output += '<input style="visibility: hidden;" type="radio" name="star-modify" id="mp6" value="6"><label for="mp6">6</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp7" value="7"><label for="mp7">7</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp8" value="8"><label for="mp8">8</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp9" value="9"><label for="mp9">9</label>';
		output +='<input style="visibility: hidden;" type="radio" name="star-modify" id="mp10" value="10"><label for="mp10">10</label>';
		
		output +='</span>';
		output +='<output style="line-height: 50px; vertical-align: middle;" for="star-modify"><b>0</b>점</output>';
		output +='</span>';
		output +='<textarea style="width:90%; height:100%; boder:2px solid #38A7BB;" id="review_modify" maxlength="100">'+vo.content+'</textarea>';
		output +='<br><button type="button" class="btn btn-template-outlined" id="reModify">수 정</button>';
		output +='<button type="button" class="btn btn-template-outlined" id="reCancle" style="margin-left: 10px;">취 소</button>';
		
		$('#modifyForm').append(output);
		//취소버튼 클릭이벤트
		$('#reCancle').click(function(event){
			modifyCancle();
		});
		//수정 버튼 클릭이벤트
		$('#reModify').click(function(event){
			modifyReview(vo.id,page);
		});
		//댓글 수정 js 함수 호출
		mstarRating();
		//DB에 있는 값으로 별점을 표시해줌
		$('input:radio[name="star-modify"]:input[value="'+vo.score+'"]').prop("checked", true);
		//DB에 있는 값으로 평점을 표시해줌
		$('.star-modify').find("output>").text(vo.score);
		
		
		
	}
	//취소 버튼을 눌렀을 경우 실행되는 함수
	function modifyCancle(){
		$('#reviewList').attr('style', "display:block;");
		$('#paging').attr('style', "display:flex;");
		$('#modifyForm').empty();
	}
	//수정 폼에서 수정 버튼을 눌렀을 경우 실행되는 함수
	function modifyReview(id,page){
		var params = {
				'id' : id,
				'content' : $('#review_modify').val(),
				'score' : $("input[name=star-modify]:checked").val()
		};
		
		$.ajax({
			url:'/hospital/review/modify/'+id,
			type:'PUT',
			data:JSON.stringify(params),
			contentType:'application/json; charset=utf-8',
			dataType:'json',
			success:function(retVal){
				if(retVal.res == "OK"){
					//데이타 성공일때 이벤트 작성
					//리뷰호출
					getReview("${hospital.id}",page);
					//리뷰부분 다시 보이게 출력
					modifyCancle();
					location.reload();					
				}
				else{
					alert("Modify Fail!!!");
				}
			},
			error:function(request,status,error){
				alert("ajax 통신 실패!!!");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
	}
	//리뷰 삭제 하는 함수
	function deleteReview(id,page){
		$.ajax({
			url:'/hospital/review/delete/'+id,
			type:'DELETE',
			success:function(retVal){
				if(retVal.res=="OK"){
					getReview("${hospital.id}",page);
				}
				else{
					alert("Delete Fail!!!");
				}
			},
			error:function(request,status,error){
				alert("ajax 통신 실패!!!");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
		
	}
	//리뷰 호출 함수
	function getReview(id,page){
		//리뷰부분, 페이징 부분 초기화
		$('#reviews').empty();
		$('#paging').empty();
		$.ajax({
			url:'/hospital/review/'+id+'/'+page,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				
				$.each(data.rlist, function(index, item){
					var output='';
					output += '<tr style="font-size: 15px;">';
					output += '<td>';
					output += '<span class="star-rating"style="text-align:left;">';
					output += '<span style ="width:'+(item.score*10.0)+'%"></span>';
					output += '</span>';
					output += '</td>';
					output += '<td><div class="dropdown">'+item.nickname;
					<%if (loginedUser != null){ %>
						var user_id ='<%=loginedUser.getId()%>'
						if(user_id != item.user_id){ //로그인된 유저와 글쓴이가 같지않을 경우
							output += "<div class='dropdown-content'><a href='/member/detail/"+item.user_id+"'>작성게시글 보기</a>";
							output += "<a href='#' data-toggle='modal' class='showmodal' data-target='#new-modal'"
							output += "data-id="+item.user_id+"";
							output += " data-nick="+item.nickname;
							output += ">쪽지보내기</a></div>"	
						}
					<%}else{%>
						output += "<div class='dropdown-content'><a href='/member/detail/"+item.user_id+"'>작성게시글 보기</a>";
						output += "<a href='#' data-toggle='modal' class='showmodal' "
						output += "data-id="+item.user_id+"";
						output += " data-nick="+item.nickname;
						output += ">쪽지보내기</a></div>"
					<%}%>
					output += '</div></td>';
					output += '<td>'+item.content;
					<%if (loginedUser != null){ %> //로그인이 되어있을경우
						var user_id ='<%=loginedUser.getId()%>'
						if(user_id == item.user_id){ //로그인된 유저와 글쓴이가 똑같을 경우
							output += '<br><button type="button" class="btn btn-template-outlined" id="re_modify" style="padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; margin-right: 10px;">수 정</button>';
							output += '<button type="button" class="btn btn-template-outlined" id="re_delete" style="padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px;">삭 제</button></td>';
							output += '</tr>';
							$('#reviews').append(output);
							$('#re_modify').click(function(event){
								modifyReviewForm(item,page);
							});
							$('#re_delete').click(function(event){
								deleteReview(item.id,page);
							});
						}
						else{
							output += '</td>';
							output += '</tr>';
							$('#reviews').append(output);
						}
					<%}else{%> //로그인 안되어 있을 경우
						output += '</td>';
						output += '</tr>';
						$('#reviews').append(output);
					<%}%>
				});
				openMessageForm();
				
				//페이징 처리 반복문
				for(var i = data.paging.startPage; i<=data.paging.endPage; i++){
					var output='';
					if(i == data.paging.startPage){
						output += '<li class="page-item"><a class="page-link" onclick="pageClick('+1+')"> <i class="fa fa-angle-double-left"></i></a></li>';
						if(page != 1){
							output += '<li class="page-item"><a class="page-link" onclick="pageClick('+(page-1)+')"> <i class="fa fa-angle-left"></i></a></li>';
						}
					}
					output += '<li class="page-item"id="page'+i+'"><a class="page-link" onclick="pageClick('+i+');">'+i+'</a></li>';
					if(i == data.paging.endPage){
						if(page != data.paging.realEnd){
							output += '<li class="page-item"><a class="page-link" onclick="pageClick('+(page+1)+')"> <i class="fa fa-angle-right"></i></a></li>';
						}
						output += '<li class="page-item"><a class="page-link" onclick="pageClick('+data.paging.realEnd+')"> <i class="fa fa-angle-double-right"></i></a></li>';
					}
					$('#paging').append(output);
					$("#page"+page).attr('class','page-item active');
				}
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		});
		
		
	}
	
	</script>
	
	<script>
	$(document).ready(function(){
		//별리사이징
		resizeStar();
		//리뷰호출
		getReview("${hospital.id}",1);
		//리뷰등록 버튼 클릭이벤트
		$('#reInsert').click(function(event){
			
			//세션아이디가 없을 경우
			<%if (loginedUser == null){ %>
				//로그인창 띄움
				$('#login-modal').modal('show');
			<%}else{%>
				//로그인 되어있을경우
				var params = {
						'user_id' : '<%=loginedUser.getId()%>',
						'content' : $('#review_content').val(),
						'score' : $("input[name=star-input]:checked").val(),
						'hospital_id' : "${hospital.id}",
				};
				$.ajax({
					url:'/hospital/review/',
					type:'POST',
					data:JSON.stringify(params),
					contentType:'application/json; charset=utf-8',
					dataType:'json',
					success: function(retVal){
						if(retVal.res == "OK"){
							//데이타 성공일때 이벤트 작성
							getReview("${hospital.id}",1);
							//초기화
							$('#review_content').val('');
							//페이지 리로드(댓글 등록 후 평점 갱신을 위해서)
							location.reload();
							
						}
						//한줄리뷰 중복 등록시
						else if(retVal.res == "duplication"){
							alert('이미 작성된 한줄평이 존재합니다.');
							
							//데이타 성공일때 이벤트 작성
							getReview("${hospital.id}",1);
							//초기화
							$('#review_content').val('');
							//페이지 리로드(댓글 등록 후 평점 갱신을 위해서)
							location.reload();
						}
						else{
							alert("Insert Fail!!!");
						}
					},
					error:function(request,status,error){
						alert("ajax 통신 실패!!!");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				}); 
				//별점라디오버튼 초기화
				$("input[name=star-input]:radio").prop("checked",false);
				//평점 0점으로 초기화
				$(".star-input").find("output>b").text(0);
			
			<%}%>			
		});
		
		
	});
	$(window).resize(function(){
		resizeStar();
	});
	
	</script>

	
</body>
</html>