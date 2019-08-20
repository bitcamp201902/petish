<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*, java.sql.*, java.text.*,com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO,com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO" %>
<%
	Long REGION_ID = (Long)request.getAttribute("REGION_ID");
%>
<!DOCTYPE html>
<html>
<head>
<title>강아지 정모게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link href="/resources/css/fonts.css" rel="stylesheet">
<link href="/resources/css/gatherboard/list.css" rel="stylesheet">      
<link rel="stylesheet" href="/resources/css/gatherboard/kakaomap.css">
</head>

<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif; letter-spacing: 1.5px; font-weight:1">
	<div id="all">		
		<%@ include file="/WEB-INF/views/commons/dog_top.jspf" %>
		<div class="content-fluid body-section">
			<div id="heading-breadcrumbs">
				<div class="container">
					<div class="row d-flex align-items-center flex-wrap">
						<div class="col-md-12">
							<h1 class="h2">강아지 정모게시판</h1>
							<hr>
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
						<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item" id="commented">
								<a id="commented" data-toggle="pill" href="/dog/gatherboard" role="tab" onclick="viewBoardList()"
								aria-controls="pills-home" aria-selected="true" class="nav-link">게시판으로 보기</a></li>
							<li class="nav-item" id="writing">
								<a id="pills-profile-tab" data-toggle="pill" href="/dog/gatherboard/mapList" role="tab"
								aria-controls="pills-profile" aria-selected="false" 
								class="nav-link active" onclick="mapListClick()">지도로 보기</a></li>
						</ul>						
					<div id="pills-tabContent" class="tab-content">
						<div role="tabpanel" aria-labelledby="pills-home-tab" class="tab-pane fade show active">																		
							<button type="submit" class="btn btn-template-outlined map-write-button" onclick="writeFormClick();">
								<a id="write-btn">글쓰기</a>
							</button>
						<!-- 검색 -->		
						<form id="categoryForm" action="/dog/gatherboard" method="post">		
							<div id="top-category" aria-label="Page navigation example" class="d-flex justify-content-left">
								<!-- 상단 카테고리 -->
								<div class="col-md-2 col-lg-2">
									<div class="form-group">
										<select id="region-category" class="form-control region-category" onchange="regionSearch()">
											<option value=0>지역</option>
											<option value=1>서울</option>
											<option value=2>경기</option>
											<option value=3>인천</option>
											<option value=4>강원</option>
											<option value=5>대전</option>
											<option value=6>세종</option>
											<option value=7>충남</option>
											<option value=8>충북</option>
											<option value=9>부산</option>
											<option value=10>울산</option>
											<option value=11>경남</option>
											<option value=12>경북</option>
											<option value=13>대구</option>
											<option value=14>광주</option>
											<option value=15>전남</option>
											<option value=16>전북</option>
											<option value=17>제주</option>
										</select>										
									</div>
								</div>
								<!-- 주변 정모 보기 -->		
								<label class="switch">
								  <input type="checkbox" id="chk" checked>
								  <span class="slider round"></span>
								</label>
								<p id="on-off-str">주변 정모 보기</p><p id="on-off-str" style="display:none;">주변 정모 보기</p>		
							</div>					
								<!-- 지역/크기 별 검색 -->
								<input type="hidden" name="type" value="R">
								<input type='hidden' name='keyword' id="categoryKeyword"
				                 value='<c:out value="${pageMaker.cri.keyword}"/>' class="form-control"/>
							</form>	
						<!-- 상단 카테고리 끝 -->								
						<!-- 검색 끝 -->
						<div id="content">
							<div class="container" id="viewMapList">
						      <div class="bar">
								<div class="col-md-12" id="map">		
									<div id="map" aria-label="Page navigation example" class="d-flex justify-content-left"></div>
										<form name="region-form" id="region-form">
											<input type="hidden" name="REGION_ID" value="<%=REGION_ID%>" />	
										</form>
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
	<!-- include list.js -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	<script>
	var regionID = <%=REGION_ID%>;
	</script>
	<script src="/resources/js/gatherboard/list.js"></script>
	<script src="/resources/js/gatherboard/mapList.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</body>
</html>