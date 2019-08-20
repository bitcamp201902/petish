<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*, java.sql.*, java.text.*,
				 com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO,
				 com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO"%>

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
<link href="/resources/css/gatherboard/dropdown.css" rel="stylesheet">       
</head>

<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif; letter-spacing: 1px;">
	<div id="all">		
	<%@ include file="/WEB-INF/views/commons/dog_top.jspf" %>
		<div class="content-fluid body-section">
<%
      //접속 아이디
      Long userID = null;
      String userNickName = "";
       if(loginedUser != null){
          userID = loginedUser.getId();
          userNickName = loginedUser.getNickname();
       }
%>
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
				<ul id="pills-tab" role="tablist" class="nav nav-justified" style="margin-top: 1cm;">
					<li class="nav-item" id="writing">
						<a id="pills-profile-tab" data-toggle="pill" href="/dog/gatherboard" role="tab"
						aria-controls="pills-profile" aria-selected="false"
						class="nav-link active">게시판으로 보기</a></li>
					<li class="nav-item" id="commented">
						<a onclick="mapListClick()"
						data-toggle="pill" href="/dog/gatherboard/mapList" role="tab"
						aria-controls="pills-home" aria-selected="true" class="nav-link">지도로 보기</a></li>
				</ul>
	
				<div id="pills-tabContent" class="tab-content">
					<div id="writingList" role="tabpanel"
						aria-labelledby="pills-home-tab"
						class="tab-pane fade show active">
															
				<button type="submit" class="btn btn-template-outlined write-button" onclick="writeFormClick();">
					<a id="write-btn">글쓰기</a>
				</button>
		<!-- 검색 -->		
		<form id="categoryForm" action="/dog/gatherboard" method="post">		
			<div id="top-category" aria-label="Page navigation example" class="d-flex justify-content-left">
				<!-- 상단 카테고리 -->
					<div class="col-md-2 col-lg-2">
						<div class="form-group">
							<select id="region-category" class="form-control region-category" onchange="regionSearch()">
								<option value="">지역</option>
								<option value="서울">서울</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="세종">세종</option>
								<option value="경기">경기</option>
								<option value="강원">강원</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경남">경남</option>
								<option value="경북">경북</option>
								<option value="제주">제주</option>
							</select>
							
						</div>
					</div>
			
					<div class="col-md-2 col-lg-2 test">
						<div class="form-group">
							<select id="size-category" class="form-control" onchange="sizeSearch()">
								<option value="">크기</option>
								<option value="소">소형견</option>
								<option value="중">중형견</option>
								<option value="대">대형견</option>
							</select>
						</div>
					</div>
				</div>					
				<!-- 지역/크기 별 검색 -->
				<input type="hidden" name="type" value="R">
				<input type='hidden' name='keyword' id="categoryKeyword"
                       value='<c:out value="${pageMaker.cri.keyword}"/>' class="form-control"/>
			</form>	
			<!-- 상단 카테고리 끝 -->								
			<!-- 검색 끝 -->
					<div id="customer-order" class="col-lg-20">	
						<table class="table">
								<tr>
									<th width="110px" class="MoblieViewNumber border-top-0">번호</th>
									<th width="110px" class="MoblieViewNumber border-top-0">상태</th>
									<th width="70px" class="MoblieViewRegion border-top-0">지역</th>
									<th width="120px" class="test border-top-0">크기</th>
									<th width="550px" class="MoblieViewText border-top-0" colspan="10">제목 </th>
									<th width="100px" class="MoblieViewWriter border-top-0">작성자</th>
									<th width="130px" class="test border-top-0">작성일자</th>
									<th width="90px" class="test border-top-0">조회</th>
								</tr>
								
   								<c:forEach items="${list}" var="board">	
								<tr>
									<td><c:out value="${board.ID}" /></td>
								<!-- 정모 진행 상태 -->
								<c:choose>	
									<c:when test="${board.GATHERING_STATE == 0}">
										<td><button type="button" class="row btn btn-sm btn-default" id="participant-state-btn">신청마감</button></td>
									</c:when>
									<c:otherwise>
										<td><button type="button" class="row btn btn-sm btn-template-main" id="participant-state-btn">신청가능</button></td>
									</c:otherwise>
								</c:choose>	
									<td><c:out value="${board.REGION_NAME}" /></td>
									<td class=test><c:out value="${board.DOG_SIZE}" />형견</td>
									<td colspan="10">
										<a id="title" href="#" onclick="detailClick(<c:out value="${board.ID}" />)">
										<c:out value="${board.TITLE}" /><span class="badge badge-secondary comment-count"><c:out value="${board.COMMENT_COUNT}" /></span> </a>
									</td>
							 		 <td>
								        <div class="nav navbar-nav ml-auto">
								           <div class="showMemberDropMenu"><c:out value="${board.NICKNAME}" />
								           <div class="member_dropMenu">
								                <a href="/member/detail/${board.USER_ID}" class="nav-link">게시글보기</a>
								                <a href="#" id="message-btn" class="nav-link" data-toggle="modal" onclick="messageClick('${board.USER_ID},${board.NICKNAME}')">쪽지보내기</a>
								           </div>
								        </div>
								        </div>
							    	</td>
									<td class=test><c:out value="${board.CREATED_DATE}" /></td>
									<td class=test><c:out value="${board.VIEW_COUNT}" /></td>
								</tr>
   								</c:forEach>
						</table>
					</div>
				</div>
	           <!-- 페이징  -->
               <div aria-label="Page navigation example"
                  class="d-flex justify-content-center">
                  <ul class="pagination">
                     <c:if test="${pageMaker.prev }">
                        <li class="page"><a href="${pageMaker.startPage-1 }"
                        	class="page-link"> <i class="fa fa-angle-double-left"></i></a></li>
                     </c:if>

                     <c:forEach var="num" begin="${pageMaker.startPage }"
                        end="${pageMaker.endPage }">
                        <li class="page ${pageMaker.cri.pageNum == num ? "active" : ""}">
                           <a href="${num}" class="page-link">${num}</a>
                        </li>
                     </c:forEach>

                     <c:if test="${pageMaker.next }">
                        <li class="page"><a href="${pageMaker.endPage+1 }"
                            class="page-link"> <i class="fa fa-angle-double-right"></i></a></li>
                     </c:if>
                  </ul>
               </div>		
			<form id="searchForm" action="/dog/gatherboard" method="post">
				<div id="top-category" aria-label="Page navigation example" class="d-flex justify-content-center">
					<div class="col-md-2 col-lg-2 list">
						<div class="form-group">
							<div class="input-group">						
								<select name="type" id="state" class="form-control">
                                	<option value="T"
                                				<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                                	<option value="C"
                                				<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>	
                                	<option value="W"
                                				<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                                	<option value="TC"
                                				<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 + 내용</option>
								</select>
                        	</div>
						</div>
					</div>					
					<div class="panel panel-default sidebar-menu">
						<div class="panel-body">
							<div class="input-group">	
								<input type='text' id="search-message" name='keyword' class="form-control" placeholder="검색어를 입력해주세요"/>
                                	<span class="input-group-btn">
                                <button type="submit" class="btn btn-template-main" id="search-btn"><i class="fa fa-search"></i></button></span>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- POST 방식으로 pageNum 전송 -->
			<form id='actionForm' action="/dog/gatherboard" method='post'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
			</form>
		    	   <!-- 쪽지 보내기 모달창 -->
		    	   <div id="message-modal" tabindex="-1" role="dialog" aria-hidden="true"
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
		    	                <form id="message_form" method="POST">		    	                   
		    	                  <input type="hidden" name="messageSender_id" id="sender_id" value="<%=userID%>">
		    	                   <input type="hidden" name="messageReceiver_id" id="receiver_id" value="">		    	                
		    	                    <div class="form-group">
		    	                        <label>받는사람</label>
		    	                        <input class="form-control" name='messageNickname' value="" readonly>
		    	                    </div>
		    	                    <div class="form-group">
		    	                        <label>제목</label>
		    	                        <input class="form-control" name='messageTitle'>
		    	                    </div>
		    	                    <div class="form-group">
		    	                        <label>내용</label>
		    	                        <textarea id="message_content" name='messageContent' rows="10" class="form-control"></textarea>
		    	                    </div>
		    	                    <p class="text-center">   
		    	                        <input type="submit" value="보내기" id="modalSendBtn" class="btn btn-outline-primary">
		    	                    </p>
		    	                </form>
		    	                </div>
		    	            </div>
		    	        </div>
		    	    </div>
		    	    <!-- 쪽지 모달 끝 -->		   							
				    </div>
				</div>                      
			</div>
		</div>
	</div>
		<script src="/resources/js/gatherboard/list.js"></script>
		<script>
		function messageClick(user) {
			var msg = user.split(",");
			var userID = msg[0];
			var userNickName = msg[1];
	        <% if(loginedUser == null){ %>
	            alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
	            $('#login-modal').modal("show");	              
	        <%} else{%>         
				var actionForm = $("#message_form");
				actionForm.find("input[name='messageReceiver_id']").val(userID);
				actionForm.find("input[name='messageNickname']").val(userNickName);
				
			    $(this).attr('data-target',"#message-modal");
			    $('#message-modal').modal("show");	
	  	    <%}%>
		}
		</script>

</body>
</html>