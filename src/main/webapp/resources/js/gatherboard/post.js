$(document).ready(function(){
	//alert(addr1);
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(addr1, function(result, status) {
		//alert('result='+result[0].x);
		//지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		map: map, 
		image: markerImage, // 마커이미지 설정 
		position: new kakao.maps.LatLng(result[0].y, result[0].x)
		});
		
		//커스텀 오버레이에 표시할 컨텐츠 입니다
		//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		//별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title" style="text-align:center;">정모 장소</div>' + 
        '        <div class="body">' + 
        '            <div style="padding:8px;">' 
        content += '<div class="ellipsis">장소 : '+ addr1 
        //장소명이 존재하는 경우
        if(!(addr2==null || addr2=="")) {        	
        	content += " " + addr2       
        } 
		content += '</div>' +
        '                <div class="ellipsis">일시 : ' + gatheringDate + '</div>' + 
		'                <div class="jibun ellipsis text-center" style="margin-top:10px;">' +
        '                  <button class="btn btn-template-outlined btn-sm" id="button"><a id="button" href="https://map.kakao.com/link/map/'+addr1+','+result[0].y+','+result[0].x+'" style="target="_blank">큰지도</a></button>' +
        '                  <button class="btn btn-template-outlined btn-sm" id="button"><a id="button" href="https://map.kakao.com/link/to/'+addr1+','+result[0].y+','+result[0].x+'" style="target="_blank">길찾기</a></button>'+	
        '                </div>' + 
        '                <div></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';			
		
		//마커 위에 커스텀오버레이를 표시합니다
		//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: marker.getPosition()       
		});
		
		overlay.setMap(map);	
		
		//지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(marker.getPosition());
	});
});

/* 크기별 견종 분류 */
function categoryChange() {
	var size = document.getElementsByName('DOG_SIZE');
	var small = ["스피츠","꼬똥 드 툴레아","시츄","요크셔테리어","말티즈","포메라니안","푸들","치와와","미니핀","슈나우저","페키니즈","닥스훈트","빠삐용","기타 소형견"];
	var medium = ["비숑 프리제","보스턴 테리어","샤페이","웰시코기","비글","코카스파니엘","불독","기타 중형견"];
	var large = ["사모예드","피레니즈","리트리버","말라뮤트","한국 토종견","허스키","세퍼트","하운드","달마시안","콜리","쉽독","기타 대형견"];
	var target = document.getElementById("species");
	
	if(size[0].value == 1) var d = small;
	else if(size[0].value == 2) var d = medium;
	else if(size[0].value == 3) var d = large;
	
	target.options.length = 0;
	
	for(x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

$('#participantResetBtn').click(function(){
	$('#myLargeModal').modal('hide');
})

function participantCheck(size) {	
	var sizeID = size;
	var participantSizeID = document.getElementById('size');
	var requestContent = document.getElementById('requestContent');
	
	if(sizeID != participantSizeID.value) {
		alert("크기를 다시 선택해주세요!");
		return false;
	}
	
	if(requestContent.value == "" || requestContent.value == null) {
		alert("신청 내용을 입력해주세요!");
		return false;
	}
	
	return true;
}

function messageClick(participant) {
	var msg = participant.split(",");
	var participantID = msg[0];
	var participantNickName = msg[1];
	
	var actionForm = $("#message_form");
	actionForm.find("input[name='messageReceiver_id']").val(participantID);
	actionForm.find("input[name='messageNickname']").val(participantNickName);
	
    $(this).attr('data-target',"#message-modal");
    $('#message-modal').modal("show");	

}

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
        	  if(message.sender_id == message.receiver_id) {
             	 alert("본인에게는 쪽지를 보낼 수 없습니다!");
             	 $("#message-modal").modal("hide");
             	 return false;
              }
              else{
                 return true;
              }
           },
           success : function(result, status, xhr) {
              if (result) {
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

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
mapOption = { 
    center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 

var imageSrc = '/resources/img/gatherboard/dog.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(54, 50), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var imageSrc = '/resources/img/gatherboard/dog.png', // 마커이미지의 주소입니다    
imageOption = {offset: new kakao.maps.Point(27, 45)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
overlay.setMap(null);     
}

//검색된 마커들 위치로 지도를 재조정
function setBounds(){
	map.setBounds(bounds);
}