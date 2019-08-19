	var newModal = $("#new-modal"); //모달창
	var modalInputReceivedNickname3 = newModal.find("input[name='nickname']"); //모달창 받는사람
	var modalInputReceiver_id3 = newModal.find("input[name='receiver_id']"); //모달창 받는 user_id
	var modalInputTitle3 = newModal.find("input[name='title']"); //모달창 제목
	var modalInputContent3 = newModal.find("textarea[name='content']"); //모달창 내용
	var modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼
	
	
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
		// 주소로 좌표를 검색합니다
		/*geocoder.addressSearch('',
			function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {

					var coords = new daum.maps.LatLng(
							result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new daum.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">정모 장소</div>'
							});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
		});*/
		
		
		
		
$('.rating').on('change', function() {
	console.log('Rating selected: ' + $(this).val());
});