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
			   if(loginedUser == null){
				   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
				   $('#login-modal').modal("show");
				   
			   } else{		   
			   		$(this).attr('data-target',"#report-modal");
			   		$('#report-modal').modal("show");
			   }
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
   