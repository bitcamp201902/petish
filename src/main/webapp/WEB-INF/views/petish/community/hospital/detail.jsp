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
	<link rel="stylesheet" href="/resources/css/hospital/detail.css?ver=1">
	<link rel="stylesheet" href="/resources/css/write-modify.css">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>


<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif;">
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/hospital_top.jspf" %>

		<div class="container-fluid body-section">
		
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
										평점 : <span class='star-rating' >
											<span style ="width:${score_star }%"></span>
										</span><span class="title" style="display:inline-block;font-size:40px;">${score }</span>
									</div>
								
									<div class="fa fa-home fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_name" style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${hospital.hospital_name }</span>
									</div>
								
								
									<div class="fa fa-map-marker fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_address"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${hospital.hospital_addr }</span>
									</div>
								
								
									<div class="fa fa-phone fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="phone_number"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${hospital.hospital_phone }</span>
									</div>
								
								
									<div class="fa fa-clock-o fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="opertion_time"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${hospital.hospital_hours }</span>
									</div>
								
								
									<div class="fa fa-laptop fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="site_address"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${hospital.hospital_website }</span>
									</div>
								
								<c:if test="${hospital.isParking == 1 }">
									<div class="fa fa-car fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="parking"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">주차가능</span>
									</div>
								</c:if>
								 
								 <c:if test="${hospital.isEmergency == 1 }">
									<div class="fa fa-plus-square fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="emergency"style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">응급진료</span>
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
				<span class="menu1" style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">진료 과목</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px; display:inline-block;" id="subject">
				<c:forTokens var="jinryo" items="${hospital.hospital_check }" delims=",">
					<span style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">${ jinryo} / </span>
				</c:forTokens>
			</div>
			
		</div>

		<div class="container">
			<div class="fa fa-map-marker fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">찾아오시는길</span>
			</div>
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>

		<div class="container">
			<div class="fa fa-comments fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-family: 'Do Hyeon', sans-serif; font-size:30px;">한 줄로 말하기</span>
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
		</div><!-- container fluid close -->
	</div> <!-- all close -->
	
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
	<script src="/resources/js/hospital/detail.js?ver=2"></script>
	<script src="/resources/js/hospital/star.js"></script>
	<script>
	//원래 게시글의 모임장소 주소를 좌표로 바꿔주고 지도에 표시해주는 함수//********************************************************
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        setMarker(result[0].x, result[0].y,"${hospital.hospital_name }");
	    }
	};
	// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
	geocoder.addressSearch("${hospital.hospital_addr }", callback);
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