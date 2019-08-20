<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat,
				com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO,
				com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO,
				com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO,
				com.community.petish.community.user.dto.response.LoginedUser" %>

<%
	DogGatherPostVO post = (DogGatherPostVO)request.getAttribute("post");
	LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");

	String strCreatedDate = post.getCREATED_DATE()+"";
	String strUpdatedDate = post.getUPDATED_DATE()+"";
	String addr = post.getGATHERING_ADDRESS();
	String writer = (String)request.getAttribute("writer");
	String writerImg = (String)request.getAttribute("writerImg");
	String userName = user.getUsername();
	Long userID = user.getId();
	String userNickName = user.getNickname();
	Long boardId = 2L;
	
	//DogSize
	Long sizeID = (Long)request.getAttribute("sizeID");
	String size = "";
	if(sizeID == 1L) {
		size = "소";
	}
	else if(sizeID == 2L) {
		size = "중";
	}
	else if(sizeID == 3L) {
		size = "대";
	}
	
	//정모 참여자 - DTO List
	List<DogGatherParticipantDTO> participantList = (ArrayList<DogGatherParticipantDTO>)request.getAttribute("participantList");
	int participantCount = (int)request.getAttribute("participantCount");
	
	Timestamp GATHRING_DATE = post.getGATHERING_DATE();
	// 정모 날짜 지나면 신청 못하도록 구현
	// 현재 시간 Timestamp 형식으로 구하기
	// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = null;
	today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);	
%>
<!DOCTYPE html>
<html>
<head>
<title><%= post.getTITLE() %></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link href="/resources/css/fonts.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/gatherboard/chat.css">
<link rel="stylesheet" href="/resources/css/gatherboard/comment.css">
<link rel="stylesheet" href="/resources/css/gatherboard/detail.css">
<link rel="stylesheet" href="/resources/css/gatherboard/kakaomap.css">
<link href="/resources/css/gatherboard/dropdown.css" rel="stylesheet"> 
<!-- script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script> -->
</head>
<body class="bg-light" style="font-family: 'Do Hyeon', sans-serif; letter-spacing: 1.5px; font-weight: 100;">
	<div class="all">
	<%@ include file="/WEB-INF/views/commons/dog_top.jspf" %>
	<div class="content-fluid body-section">
		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-12">
						<h1 class="h2">강아지 정모게시판</h1>
							<button class="btn btn-template-outlined listBtn">					
								<i class="fa fa-align-justify"></i><a id="btnStr" href="/dog/gatherboard" id="listBtn" onclick="listClick()">목록</a>
							</button>
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="container">
			      <div class="row bar">
					<div class="col-md-12" id="board-post">
						<div class="panel-heading">
							<h2 class="h3 panel-title"><%= post.getTITLE() %></h2>
						</div>
						<table>
							<tr>						
							 	<td>
							       <div class="nav navbar-nav ml-auto">
							          <div class="row showMemberDropMenu"><%= writer %>
							          <div class="member_dropMenu">
							               <a href="/member/detail/<%=post.getUSER_ID() %>" class="nav-link" id="viewUser">게시글보기</a>
							               <a href="#" id="message-btn" class="nav-link" data-toggle="modal">쪽지보내기</a>
							          </div>
							       </div>
							       </div>
							    </td>
								<td class="date-view">
									<i class="fa fa-clock-o"></i> 작성일 : <%= post.getCREATED_DATE() %>
								<%
								if(!(strCreatedDate.equals(strUpdatedDate))) {
								%>
									<i class="fa fa-clock-o" style="padding-left:1rem"></i> 수정일 : <%= post.getUPDATED_DATE() %>
								<% 
								} 
								%>
									<i class="fa fa-eye" style="padding-left:1rem"></i> 조회 : <%= post.getVIEW_COUNT() %>	
								</td>
							</tr>
						</table>
				<%
					//정모 날짜가 지나지 않았을 경우
					if(GATHRING_DATE.compareTo(ts) >= 1) {
						System.out.println("정모 날짜 남음!");
				%>
					<div class="heading">
						<button id="participantBtn" class="btn btn-template-outlined" type="button" data-toggle="modal" data-target="#myLargeModal">
							<i class="fa fa-sign-in"></i> 신청
						</button>
						
						<button id="participantBtn" type="button" class="btn btn-template-outlined" data-toggle="modal" data-target="#mySmallModal">
							<i class="fa fa-users"></i>신청목록
						</button>
						<div class="row" id="contentBlock">						
							<h3 id="participantState" style="background:transparent">참여 현황 													
							</h3>	
							<div class="participantCount">
								<a id="participantCount1"><%= participantCount %></a><a id="participantCount2"> / <%= post.getPEOPLE_COUNT() %></a>
							</div>
						</div>
					</div>

						<%
							if(participantCount >= post.getPEOPLE_COUNT()) {
						%>
							<p>참여 신청이 마감되었습니다.</p>
						<%
							} 
						%>
						<!-- Participant Modal -->
						<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header participant">
										<h3 class="modal-title participant" id="myModalLabel">참여 신청</h3>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
											</button>
									</div>
										<div class="modal-body">
											<form action="/dog/gatherboard/insertParticipant" id="participantform" method="post" onsubmit="return participantCheck(<%=sizeID%>);">	
											<input type="hidden" ID="POST_ID" name="POST_ID" value="<%= post.getID() %>">
											<input type="hidden" name="USERNAME" value="<%= userName %>">
												<div class="form-group">
													<label for="category">크기</label> 
													<select id="size" class="form-control" name="DOG_SIZE" onchange="javascript:categoryChange();">
														<option value="">크기</option>
														<option value="1">소</option>
														<option value="2">중</option>
														<option value="3">대</option>
													</select>
												</div>
												<div class="form-group">
													<label for="category">종 선택</label> 							
													<select id="species" name="SPECIES" class="form-control">
														<option value="">종 선택</option>
													</select>
												</div>	
												<div class="form-group">
													<label for="category">신청 내용</label> 
													<textarea name="REQUEST_CONTENT" id="requestContent" rows="6" cols="60" class="form-control"></textarea>
												</div>
												<div class="form-group">						
													<div class="text-center">
														<button type="submit" class="btn btn-template-outlined" id="participantSendBtn">확 인</button>
														<button id="participantResetBtn" type="reset" class="btn btn-template-outlined">취 소</button>
							                        </div>
												</div>
											</form>
										</div> <!-- modal-body END -->
								</div>
							</div>
						</div>
						<!-- Participant Modal END -->
						<!-- ParticipantList Modal -->
						<div class="modal fade" id="mySmallModal" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header participant">
										<h3 class="modal-title participant" id="myModalLabel">신청 목록</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<%
											if(participantList.size()==0) {
										%>
										<p> 참여자가 없습니다.</p>
										<%
											} else {
										%>
										<P id="participantList-top"><i class="fa fa-user"></i> 총원 : <%= participantCount %>명</P>

						                <div class="table-responsive">
						                  <table class="table table-hover">
						                    <thead>
						                      <tr class="text-center">
						                        <th>번호</th>
						                        <th>아이디</th>
						                        <th>반려견</th>
						                        <%
						                        	if(userNickName.equals(writer)){						              
						                        %>
						                        <th>내용</th>
						                        <%
						                        	}
						                        %>
						                      </tr>
						                    </thead>
						                  <tbody>
										<%
												for(int i=0; i<participantList.size(); i++) {
													DogGatherParticipantDTO participant = participantList.get(i);		
										%>
										<%
												// 본인이 참여 신청 한 경우
												if(userName.equals(participant.getUSERNAME()) && !(userNickName.equals(writer))) {
											%>
													<form action="/dog/gatherboard/cancelParticipant" method="post">
													<input type="hidden" name="ID" value="<%=participant.getID() %>">
													<input type="hidden" name="POST_ID" value="<%= participant.getPOST_ID() %>">
														<button id="participantCancelBtn" type="submit" class="btn btn-template-outlined btn-sm">
															신청취소
														</button>
													</form>
											<%
												} 
											%>
											 <tr class="text-center">
												<td><b><%= i+1 %></b></td>
											 	<td>
											        <div class="nav navbar-nav ml-auto">
											           <div class="showMemberDropMenu"><%= participant.getNICKNAME() %>
											           <div class="member_dropMenu">
											                <a href="/member/detail/<%=participant.getUSER_ID() %>" class="nav-link">게시글보기</a>
											                <a href="#" id="message-btn" class="nav-link" data-toggle="modal" onclick="messageClick('<%=participant.getUSER_ID() %>,<%=participant.getNICKNAME()%>')">쪽지보내기</a>
											           </div>
											        </div>
											        </div>
										    	</td> 
												<td><%= participant.getDOG_SPECIES() %></td>
						                        <%
						                        	if(userNickName.equals(writer)){						              
						                        %>
												<td><%= participant.getREQUEST_CONTENT() %></td>
												<%
						                        	}
												%>
											</tr>																														
										<%
												}
										%>
										</tbody>
					                  </table>
					                </div>		
					                	<% 			
											}
										%>         
								</div> <!-- modal-body -->
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary close-btn"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- participantModl END -->
					<%
						} else { 
							// 정모 날짜가 지났을 경우
							System.out.println("정모날짜 지남!");
					%>
						<div class="heading">
							<h3>참여 현황</h3>
						</div>
						<p>날짜가 지난 정모입니다.</p>
					<%
						}
					%>
						<div id="post-content">						
							<h3>모임 안내</h3>
							<blockquote class="blockquote">
									<p><strong>모임 일시 : </strong><a id="gathering_date"> <%= post.getGATHERING_DATE() %></a></p>
									<p><strong>주소 :</strong><a id="addr"></a></p>
									<p id="sizeID"><strong>크기  :</strong> <%= size %>
									<p><strong>반려견 :</strong> <%= request.getAttribute("dogSpecies") %> </p>
									<p><strong>내용 :</strong> <%= post.getCONTENT() %></p>
							</blockquote>
						</div>
						
					<div id="map" style="width:100%;height:350px;"></div>					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>					
			        <!-- 댓글창 -->
					<div id="comments">						
						<!-- 댓글 갯수 -->
						<h4 class="text-uppercase" id="commentCount">
						<input type="text" id="commentCountVal">
						</h4>
						<!-- 댓글 내용 -->
						<section>			
						<div id="commentList" class="row comment">
						<!-- 댓글 출력 -->
						</div>			
						</section>		
						<!-- 댓글 페이징 -->
						<div style="padding:3rem">
							<form id="page_form">
								<input type="hidden" name="POST_ID" value=<%= post.getID() %>>
								<input type="hidden" name="USER_ID" value=<%= userID %>> 
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
							</form>
			            <div class="comment-footer d-flex justify-content-center"></div>
					</div>		
					<!-- 댓글 입력창 -->
					<h4 class="comment">댓글 작성</h4>
				
					<form id="insert_form" method="post">
						<!-- comments -->
						<input type="hidden" name="USER_ID" value=<%= userID %>> 
						<input type="hidden" name="POST_ID" value=<%=post.getID() %>>
						<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
						
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="name">아이디<span class="required text-primary">*</span></label>						
									<input id="NICKNAME" type="text" class="form-control" value="<%=userNickName %>" readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group comment-div">
									<label for="comment">내 용 <span class="required text-primary">*</span></label>
									
									<div class="comment-and-button">
										<div class="comment-form">							
										<textarea id="CONTENT" name="CONTENT" rows="4" class="form-control "></textarea>						
										</div>
										
										<div class="comment-button-div">
											<button class="re btn btn-template-outlined comment-input-button" id="input_data">댓글 등록</button>
										</div>
									</div>
								</div>
							</div>
						</div>			
					</form>
					<!-- comment insert form END -->			         
			        <div style="margin: 2rem"></div>
			         <!-- 수정/삭제/신고 버튼 -->
			         <div id="comment-form">
			         	<div class="row">
							<div class="col-sm-12 text-right"> 
							<!-- 게시자일떄만 수정/삭제  -->
							<%
								if(post.getUSER_ID()==userID){
							%>
								<button id="modifyBtn" class="btn btn-template-outlined">
									<i class="fa fa-pencil"></i> <a id="btnStr" href="/dog/gatherboard/modifyForm/<%= post.getID()%>">수정</a>
								</button>
								<button id="deleteBtn" type="submit" class="btn btn-template-outlined">
									<i class="fa fa-trash-o"></i> <a id="btnStr" href="/dog/gatherboard/deleteDogGatherPost/<%=post.getID()%>">삭제</a>
								</button>
							<%
								}
							%>
							<!-- 게시자일때만 수정/삭제 END -->
								<button type="button" class="btn btn-danger"
								data-toggle="modal" data-target="#report-modal" id="report-btn">신고</button>
							</div>
			            </div>
			         </div>
			      </div>
			      <div style="margin: 5rem"></div>         									
			</div> <!-- col-md-12 end -->
		</div> <!-- row-bar end -->									
			<!-- 채팅 -->
			<input type="hidden" value='<%=userNickName%>' id='chat_id' />
			<input type="hidden" value='<%=userID%>' id='user_id' />
			<input type="hidden" value='<%=post.getID()%>' id='post_id' />
					<!-- 채팅창 -->
				    <div id="chat_box" style="display:none;">
				        <div class="chatBox">
				            <p class='chatTopBar'><%=post.getID()%>번 글 정모 채팅 </p>
				            <div class='onUser' style="float:right"><p id="onUser">접속자</p>
				            </div>
				            <div id="messageWindow"></div>
					           <div class="input-group">
					           	 <input id="inputMessage" type="text" placeholder="메세지를 입력해주세요" class="form-control" onkeyup="enterkey()" />
					             <input id="sendBtn" class="btn" type="submit" value="입력" onclick="send()" />
				           	   </div>
				       	</div>
				  	</div>
				 <img class="chat" src="/resources/img/gatherboard/chat.png" onclick="chatClick('<%=userNickName%>');"/>
    			<!-- 채팅 끝 -->
				<!-- 신고 모달 -->
				<div id="report-modal" tabindex="-1" role="dialog" aria-hidden="true"
				      class="modal fade">
				      <div role="document" class="modal-dialog">
				         <div class="modal-content">
				            <div class="modal-header">
				               <h4 align="center" class="modal-title">게시글 신고</h4>
				               <button type="button" data-dismiss="modal" aria-label="Close"
				                  class="close">
				                  <span aria-hidden="true">×</span>
				               </button>
				            </div>				
				            <div class="modal-body">
				               <form id="report_form" method="POST">				
				                  <input type="hidden" name="board_id" id="BOARD_ID" value=<%=boardId%>>
				                  <input type="hidden" name="post_id" id="POST_ID" value=<%= post.getID() %>>
				                  <input type="hidden" name="user_id" id="USER_ID" value=<%=userID %>>
								<label style="text-align: left !important;">신고 분류</label>
				                  <div class="form-group">
				                     <select id="state" name="category_id" id="category_id"
				                        class="form-control">
				                        <option value="0">신고 사유 선택</option>
				                        <option value="1">부적절한 게시물</option>
				                        <option value="2">도배 게시물</option>
				                        <option value="3">광고성 게시물</option>
				                        <option value="4">비방/비하/욕설 게시물</option>
				                        <option value="5">음란성 또는 청소년 유해 게시물</option>
				                        <option value="6">기타</option>
				                     </select>
				                  </div>
				                  <label>내용</label>
				                  <div class="form-group">
				                     <textarea name="description" id="description" rows="10"
				                        class="form-control"></textarea>
				                  </div>
				                  <p class="text-center">
				                     <input type="submit" value="신고" class="btn btn-outline-primary"
				                        id="input_report">
				                     <a style="padding-right: 0.5rem;"></a>
				                     <input type="reset" class="btn btn-outline-primary" value="취소">
				                  </p>
				               </form>
				            </div>
				         </div>
				      </div>
				   </div>
				   <!-- 신고모달 끝 -->    	
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
		    	                  <input type="hidden" name="messageSender_id" id="sender_id" value=<%=userID%>>
		    	                   <input type="hidden" name="messageReceiver_id" id="receiver_id" value=<%=post.getUSER_ID() %>>		    	                
		    	                    <div class="form-group">
		    	                        <label>받는사람</label>
		    	                        <input class="form-control" name='messageNickname' value=<%=writer %> readonly>
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
		
	<script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/chat.js"></script>
	<script src="/resources/js/gatherboard/comment.js"></script>
	<script src="/resources/js/report.js"></script>
	<script>
    var addr = '<%=addr%>';
    var addr1 = addr.split("　")[0];
    var addr2 = addr.split("　")[1]; 
    var gatheringAddr = addr1;
    var gatheringDateStr = document.getElementById('gathering_date');
    var gatheringDate = gatheringDateStr.innerText;
    
    if(!(addr2 == null || addr2 == "")) {
    	gatheringAddr = addr1 + " " + addr2;
    }
	$(document).ready(function(){
		
		$("#addr").append(gatheringAddr);
		
 		//쪽지 전송 시 로그인 확인
	    $('#message-btn').on("click", function(e){
	    <% if(loginedUser == null){ %>
	       alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
	       $('#login-modal').modal("show");
	       
	    <%} else{%>         
	          $(this).attr('data-target',"#message-modal");
	          $('#message-modal').modal("show");
	    	<%}%>
	    });  
	
	});	
	</script>

</body>
</html>