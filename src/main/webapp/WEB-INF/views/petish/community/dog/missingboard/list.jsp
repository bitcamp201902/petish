<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.community.dog.missingboard.dto.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	List<DogLostPostResponseListDTO> dtoList = (List<DogLostPostResponseListDTO>) request.getAttribute("dtoList");

	//페이지  번호
	int pageNum = 1;
	if((DogLostPostPageDTO)request.getAttribute("pageMaker") != null){
		DogLostPostPageDTO pageDTO = (DogLostPostPageDTO)request.getAttribute("pageMaker");
		pageNum = pageDTO.getCri().getPageNum();	
		request.setAttribute("pageNum", pageNum);
	}	
	//게시판 아이디 설정
	request.setAttribute("boardId", "4");
%>

<!DOCTYPE html>
<html>
<head>
<title>실종견 게시판</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<link href="/resources/css/missingboard/list.css" rel="stylesheet">
<script src="/resources/js/missingboard/list.js"></script>

<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<body style="font-family: 'Do Hyeon', sans-serif;">
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>
		<%
		//접속 아이디
		Long userId = null;
	    String userNickname = "";
	    if(loginedUser != null){
	    	userId = loginedUser.getId();
	    	userNickname = loginedUser.getNickname();
	    	
	    	System.out.println("유저아이디 : " + userId);
	    	System.out.println("유저닉네임 : " + userNickname); 
	    }
      %>

		<form action="/dog/missingboard/<%=pageNum %>" method="post">
			<input type="hidden" value=<%=pageNum %>>
		</form>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">실종견 게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">

						</ul>
					</div>
				</div>
			</div>
		</div>

		<div style="padding: 0.5rem"></div>

		<div id="content">
			<div class="container">
				<div style="text-align: right; margin: 1rem">
					<button class="btn btn-template-outlined write-button" id="writeBtn" >글쓰기
					</button>
				</div>

				<div id="customer-order" class="col-lg-20">
					<table class="table" id="post" style="text-align: center">
						<tr>
							<th width="130px" class="found border-top-0" name="mobile-none">상태</th>
							<th width="200px" class="dogImage border-top-0" name="mobile-none">이미지</th>
							<th width="550px" class="title border-top-0" colspan="10" name="mobile-none">제목</th>
							<th width="100px" class="writer border-top-0" name="mobile-none">작성자</th>
							<th width="130px" class="postDate border-top-0" name="mobile-none">작성일</th>
							<th width="100px" class="view border-top-0" name="mobile-none">조회</th>
						</tr>
						
						<%
						if(dtoList.size() != 0){
							for (int i = 0; i < dtoList.size() ; i++) {
								DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO) dtoList.get(i);

								int index = i;
								
								//실종 장소
								String address = dto.getDog_lost_address();								
								String[] array = address.split(" ");
								
								String addr1 = null;
								String addr2 = null;
								
								if (array.length >0 && array[0] != null)
									addr1 = array[0];

								if (array.length >0 && array[1] != null)
									addr2 = array[1];

								String addrSplit = addr1 + " " + addr2;
						%>
						<tr>
							<%
								if (dto.getFound() == 0) {
							%>
							<td><span class="found btn btn-sm btn-danger found-buttons">미발견</span></td>
							<%
								} else {
							%>
							<td><span class="found btn btn-sm btn-info found-buttons">발견</span></td>
							<%
								}
							%>
							
							<td id="imageInsert<%=index%>" class="dogImage" name="mobile-image">
							<!-- 이미지 들어갈 자리 -->	
							</td>
								
							<td colspan="10">
								<a href="/dog/missingboard/<%=dto.getId()%>" class="title" id="title">[<%=addrSplit%>]
									<%=dto.getDog_species()%> / <%=dto.getDog_gender()%> / <%=dto.getDog_age()%></a>
								<a style="padding: 0.15rem"></a> <span class="badge badge-secondary comment-count"><%=dto.getCommentCount() %></span></td>
							<td>
								<div class="nav navbar-nav ml-auto">
									<a href="#" data-toggle="dropdown" class="dropdown writer"><%=dto.getNickname() %></a>
									<div class="dropdown-menu">
										<div class="dropdown">
											<a href="/mypage/member/detail" class="nav-link">게시글보기</a>
										</div>
										<div class="dropdown">
											<a href="#" id="message-btn" class="nav-link" data-toggle="modal">쪽지보내기</a>
										</div>
									</div>
								</div>

							</td>
							<td class="test postDate" name="mobile-date">
							<fmt:formatDate pattern="yyyy-MM-dd" value="<%=dto.getCreate_date() %>"/>
							</td>
							<td class="test view" name="mobile-none"><%=dto.getView_count()%></td>
						</tr>
						<%
							}
						}
						%>

					</table>
					
					<!-- 페이징  -->			
					<div aria-label="Page navigation example" class="d-flex justify-content-center">
						<ul class="pagination">
						
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a href="${pageMaker.startPage-1 }" name="pagination_button" class="page-link">
							<i class="fa fa-angle-double-legt"></i></a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}" >
							<a href="${num }" class="page-link" name="pagination_button">${num }</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="page-item">
							<a href="${pageMaker.endPage+1 }" class="page-link" name="pagination_button">
							<i class="fa fa-angle-double-right"></i></a></li>
						</c:if>
						
						</ul>
					</div>
				</div>
			</div>	

			<div style="padding: 1rem"></div>	
			
			<!-- 검색 -->
			<form id="searchForm" action="/dog/missingboard/list" style="margin-right: 15px;">
				<div aria-label="Page navigation example" 
					class="d-flex justify-content-center">					
					<div class="col-md-2 col-lg-2">
						<div class="form-group">	           				
								<select id="state" name="type" class="form-control">
			           				<option value=""
		           					<c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>--</option>
		           					<option value="T"
		           					<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>지역</option>	           				
		           					<option value="W"
		           					<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>	           				
	           					</select>
	           			</div>
	           		</div>
	    
	    			<div class="panel panel-default sidebar-menu">
	    				<div class="panel-body">
	           				<div class="input-group">
			           			<input type='text' name='keyword' placeholder="Search" class="form-control" 
			           			value='<c:out value="${pageMaker.cri.keyword}"/>' />
			           			<input type='hidden' name='pageNum'
			           			value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			           			<input type='hidden' name='amount'
			           			value='<c:out value="${pageMaker.cri.amount}"/>' />
			           			
			           			<span class="input-group-btn">
									<button type="submit" id="searchBtn" class="btn btn-template-main">
									<i class="fa fa-search"></i>
									</button>
								</span>								
							</div>
						</div>
					</div>   
				</div>
			</form>	
		</div>		
	</div>
	<!-- all -->           
	 
	<div style="padding: 1rem"></div>
	<!-- 페이징 -->
	<form id='actionForm' action="/dog/missingboard/list" method='get'>
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
                <%
			 	for (int i = 0; i < dtoList.size() ; i++) {
					DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO) dtoList.get(i);					
					int index = i;					
				%>
                <form id="message_form" method="POST">
                	
			   		<input type="hidden" name="sender_id" id="sender_id" value=<%=userId %>>
                	<input type="hidden" name="receiver_id" id="receiver_id" value=<%=dto.getId() %>>
                
                    <div class="form-group">
                        <label>받는사람</label>
                        <input class="form-control" name='nickname' value=<%=userNickname %>>
                    </div>
                    <div class="form-group">
                        <label>제목</label>
                        <input class="form-control" name='title'>
                    </div>
                    <div class="form-group">
                        <label>내용</label>
                        <textarea id="message_content" name='content' rows="10" class="form-control"></textarea>
                    </div>
                    <p class="text-center">   
                        <input type="submit" value="보내기" id="modalSendBtn" class="btn btn-outline-primary">
                    </p>
                </form>
                <%} %>
                </div>
            </div>
        </div>
    </div>
    
	<script>
	//반응형
	function resize(){
		if(window.innerWidth < 576){

			$('th[name=mobile-none]').css('display','none');

			$('.found').attr('float','left');
			$('.found').width('40px');
			$('.dogImage').width('100px');
			$('.title').width('220px');
			$('.title').attr('display','unset!important');
			$('.writer').width('70px');
			$('.writer').attr('display','block');

			$('th[name=mobile-image]').css('width','100px');
			$('th[name=mobile-image]').css('heigh','100px');

			$('.table td').css('padding','5px');
			$('.table th').css('padding','5px');
		}
		else {
			$('th[name=mobile-none]').css('display','flexible');
		}
	}

	$(window).resize(function(){
		resize();
	});

	$(document).ready(function(){
		resize();

		//로그인 확인
		   $('#writeBtn').on("click", function(e){
			   <% if(loginedUser == null){ %>
				   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
				   $('#login-modal').modal("show");

			   <%}else{%>
			   		window.location.href='/dog/missingboard/writeForm';
			   <%}%>
		   });

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

		   //쪽지 전송
			 $('#modalSendBtn').click(function(event){
				   event.preventDefault();

				   var messageModal = $("#message-modal"); //모달창

				   var modalInputTitle = messageModal.find("input[name='title']"); //모달창 제거
				   var modalInputContent = messageModal.find("textarea[name='content']"); //모달창 내용
				   var senderId = $("#sender_id").val();
				   var receiverId = $("#receiver_id").val();

				   var modalSendBtn = $("#modalSendBtn"); //모달 보내기 버튼

				   var msg = $("#message_form").serialize();
				   alert(msg);

		           $.ajax({
		               url : '/mypage/api/message/new',
		               type : 'post',
		               data : msg,
		               contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		               dataType : "json",
		               beforeSend : function(){
		            	   if(senderId == "" || senderId == "null"){
		            		   alert("로그인 후 이용할 수 있습니다. 로그인 해주세요.");
		            		   return false;
		            	   }
		            	   else{
		            		   return true;
		            	   }
		               },
		               success : function(result, status, xhr) {
		            	   if (callback) {
		            		   callback(result);
		            		   alert("쪽지가 성공적으로 전송됐습니다.");
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

		//즉시 실행 함수
		   (function(){
			<%
			 	for (int i = 0; i < dtoList.size() ; i++) {
					DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO) dtoList.get(i);
					int index = i;
			%>

			 var id = <%=dto.getId()%>;

	          $.getJSON("/dog/missingboard/getAttachList/<%=dto.getId()%>", function(arr){

                  var str = "";
	              //첨부된 이미지 파일 출력
	              $(arr).each(function(i, attach){

	                  if(attach.fileType){
	                    var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName); //파일 이름(썸네일)

	                    str += "<img id='lostdogImg' src='/display?fileName="+fileCallPath+"'>";

	                    return false; //첨부된 사진들 중 맨 첫번쨰 사진만 출력
	                   }
	              });

	              $("#imageInsert<%=index%>").append(str);

	              });//end getjson

	          <%
			 	}
			 %>
	        })();//end function

		//삭제 확인 메세지
		if ('${delete_msg}' == "success")
			alert("게시글 삭제 완료");
		else if ('${delete_msg}' == "failure")
			alert("게시글 삭제 실패");

		//각각 페이지 버튼
		 var actionForm = $("#actionForm");
	 	 //var paginateBtn = $(""')

	 	 $("a[name='pagination_button']").on("click", function(e){

				e.preventDefault();

				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});

		//검색
		 var searchForm = $("#searchForm");
		 $("#searchBtn").on("click", function(e){

			 if(!searchForm.find("option:selected").val()){
				 alert("검색종류를 선택하세요");
				 return false;
			 }
			 if(!searchForm.find("input[name='keyword']").val()){
				 alert("키워드를 입력하세요");
				 return false;
			 }

			 //검색 결과 페이지 1페이지
			 searchForm.find("input[name='pageNum']").val("1");
			 e.preventDefault();

			 searchForm.submit();
		 })
	});
	</script>

</body>
</html>