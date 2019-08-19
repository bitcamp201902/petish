<%@page import="com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage"%>
<%@page import="com.community.petish.community.mypage.dto.request.MessageRequestDTO"%>
<%@page import="com.community.petish.community.mypage.dto.response.MessageResponseDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.community.mypage.*"%>
<%
	/* ArrayList<MessageResponseDTO> receivedList = (ArrayList) request.getAttribute("receivedList");
	int undeletedReceived = (int) request.getAttribute("undeletedReceived");
	ArrayList<MessageResponseDTO> sentList = (ArrayList) request.getAttribute("sentList");
	int undeletedSent = (int) request.getAttribute("undeletedSent"); */
	
	MessageResponseDTO dto = null;
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mypage</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<!-- CSS파일 추가 -->
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<link href="/resources/css/fonts.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<style>
.modal {
	position: fixed;
	top: 15%;
	left: 0;
	z-index: 1050;
	display: none;
	width: 100%;
	height: 100%;
	overflow: hidden;
	outline: 0
}
.content1, .content2{
	height: 200px!important;
    overflow: scroll!important;
    -ms-overflow-style: none!important;
    white-space:pre;
}

.receivedMessage:hover, .sentMessage:hover{
	color : grey;
	cursor : pointer;
}
</style>

<body style="font-family: 'Do Hyeon', sans-serif;">
	<!-- 테이블 -->
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<div id="content">
			<div class="container">

				<div>
					<div style="max-width: 20cm; margin: auto;" id="checkout">
						<div style="margin-top: 5rem;">
							<h3>쪽지함</h3>
						</div>
						<div class="box border-bottom-0" style="margin-top: 0rem;">

							<!-- <form method="get" action=""> -->

							<ul id="pills-tab" role="tablist"
								class="nav nav-pills nav-justified">
								<li class="nav-item" id="received"><a id="pills-profile-tab"
									data-toggle="pill" href="#message-receive" role="tab"
									aria-controls="pills-profile" aria-selected="false"
									class="nav-link active">받은 쪽지함</a></li>
								<li class="nav-item" id="sent"><a id="pills-home-tab"
									data-toggle="pill" href="#message-send" role="tab"
									aria-controls="pills-home" aria-selected="true"
									class="nav-link">보낸 쪽지함</a></li>
							</ul>

							<div id="pills-tabContent" class="tab-content">
								<div id="message-receive" role="tabpanel"
									aria-labelledby="pills-home-tab"
									class="tab-pane fade show active">
									<div class="row">
										<div class="col-md-12">
											<div class="tile">
												<div class="tile-body">
													<button type="button" class="btn btn-outline-dark" id="delete-choice" style='margin-bottom:5px;'>선택삭제</button><br>
													<table class="table table-hover table-bordered"
														id="ajaxList">

													</table>
									
													<div class="receivedfooter"></div>
													<div class="sentfooter"></div>
													
													<div id=searchReceived>
													<select name='type'>
														<option value=''>--</option>
														<option value='T'>제목</option>
														<option value='N'>닉네임</option>
													</select>
													<input type='text' name='keyword' />
													<button id='searchReceivedBtn'>Search</button>
													</div>
													
													<div id=searchSent>
													<select name='type'>
														<option value=''>--</option>
														<option value='T'>제목</option>
														<option value='N'>닉네임</option>
													</select>
													<input type='text' name='keyword' />
													<button id='searchSentdBtn'>Search</button>
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
			</div>
		</div>
	</div>
	<!--  받은 쪽지 모달창 -->
	<div id="receive-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">받은쪽지</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>보낸사람</label> <input class="form-control"
							name='nickname1' readonly>
					</div>
					<div class="form-group">
						<label>날짜</label> <input type="text" class="form-control"
							name='sent_date1' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<div id="message_content" class="form-control content1"></div>
					</div>
					<input type="hidden" name="sender_id">
						<div class="text-right">
						<input type="button" value="삭제" class="modalDeleteBtn">
						<input type="button" value="답장" class="modalAnswerBtn">
					</div>
					</div>
				</div>
			</div>
		</div>
		
	<!-- 보낸 쪽지 모달창 -->
	<div id="sent-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">보낸쪽지</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>받는사람</label> <input class="form-control"
							name='nickname2' readonly>
					</div>
					<div class="form-group">
						<label>날짜</label> <input type="text" class="form-control"
							name='sent_date2' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<div id="message_content" class="form-control content2"></div>
					</div>
					<div class="text-right">
						<input type="button" value="삭제" class="modalDeleteBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 쪽지보내기 모달창 -->
	<div id="new-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
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
					<div class="form-group">
						<label>받는사람</label> <input class="form-control"
							name='nickname' readonly>
					</div>
					<input type="hidden" name="receiver_id">
					<div class="form-group">
						<label>제목</label> <input class="form-control"
							name='title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content'></textarea>
					</div>	
					<div class="text-left">
						<input type="button" value="보내기" class="modalSendBtn">
					</div>				
				</div>
			</div>
		</div>
	</div>
	
	<script>
		//쪽지 상세보기
		$(document).ready(
				function() {
					var received = $("#received");
					var sent = $("#sent");
					var receivedfooter = $(".receivedfooter");
					var sentfooter = $(".sentfooter");
					var listUL = $("#ajaxList");
					
								
					
					//받은 쪽지 모달
					var receivedModal = $("#receive-modal");
					var modalInputSentNickname1 = receivedModal
					.find("input[name='nickname1']");
					var modalInputSent_date1 = receivedModal
					.find("input[name='sent_date1']");
					var modalInputContent1 = receivedModal
					.find(".content1");
					var modalInputSender_id1 = receivedModal
					.find("input[name='sender_id']");
					
					//보낸 쪽지 모달
					var sentModal = $("#sent-modal");
					var modalInputReceivedNickname2 = sentModal
					.find("input[name='nickname2']");
					var modalInputSent_date2 = sentModal
					.find("input[name='sent_date2']");
					var modalInputContent2 = sentModal
					.find(".content2");
					
					//쪽지보내기 모달
					var newModal = $("#new-modal");
					var modalInputReceivedNickname3 = newModal
					.find("input[name='nickname']");
					var modalInputTitle3 = newModal
					.find("input[name='title']");
					var modalInputContent3 = newModal
					.find("textarea[name='content']");
					var modalInputReceiver_id3 = newModal
					.find("input[name='receiver_id']");
					
					//버튼 
					var modalDeleteBtn = $(".modalDeleteBtn");
					var modalAnswerBtn = $(".modalAnswerBtn");
					var modalSendBtn = $(".modalSendBtn");
					
					
					//메세지리스트에서 a태그(메세지 제목)을 누르면, 해당 글 id의 세부데이터를 받아서 모달로 보내준다
					
					//받은 쪽지 상세보기
					function showMessage(){
					$(".receivedMessage").on("click", "a", function(e) { //동작은 됨
						var id = $(this).data("id");
						
						messageService.receivedMessageDetail(id, function(message) {
							modalInputSentNickname1.val(message.nickname);
							modalInputSent_date1.val(message.sent_date);
							modalInputContent1.html(message.content);
							modalInputSender_id1.val(message.sender_id);
							receivedModal.data("id", message.id);
							$("#receive-modal").modal("show");
						});
						
						messageService.changeReadAttr(id, <%=loginedUser.getId()%>);
						showReceivedList(pageNum);
						
					});
					
					//보낸 쪽지 상세보기
					$(".sentMessage").on("click", "a", function(e) {
						var id = $(this).data("id");
						
						messageService.sentMessageDetail(id, function(message) {
							modalInputReceivedNickname2.val(message.nickname);
							modalInputSent_date2.val(message.sent_date);
							modalInputContent2.html(message.content);
							sentModal.data("id", message.id);
							$("#sent-modal").modal("show");
						});	
					});
					};
			
					
					//받은쪽지에서 답장하기 누르면 기존 모달 꺼지고 새로운 모달 열림 
					modalAnswerBtn.on("click", function(e){
						$("#receive-modal").modal("hide");
						modalInputReceivedNickname3.val(modalInputSentNickname1.val());
						modalInputReceiver_id3.val(modalInputSender_id1.val());
						$("#new-modal").modal("show");
					})
					
					
					//쪽지보내기 창에서 쪽지보내기 버튼 클릭시 ajax연결				
					modalSendBtn.on("click", function(e){
						var message = {
								title : modalInputTitle3.val(),	
								content : modalInputContent3.val(),
								sender_id :  <%=loginedUser.getId()%>,
								receiver_id : modalInputReceiver_id3.val()
								
						}
						messageService.writeMessage(message, function(result){
							alert("result : "+result);
						$("#new-modal").modal("hide");
						location.reload();
						});
					});
					
					
					//공통
					//모달에서 삭제버튼을 클릭하면, 해당id값의 데이터를 삭제하고 모달을 숨긴다(=>리스트 재조회 필요)
					modalDeleteBtn.on("click", function(e){
						var id = receivedModal.data("id");
						messageService.deleteMessage(id, function(result){
							alert(result);
							receivedModal.modal("hide");
							location.reload();
						});
					});
					
					//모달 닫기버튼 누르면 화면 리로드됨
					$(".close").on("click", function(e){
					})

					
					
					
					//ajax메서드 정의
					var messageService = (function() {
						//받은 메세지 리스트
						function getReceivedList(param, callback, error) {
							var page = param.page || 1;
							var typeOption = document.getElementsByName("type");
		                    var selectedIndex = typeOption[0].selectedIndex;
		                    var type = document.getElementsByTagName("option")[selectedIndex].value;
		                    var keyword = $('input[name=keyword]').val();
		                    if(type == ""){
		                    	$.get("/mypage/api/message/receivedList/" + page + ".json",
										function(data) {
											if (callback) {
												callback(data.receivedCnt, data.list);
											}
										}).fail(function(xhr, status, err) {
									if (error) {
										error();
									}
								});
		                    }else{
							$.get("/mypage/api/message/receivedList/" + page + "/" + type + "/" + keyword + ".json",
									function(data) {
										if (callback) {
											callback(data.receivedCnt, data.list);
										}
									}).fail(function(xhr, status, err) {
								if (error) {
									error();
								}
							});
		                    }
							
						}
						
						//보낸 메세지 리스트
						function getSentList(param, callback, error) {
							var page = param.page || 1;
							var typeOption = document.getElementsByName("type");
		                    var selectedIndex = typeOption[0].selectedIndex;	
		                    var type = document.getElementsByTagName("option")[selectedIndex].value;
		                    var keyword = $('input[name=keyword]').val();
		                    if(type == ""){
							$.get("/mypage/api/message/sentList/" + page + ".json",
									function(data) {
								if (callback) {
									callback(data.sentCnt, data.list);
								}
							}).fail(function(xhr, status, err) {
							if (error) {
							error();
								}
							});
							}else{
								$.get("/mypage/api/message/sentList/" + page + "/" + type + "/"+ keyword + ".json",
										function(data) {
									if (callback) {
										callback(data.sentCnt, data.list);
									}
								}).fail(function(xhr, status, err) {
								if (error) {
								error();
									}
								});
							}
						}
						
						//메세지 세부조회 메서드
						function receivedMessageDetail(id, callback, error) {
							$.get("/mypage/api/message/received/" + id + ".json",
									function(result) {
										if (callback) {
											callback(result);
										}
									}).fail(function(xhr, status, err) {
								if (error) {
									error();
								}
							});
						}
						
						function sentMessageDetail(id, callback, error) {
							$.get("/mypage/api/message/sent/" + id + ".json",
									function(result) {
										if (callback) {
											callback(result);
										}
									}).fail(function(xhr, status, err) {
								if (error) {
									error();
								}
							});
						}
						function changeReadAttr(id, user_id, callback, error){
								var a = {id:id, receiver_id:user_id};
							$.ajax({
								type:'put',
								url : '/mypage/api/message/'+id+'/'+user_id,
								data : JSON.stringify(a),
								contentType : "application/json; charset=utf-8",
								success : function(result, status, xhr){
									if(callback){
										callback(result);
									}
								},
								error : function(xhr, status, er){
									if(error){
										error(er);
									}
								}
							});
						}
						
						//메세지 삭제 메서드
						function deleteMessage(id, callback, error){
							$.ajax({
								type : 'delete',
								url : '/mypage/api/message/' + id,
								success : function(result, status, xhr){
									if(callback){
										callback(result);
									}
								},
								error:function(xhr,status, er){
									if(error){
										error(er);
									}
								}
							});
						}
						
						//메세지 작성 메서드
						
						function writeMessage(message, callback, error){
							$.ajax({
								type:'post',
								url : '/mypage/api/message/new',
								data : JSON.stringify(message),
								contentType : "application/json; charset=utf-8",
								success : function(result, status, xhr){
									if(callback){
										callback(result);
									}
								},
								error : function(xhr, status, er){
									if(error){
										error(er);
									}
								}
							})
						}
						return {
							sentMessageDetail : sentMessageDetail,
							receivedMessageDetail : receivedMessageDetail,
							deleteMessage : deleteMessage,
							changeReadAttr : changeReadAttr,
							writeMessage : writeMessage,
							getReceivedList : getReceivedList,
							getSentList : getSentList
						};
					})();
					
					//버튼 클릭시 해당 페이지의 리스트로 넘어가는 메서드(받은메세지 리스트)
					function moveReceivedPage() {
						receivedfooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");
							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum:" + targetPageNum);
							pageNum = targetPageNum;
							showReceivedList(pageNum);
						})
					};
					
					//버튼 클릭시 해당 페이지의 리스트로 넘어가는 메서드(보낸메세지 리스트)
					function moveSentPage() {
						sentfooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");
							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum:" + targetPageNum);
							pageNum = targetPageNum;
							showSentList(pageNum);
						})
					};
					
					var pageNum = 1;
					function showReceivedPage(receivedCnt){
						
						sentfooter.html("");
						receivedfooter.html("");
						
						var endNum = Math.ceil(pageNum / 10.0) * 10;
						var startNum = endNum - 9;
						var prev = startNum != 1;
						var next = false;
						
						if (endNum * 10 >= receivedCnt) {
							endNum = Math.ceil(receivedCnt / 10.0);
						}

						if (endNum * 10 < receivedCnt) {
							next = true;
						}
						var str = "<div><ul class='pagination pull-right'>";
						if (prev) {
							str += "<li class='page-item'><a class='page-link' href='"
									+ (startNum - 1) + "'>Previous</a></li>";

						}
						
						for (var i = startNum; i <= endNum; i++) {

							var active = pageNum == i ? "active" : "";
							str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
									+ i + "</a></li>";
						}
						
						if (next) {
							str += "<li class='page-item'><a class='page-link' href='"
									+ (endNum + 1) + "'>Next</a></li>";
						}
						
						str += "</ul></div>";

						console.log(str);

						receivedfooter.html(str);
						moveReceivedPage();
					}
					
					function showSentPage(sentCnt) {

						sentfooter.html("");
						receivedfooter.html("");

						var endNum = Math.ceil(pageNum / 10.0) * 10;
						var startNum = endNum - 9;
						var prev = startNum != 1;
						var next = false;

						if (endNum * 10 >= sentCnt) {
							endNum = Math.ceil(sentCnt / 10.0);
						}

						if (endNum * 10 < sentCnt) {
							next = true;
						}

						var str = "<div><ul class='pagination pull-right'>";
						if (prev) {
							str += "<li class='page-item'><a class='page-link' href='"
									+ (startNum - 1) + "'>Previous</a></li>";

						}
						for (var i = startNum; i <= endNum; i++) {

							var active = pageNum == i ? "active" : "";
							str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
									+ i + "</a></li>";
						}

						if (next) {
							str += "<li class='page-item'><a class='page-link' href='"
									+ (endNum + 1) + "'>Next</a></li>";
						}
						str += "</ul></div>";

						console.log(str);

						sentfooter.html(str);
						moveSentPage()
					}
					
					
					function showReceivedList(page) {
						
						messageService.getReceivedList(
										{
											page : page || 1
										},
										function(receivedCnt, list) {
											if (page == -1) {
												pageNum = Math.ceil(receivedCnt / 10.0);
												showReceivedList(pageNum);
												return;
											}
											var str = "";
											str += "<tr align='center'><th><input type='checkbox' id='received-check-all'>"; 
											str += "</th><th>제목</th><th>보낸사람</th><th>보낸날짜</th><th>읽음</th></tr>";
												
												if (list == null || list.length == 0) {
													listUL.html(str);
													return;
												}
												
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<tr><td><input type='checkbox' class='received-check-one' value="
														+ list[i].id;
													str += "></td><td class='receivedMessage'><a class='messageText' data-id="
														+ list[i].id;
													str += " data-nick="
														+ list[i].nickname + ">"
														+ list[i].title + "</a></td>";
													str += "<td>"
														+ list[i].nickname + "</td>";
													str += "<td>"
														+ list[i].sent_date + "</a></td>";
													str += "<td style='text-align:center'>";
													
													if(list[i].read == 0){
														str += "<i class='far fa-envelope' style='font-size:24px;'></i></td>/tr>";
													}else if(list[i].read == 1){
														str += "<i class='far fa-envelope-open' style='font-size:24px;color:grey'></i></td>/tr>";
													}
													
												};
												
												listUL.html(str);
												showReceivedPage(receivedCnt);
												showMessage();
												checkMethod();
										});
					};
					
					function showSentList(page) {

						messageService
								.getSentList(
										{
											page : page || 1
										},
										function(sentCnt, list) {
											
											if (page == -1) {
												pageNum = Math.ceil(sentCnt / 10.0);
												showSentList(pageNum);
												return;
											}
											var str = "";
											str += "<tr align='center'><th><input type='checkbox' id='sent-check-all'></th><th>제목</th><th>받는사람</th><th>보낸날짜</th><th>읽음</th></tr>"
											
											if (list == null || list.length == 0) {
												listUL.html(str);
												return;
											}
											
											for (var i = 0, len = list.length || 0; i < len; i++) {
												str += "<tr><td><input type='checkbox' class='sent-check-one' value="
													+ list[i].id;
												str += "></td><td class='sentMessage'><a class='messageText' data-id="
													+ list[i].id;
												str += " data-nick="
													+ list[i].nickname + ">" 
													+ list[i].title + "</a></td>";
												str += "<td>"
													+ list[i].nickname + "</td>";	
												str += "<td>"
													+ list[i].sent_date + "</td>";
												str += "<td style='text-align:center'>";
												if(list[i].read == 0){
													str += "<i class='far fa-envelope' style='font-size:24px;'></i></td>/tr>";
												}else if(list[i].read == 1){
													str += "<i class='far fa-envelope-open' style='font-size:24px;color:grey'></i></td>/tr>";
												}
											}
											
											listUL.html(str);
											showSentPage(sentCnt);
											showMessage();
											checkMethod();
										});
					};
					
					function checkMethod(){
					 	 $('#received-check-all').change(function() { //전체 체크 변화 다루는 함수           
				            if (this.checked) { //전체(All) 체크된 경우
				               $('.received-check-one').prop('checked', true);
				            }

				            else { //전체(All) 체크되지 않은 경우(체크 해제)

				               $('.received-check-one').prop('checked', false);
				            }
				         });

				         $('#sent-check-all').change(function() { //전체 체크 변화 다루는 함수           
				            if (this.checked) { //전체(All) 체크된 경우
				               $('.sent-check-one').prop('checked', true);
				            }

				            else { //전체(All) 체크되지 않은 경우(체크 해제)

				               $('.sent-check-one').prop('checked', false);
				            }
				         });
					};


				     	var modalInputReceivedNickname3 = newModal
						.find("input[name='nickname']");

				     	showReceivedList();
				     	$("#searchSent").hide();
				         //선택 삭제 버튼
				         $('#delete-choice').click(function() {
				          	var list = $(":checked");
				        
				          	for(var i=0; i<list.length; i++){
				          		messageService.deleteMessage(list[i].value, function(result){
									alert(result);
									location.reload();
								});
				          	};
				         });
				         
				        received.on("click", function(e){
					        	document.getElementsByName("type")[0].selectedIndex=null;
					        	document.getElementsByName("keyword")[0].value=null;
								$("#searchReceived").show();
								$("#searchSent").hide();
								showReceivedList();
								pageNum = 1;
						})
						$("#searchReceivedBtn").on("click", function(e){
								
								showReceivedList();
						})
						
						sent.on("click", function(e){
								document.getElementsByName("type")[0].selectedIndex=null;
				        		document.getElementsByName("keyword")[0].value=null;
								showSentList();
								pageNum = 1;
								$("#searchReceived").hide();
								$("#searchSent").show();
						})
						
						$("#searchSentdBtn").on("click", function(e){
								showSentList();
						})
				});
	</script>

</body>
</html>