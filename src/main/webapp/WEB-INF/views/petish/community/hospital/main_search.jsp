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
	<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<body style="font-family: 'Do Hyeon', sans-serif;">
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
	<script src="/resources/js/hospital/hospital.js?ver=2"></script>
	<script src="/resources/js/hospital/star.js"></script>
	
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
	</script>
	
</body>
</html>