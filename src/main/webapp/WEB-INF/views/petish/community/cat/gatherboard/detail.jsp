<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>서울숲에서 만나요</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="/resources/img/apple-touch-icon.png">
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
<link href="/resources/css/commons/kakaomap.css" rel="stylesheet">
<link href="/resources/css/gatherboard/detail.css" rel="stylesheet">

</head>
<body>
	<div id="all">
	
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">고양이 정모게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				
					<!-- LEFT COLUMN _________________________________________________________-->
					<div id="blog-post" class="col-md-13">
						<button class="write btn btn-template-outlined">
						<a href="/cat/gatherboard/writeForm">
						글쓰기
						</a>
						</button>
						<button class="list btn btn-template-outlined">
							<i class="fa fa-align-justify"></i> <a href="/cat/gatherboard/list">목록</a>
						</button>
					
						<div class="panel-heading">
							<h2 class="h3 panel-title">서울숲에서 만나요</h2>
						</div>



							<table>
						
								<tr>
									<td><img src="/resources/img/blog-avatar2.jpg" alt=""
										class="main img-fluid rounded-circle"></td>
									<td class=name>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown">Pet</a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
											</div>
										</div>
									</td>

									<td class=grade>준회원</td>
									<td class=date>2019-07-01 23:02:53</td>
									<td class=view><i class="fa fa-eye"></i>130186321</td>
									<td class=like><a href="#" class="btn btn-template-outlined"><i
											class="fa fa-heart-o"></i>13</a></td>
								</tr>

						</table>

						<hr size="10px">
						<div class="heading">
						<button class="btn btn-template-outlined" type="button" data-toggle="modal" data-target="#myLargeModal">
							<i class="fa fa-sign-in"></i> 신청
						</button>
						
						<button type="button" class="btn btn-template-outlined" data-toggle="modal" data-target="#mySmallModal">
							<i class="fa fa-users"></i>신청목록
						</button>
							<h3>참여 현황</h3>
						
						
						</div>

						<h4>
							<span class="h1 counter">15</span> / 30명
						</h4>

						
						<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">신청</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
										반려묘 종
										<div class="form-group">
										
											<select id="state" class="form-control">
												<option>종 선택</option>
												<option>오드아이</option>
												<option>노령 고양이</option>
												<option>코리안 숏헤어</option>
												<option>믹스 고양이</option>
												<option>페르시안</option>
												<option>터키쉬 앙고라</option>
												<option>러시안 블루</option>
												<option>샴</option>
												<option>스코티쉬 폴드</option>
												<option>뱅갈</option>
												<option>아메리칸 숏헤어</option>
												<option>노르웨이 숲</option>
												<option>랙돌</option>
												<option>브리티쉬 숏헤어</option>
												<option>먼치킨</option>
												<option>아비시니안</option>
												<option>스핑크스</option>
												<option>기타</option>
											</select>
										</div>
										신쳥 내용
										<textarea id="comment" rows="6" cols="60" class="form-control"></textarea>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-template-outlined" data-dismiss="modal" data-dismiss="modal">확 인</button>
										<button type="button" class="btn btn-template-outlined" data-dismiss="modal" data-dismiss="modal">취 소</button>
									</div>
								</div>
							</div>
						</div>


						<div class="modal fade" id="mySmallModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">신청 목록</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<P>총원 : 5명</P>
										<P></P>
										<P>
											<i class="fa fa-user"></i>Pet
										</P>
										<P>
											<i class="fa fa-user"></i>Pet1
										</P>
										<P>
											<i class="fa fa-user"></i>Pet2
										</P>
										<P>
											<i class="fa fa-user"></i>Pet3
										</P>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

					
						
						<div id="post-content">
						
					
							<h2>모임 안내</h2>
							<blockquote class="blockquote">
								<p>모임 일시 : 2019년 7월 29일</p>
									
									<p>장소 : 서울 서초구 서초동 서울숲</p>
									<p>반려견 대상 : 오드아이</p>
								
							</blockquote>

			
						<div class="map_wrap">
								<div id="map" style= "width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
								<div id="menu_wrap" class="bg_white">
									<div class="option">
										<div>
											<form onsubmit="searchPlaces(); return false;">
											<input type="text" value="서울숲" id="keyword" size="15">
											<button type="submit">검색하기</button>
											</form>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
							</div>
						
						
						
						
						
					<div id="comments">




							<h4 class="text-uppercase">댓글 수 2</h4>
							<section class="bar bg-gray mb-0">
								<div class="row comment">
									<div class="col-sm-3 col-md-2 text-center-xs">
										<p>
											<img src="/resources/img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle">
										</p>
									</div>
									<div class="col-sm-9 col-md-10">
										<h5 class="text-uppercase">Julie Alma</h5>
										<p class="posted">
											<i class="fa fa-clock-o"></i> 2019-07-03 09:24:26
										</p>
										<p>안녕하세요.반갑습니다.</p>

									</div>
								</div>
								<div class="row comment last">
									<div class="col-sm-3 col-md-2 text-center-xs">
										<p>
											<img src="/resources/img/blog-avatar.jpg" alt=""
												class="img-fluid rounded-circle">
										</p>
									</div>
									<div class="col-sm-9 col-md-10">
										<h5 class="text-uppercase">Louise Armero</h5>
										<p class="posted">
											<i class="fa fa-clock-o"></i> 2019-07-03 09:25:23
										</p>
										<p>안녕하세요</p>

									</div>
								</div>
							</section>
						</div>

						<div id="comment-form">
							<h4 class="text-uppercase">댓글</h4>
							<form>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="name">아이디<span
												class="required text-primary">*</span></label> <input id="name"
												type="text" class="form-control">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">내 용 <span
												class="required text-primary">*</span></label>
											<textarea id="comment" rows="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button class="re btn btn-template-outlined">
											<i class="fa fa-comment-o"></i> 댓글 등록
										</button>
								

										<nav aria-label="Page navigation example" class="d-flex justify-content-left">
											<button type="submit" class="btn btn-template-outlined">
												<i class="fa fa-pencil"></i><a href="/cat/gatherboard/modifyForm">수정</a>
											</button>
											<button type="submit" class="btn btn-template-outlined">
												<i class="fa fa-trash-o"></i>삭제
											</button>
										</nav>

										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" id="report-btn">신고
										</button>

										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h3 class="modal-title" id="myModalLabel">신고</h3>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
												
													<div class="modal-body">
														<table>
															<tr>
																<td>신고 분류</td>
																<td>
																	<div class="form-group">
																		<select id="state" class="form-control">
																			<option>부적절한 게시글</option>
																			<option>도배 게시글</option>
																			<option>광고 목적 게시글</option>
																			<option>기타</option>
																		</select>
																	</div>
																</td>
															<tr>
																<td>내용</td>
																<td><textarea id="comment" rows="4" cols="40" class="form-control"></textarea></td>
															</tr>
															<tr></tr>
															<tr>
																<td></td>
																<td>
																<button type="button"class="btn btn-template-outlined" data-dismiss="modal">확인</button>
																<button type="button" class="btn btn-template-outlined"data-dismiss="modal">취 소</button></td>
															</tr>
														</table>
														
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
				<div class="col-md-3"></div>
	

	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script	src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script	src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];
	
		var mapContainer = document
				.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826,
					126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
	
		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer,
				mapOption);
	
		var marker = new daum.maps.Marker()
	
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
	
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});
	
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
	
		// 키워드로 장소를 검색합니다
		searchPlaces();
	
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
	
			var keyword = document
					.getElementById('keyword').value;
	
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
	
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}
	
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status,
				pagination) {
			if (status === daum.maps.services.Status.OK) {
	
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
	
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
	
			} else if (status === daum.maps.services.Status.ZERO_RESULT) {
	
				alert('검색 결과가 존재하지 않습니다.');
				return;
	
			} else if (status === daum.maps.services.Status.ERROR) {
	
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
	
			}
		}
	
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
	
			var listEl = document
					.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';
	
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
	
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
	
			for (var i = 0; i < places.length; i++) {
	
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(
						places[i].y, places[i].x), marker = addMarker(
						placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
	
				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					daum.maps.event.addListener(marker,
							'mouseover', function() {
								displayInfowindow(
										marker, title);
							});
	
					daum.maps.event.addListener(marker,
							'mouseout', function() {
								infowindow.close();
							});
	
					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};
	
					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);
	
				fragment.appendChild(itemEl);
			}
	
			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
	
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	
		//검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
	
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>'
					+ places.place_name + '</h5>';
	
			if (places.road_address_name) {
				itemStr += '<form action="boardForm.do" method="post">'
						+ '<span>'
						+ places.road_address_name
						+ '</span>'
						+ '   <span class="jibun gray">'
						+ places.address_name
						+ '</span>'
						+ ' <input type="hidden" name="addr" value="'+places.address_name+'"   >'
						+ ' <input type="hidden" name="addr2" value="'+places.place_name+'"    >'
						+ '</form>';
			} else {
				itemStr += '<form action="boardForm.do?addr='
						+ places.address_name
						+ '" method="post">'
						+ '    <span>'
						+ places.address_name
						+ '</span>'
						+ ' <input type="hidden" name="addr" value="'+places.address_name+'"   >'
						+ ' <input type="hidden" name="addr2" value="'+places.place_name+'"    >'
						+ '</form>';
			}
	
			itemStr += '  <span class="tel">'
					+ places.phone + '</span>'
					+ '</div>';
	
			el.innerHTML = itemStr;
			el.className = 'item';
	
			return el;
		}
	
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0,
						(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(
					imageSrc, imageSize, imgOptions), marker = new daum.maps.Marker(
					{
						position : position, // 마커의 위치
						image : markerImage
					});
	
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
	
			return marker;
		}
	
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
	
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document
					.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;
	
			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl
						.removeChild(paginationEl.lastChild);
			}
	
			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;
	
				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}
	
				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}
	
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">'
					+ title + '</div>';
	
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}
	
		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	
		daum.maps.event.addListener(map, 'click', function(mouseEvent, result) {
			searchDetailAddrFromCoords(
				mouseEvent.latLng,
				function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						var message = result[0].address.address_name
						var resultDiv = document
								.getElementById('clickLatlng');
						resultDiv.value = message;
						marker
								.setPosition(mouseEvent.latLng);
						marker
								.setMap(map);
					}
				});
		});
	
		function searchDetailAddrFromCoords(coords,
				callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(),
					coords.getLat(), callback);
	
		}
	</script>
</body>
</html>