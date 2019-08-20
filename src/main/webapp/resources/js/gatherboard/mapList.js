$(document).ready(function(){
	var check = $("input[type='checkbox']");
	var chk = document.getElementById('chk');

	check.click(function(){
	  $("p").toggle();
	  userRegionMap(regionID);
	  //주변 정모 보지않을 경우
	  if(chk.checked == false){
		  userRegionMap(1);
	  }
	});
	
	regionList();
});

//지역 리스트
function regionList() {
	var params = $("#region-form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	$.ajax({
		url:'/dog/gatherboard/searchMap',
		type:'GET',
		data: params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(data){
			//console.log(page);
			
			// 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
			//console.log(data.length);
			//좌표 객체 초기화
			bounds = new kakao.maps.LatLngBounds(); 
			$.each(data, function(index, item){
				//console.log(data.scorelist.length);
				//console.log(data.scorelist[0]);
				//console.log(item.hospital_name);
				geocoder.addressSearch(item.gathering_ADDRESS.split("　")[0], function(result, status){

						/* //새로운 마커를 찍음						
						var marker = new kakao.maps.Marker();
						//마커 위치설정
						marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
						//마커 찍음
						marker.setMap(map); */
			        	// 마커 이미지의 이미지 크기 입니다
			     		createMarker(result[0].x, result[0].y,"/resources/img/gatherboard/dog.png",item.id,item.title,item.gathering_ADDRESS, item.GATHERING_DATE);
			      
					
					// LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
					
					//console.log('index='+index);
					//표시된 마커들로 지도를 재조정하는 함수
					setBounds();
					
				});
			});

					
		},
		error:function() {
			alert("ajax 통신 실패!");
		}
	});
}


function regionSearch() {
	var region = document.getElementById('region-category');
	var regionForm = $("#region-form");
	if(!(region.value == "" || region.value == null)) {
		
		regionForm.find("input[name='REGION_ID']").val(region.value);
		regionList();
		
		$("input[type=checkbox]").prop("checked", false);
	}
}

function userRegionMap(regionID) {
	var regionForm = $("#region-form");
	regionForm.find("input[name='REGION_ID']").val(regionID);
	regionList();
}

function viewBoardList() {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})	
}

//지역 시/군 을 저장할 변수
var region = '';

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

// 마커를 담을 배열입니다
var markers = [];

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds(); 

var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(map,marker,id,title,address_name,hours,fa,ga) {
	var addr1 = address_name.split("　")[0];
	var addr2 = address_name.split("　")[1];
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap" id="overlay'+id+'">' + 
	            '    <div class="info">' + 
	            '        <div class="title"><a href="/dog/gatherboard/'+id+'" style="background-color:#8ed2be;color:#fff;"><i class="fas fa-plus-circle" style="margin-right:5px;"></i>' + title + '</a>' + 
	            '            <div class="close" id="close'+id+'" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div style="padding:8px;">' + 
	            '                <div class="ellipsis">장소 : '+ addr1
	            if(!(addr2 == null || addr2 == "")) {
	            	content += " " + addr2 
	            }
	            	content += '</div>' +  
	            '                <div class="ellipsis">일시 : '+ hours +'</div>' + 
	            '                <div class="jibun ellipsis text-center" style="margin-top:10px;">' +
	            '                  <button class="btn btn-template-outlined btn-sm" id="map-btn"><a id="btnStr" href="https://map.kakao.com/link/map/'+addr1+','+ga+','+fa+'" style="target="_blank">큰지도</a></button>' +
	            '                  <button class="btn btn-template-outlined btn-sm" id="map-btn"><a id="btnStr" href="https://map.kakao.com/link/to/'+addr1+','+ga+','+fa+'" style="target="_blank">길찾기</a></button>'+	
	            '                </div>' + 
	            '                <div></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';		
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});		    
      
    overlay.setMap(map);
    
    $("#close"+id+"").click(function() {
    	closeOverlay(id);
    })
}

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay(id) {
	$("#overlay"+id+"").remove();
}


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
// 마커를 찍는 함수
function createMarker(fa,ga,imgsrc,id,title,addr,hours){
	
	// 마커 이미지의 이미지 크기 입니다
	   var imageSize = new kakao.maps.Size(35, 35); 
	// 마커 이미지를 생성합니다    
  	  var markerImage = new kakao.maps.MarkerImage(imgsrc, imageSize);
 	// 마커를 생성합니다
 	
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(ga, fa),
        image : markerImage // 마커 이미지 
    });
    
  //마커 클릭시 해당 정모의 정보가 나오는 이벤트
	kakao.maps.event.addListener(marker, 'mouseover',function(){
		//displayInfowindow(map,marker,id,title,addr,hours);
	});
	kakao.maps.event.addListener(marker, 'mouseout',function(){
		//infowindow.close();
	});
	kakao.maps.event.addListener(marker, 'click',function(){
		displayInfowindow(map,marker,id,title,addr,hours,fa,ga);
	});
	
  //마커 배열에 현재마커를 추가
	markers.push(marker);
}
	
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
//var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//검색된 마커들 위치로 지도를 재조정
function setBounds(){
	map.setBounds(bounds);
}