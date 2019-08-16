<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setHeader("Cache-Control", "no-store"); 
 response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Search Hospital</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css">
	<!-- 평점 별  -->
	
	<link rel="stylesheet" href="/resources/css/hospital/main_search.css">
	<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
	<script src="/resources/js/region.js"></script>
	
	
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<body>
	<div id="all">
		<%@ include file="/WEB-INF/views/commons/top.jspf"%>
	
	
	
	<div class="container" id="totalHtml">

		<div class="container">
			<div class="row">
				<div class="col-md-12" style="background-color: #38A7BB;">
					<div class="card-body">
						<div class="row pb-2">
							<div class="col-md-12">
								<h4>Search Hospital</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<select id="region" onchange="categoryChange(this)" class="form-control">
										<option value="0">지역</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="강원">강원</option>
                                    <option value="대전">대전</option>
                                    <option value="세종">세종</option>
                                    <option value="충남">충남</option>
                                    <option value="충북">충북</option>
                                    <option value="부산">부산</option>
                                    <option value="울산">울산</option>
                                    <option value="경남">경남</option>
                                    <option value="경북">경북</option>
                                    <option value="대구">대구</option>
                                    <option value="광주">광주</option>
                                    <option value="전남">전남</option>
                                    <option value="전북">전북</option>
                                    <option value="제주">제주</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<select id="sml_region" class="form-control">
										<option value="0" selected>시 / 군 / 구</option>
									</select>
								</div>
							</div>

							<input id="emergency" type="checkbox"> 응급진료
							<img src="/resources/img/placeholder_red.png" style="width: 35px;height: 35px;">
							<div class="col-md-3">
								<button type="button" id="hos_search" class="btn btn-primary btn-block" style="background-color: gray;">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<br>

		<!-- 지도 화면 시작-->
				<div class="container">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					</div>
					<br>
					<!-- 지도 화면 끝 -->
					<div id="content">
						<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="hospital_list">
											<h2>PET Hospital List</h2>
										</div>
										
										<p class="lead"></p>
										<div class="row text-center" id="hospList">
											
											
										</div>
										<!-- 번호   -->
										<div aria-label="Page navigation" class="d-flex justify-content-center">
											<ul class="pagination" id="paging">
												
           									</ul>
       									 </div>
									</div>
								</div>				
							</div>
						</div>
					</div>
				</div>
		</div>
	<!-- /////////////////////////////////// 지  도  //////////////////////////////////////// -->
	<!-- Javascript files-->
	<script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script src="/resources/js/hospital/hospital.js"></script>
	<script src="/resources/js/hospital/star.js"></script>
	
	<script>
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
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker();
	// 마커를 담을 배열입니다
	var markers = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map, marker,name,address_name,hours,score) {
		
		var content = '<div class="bAddr"><span class="title">' + name + '</span><div>주소 : '+address_name+'</div><div>진료시간 : '+hours+'</div>';
			content += '<div><span class="star-rating-40"style="text-align:left;">';
			content += '<span style ="width:'+(score*10.0)+'%"></span>';
			content += '</span><span class="title" style="display:inline-block;">'+score+'</span></div></div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	function clickInfowindow(map, marker, name,fa,ga){
		var iwContent = '<div style="padding:5px;">'+name+' <br><a href="https://map.kakao.com/link/map/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">길찾기</a></div>';
		 infowindow= new kakao.maps.InfoWindow({
		        position : new kakao.maps.LatLng(ga, fa), 
		        content : iwContent 
		    });
		    
		    infowindow.open(map,marker);
	}
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	// 마커를 찍는 함수
	function createMarker(fa,ga, imgsrc,name,addr,hours,score){
		
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
	    
	   
	  //마커 클릭시 병원이름, 병원주소가 나오는 클릭이벤트.
		kakao.maps.event.addListener(marker, 'mouseover',function(){
			displayInfowindow(map, marker,name,addr,hours,score);
		});
		kakao.maps.event.addListener(marker, 'mouseout',function(){
			//infowindow.close();
		});
		kakao.maps.event.addListener(marker, 'click',function(){
			infowindow.close();
			clickInfowindow(map,marker,name,fa,ga);
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
	//페이지 버튼 클릭 이벤트
	function pageClick(page){
		gethospital(region, $('#emergency').prop('checked') ,page);
	}
	//-- check hash
	function checkForHash() {	
		//뒤로가기를 했으면
		if(document.location.hash)
		{
		//hash 가 있다면 ^ 를 구분자로 하나씩 string을 추출하여 각각 페이지정보를 가져옵니다.
			var str_hash = document.location.hash;
			str_hash = str_hash.replace("#","");
			var back=str_hash.split("^");
						
			// 지역 변수에 뒤로가기전에 검색했던 지역을 저장
			region = back[0];
			//지역구 셀렉트박스 다시 불러오는 함수.
			setSelectbox($('#region').val());
			//지역 시/구/군 카테고리 값을 뒤로가기 하기전의 값으로 받아옴
			$('#sml_region').val(decodeURI(back[0]));
			//ajax콜 날릴 함수
			gethospital(back[0],$('#emergency').prop('checked'),back[1]);
		} 
		else 
		{
			//nothing..asdfsadfsadfsfad
		}
	}

	</script>
	<script>
	$(document).ready(function(){
		
		//-- 문서가 로드 될때마다 hash 체크  뒤로가기를 위한 함수
		checkForHash();

		//--click 이벤트를 걸어 이벤트가 발생할때마다 현재 페이지를 내부링크처럼 hash에 저장해둡니다.
		
		
		

		$('#hos_search').click(function(event){
			if($('#sml_region').val()=="0" || $('#region').val()=="0" ){
				
				alert('지역을 선택해 주세요.');
			}
			else{
				region = $('#sml_region').val();
				gethospital(region,$('#emergency').prop('checked') ,1);
			}
		});
	});
	//$('#sml_region') 지역구 카테고리로 검색하고 병원리스트 가져오는 함수.
	function gethospital(addr, isEmer,page){
		//마커의 정보창 닫아주기
		//console.log('gethospital');
		infowindow.close();
		$('#hospList').empty();
		$('#paging').empty();
		 $.ajax({
			url:'/hospital/search/'+addr+'/'+isEmer+'/'+page,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				//console.log(page);
				
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
				//console.log(data.length);
				//좌표 객체 초기화
				bounds = new kakao.maps.LatLngBounds(); 
				$.each(data.totalList, function(index, item){
					//console.log(data.scorelist.length);
					//console.log(data.scorelist[0]);
					//console.log(item.hospital_name);
					geocoder.addressSearch(item.hospital_addr, function(result, status){
						
				        //응급지료가능 병원일경우 마커 이미지교체
				        if(item.isEmergency == 1){
				    		 createMarker(result[0].x, result[0].y, "/resources/img/placeholder_red.png",item.hospital_name, item.hospital_addr ,item.hospital_hours,data.totalScoreList[index]);
				        }
				        else{
				        	
							/* //새로운 마커를 찍음						
							var marker = new kakao.maps.Marker();
							//마커 위치설정
							marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
							//마커 찍음
							marker.setMap(map); */
				        	// 마커 이미지의 이미지 크기 입니다
				     		createMarker(result[0].x, result[0].y,"/resources/img/placeholder.png",item.hospital_name, item.hospital_addr ,item.hospital_hours,data.totalScoreList[index]);
				        }
						
						// LatLngBounds 객체에 좌표를 추가합니다
					    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
						
						//console.log('index='+index);
						//표시된 마커들로 지도를 재조정하는 함수
						setBounds();
						
					});
				});
				$.each(data.hospitalList, function(index,item){
					
						//병원 리스트 지도 밑에 출력
						var output='';
						output += '<div data-animate="fadeInUp" class="col-md-3">';
						output += '<div class="team-member">';
						output += '<div class="image">';
						output += '<a href="/hospital/'+item.id+'"name="link">';
						var imglist = item.hospital_img.split(",");
						output += '<img src="/resources/img/hospital/'+imglist[0]+'" alt="" class="img-fluid rounded-circle" style="height: 250px; width:250px;"></a>';
						output += '</div>';
						output += '<h4 style="font-size: 25px;">';
						output += '<a href="/hospital/'+item.id+'"name="link">'+item.hospital_name+'</a></h4>';
						output += '<span class="star-rating"style="text-align:left;">';
						output += '<span style ="width:'+(data.scoreList[index]*10.0)+'%"></span>';
						output += '</span>';
						output += '<div class="text">';
						output += '<div>'+item.hospital_addr+'</div>';
						output += '<div>'+item.hospital_phone+'</div>';
						output += '</div></div></div>';
						$('#hospList').append(output);
						
						//병원 상세보기를 클릭했을때 발생하는 이벤트
						$('a[name=link]').click(function(e) {
							//상세보기를 눌렀을때의 페이지
							var currentPage=page;
													

							//상세보기를 누르기 전에 불러왔던 페이지 정보와 지역정보를 hash에 저장
							document.location.hash = "#" + region + "^"+currentPage;

						});
				});
						
						
				
			
				//페이징 처리 반복문
				for(var i = data.paging.startPage; i<=data.paging.endPage; i++){
					var output='';
					if(i == data.paging.startPage){
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+1+')"> <i class="fa fa-angle-double-left"></i></a></li>';
						if(page != 1){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page-1)+')"> <i class="fa fa-angle-left"></i></a></li>';
						}
					}
					output += '<li class="page-item"id="page'+i+'"><a href="#" class="page-link" onclick="pageClick('+i+');">'+i+'</a></li>';
					if(i == data.paging.endPage){
						if(page != data.paging.realEnd){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page+1)+')"> <i class="fa fa-angle-right"></i></a></li>';
						}
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+data.paging.realEnd+')"> <i class="fa fa-angle-double-right"></i></a></li>';
					}
					$('#paging').append(output);
					$("#page"+page).attr('class','page-item active');
				}
				
				
				
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		 });
		//window.location.href = "/hospital/search"+"?"+$.param({"hospital_addr":addr});
	}
	
	</script>
	
</body>
</html>