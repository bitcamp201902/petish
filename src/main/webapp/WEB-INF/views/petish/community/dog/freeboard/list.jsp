<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.community.user.dto.response.LoginedUser"%>
<%@ page import="com.community.petish.community.dog.freeboard.dto.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	List<DogFreePostResponseDTO> dtoList = (List<DogFreePostResponseDTO>) request.getAttribute("dtoList");

	//페이지  번호
	int pageNum = 1;
	if((DogFreePostPageDTO)request.getAttribute("pageMaker") != null){
		DogFreePostPageDTO pageDTO = (DogFreePostPageDTO)request.getAttribute("pageMaker");

		pageNum = pageDTO.getCri().getPageNum();
		request.setAttribute("pageNum", pageNum);		
	}	 
	//게시판 아이디 설정
	request.setAttribute("boardId", "9");
	
	//카테고리 번호
	Long categoryId = 0L;
%>

<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<link href="/resources/css/freeboard/list.css" rel="stylesheet">
<link href="/resources/css/missingboard/list.css" rel="stylesheet">
<link href="/resources/css/fonts.css" rel="stylesheet">
</head>

<body style="font-family: 'Do Hyeon', sans-serif;">
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/cat_top.jspf"%>
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

		<form action="/dog/freeboard/<%=pageNum %>" method="post">
			<input type="hidden" value=<%=pageNum %>>
		</form>

		<div id="heading-breadcrumbs" style="padding-bottom:0">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-12" style="margin-top:2rem">
	                  <div style="float:left"><h1 class="h2">자유게시판</h1></div>
	                  <div style="float:right">
	                  	<button class="btn btn-template-outlined write-button" style="margin-top:0;" id="writeBtn" >글쓰기</button>
		              </div>
	                  <hr style="color:rgba(0,0,0,0.10); margin-top:4rem">
	               </div>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<div style="text-align: right; margin: 1rem">
					<form id="categoryForm" action="/dog/freeboard" method="post">		
						<div class="row">
							<div class="col-sm-6 col-md-2">
								<div class="form-group">
									<select id="category_id" class="form-control post-category" name="category_id" onchange="categoryChange()">
										<option value="0">카테고리 선택</option>
										<option value="1">질문</option>
										<option value="2">일상</option>
										<option value="3">웃긴자료</option>
										<option value="4">정보</option>
									</select>
								</div>
							</div>
						</div>
						
						<input type="hidden" name="type" value="S">
						<input type="hidden" name="keyword" id="categoryKeyword" value="<%=categoryId %>">
						
					</form>						
				</div>

				<div id="customer-order" class="col-lg-20">
					<table class="table" id="post" style="text-align: center">
						<tr>
							<th width="100px" class="postId border-top-0 titles" name="mobile-none">번호</th>
							<th width="150px" class="postCategory border-top-0 titles">카테고리</th>
							<th width="500px" class="postTitle border-top-0 titles" border-top-0" colspan="10">제목</th>
							<th width="150px" class="postWriter border-top-0 titles">작성자</th>
							<th width="150px" class="postDate border-top-0 titles" name="mobile-none">작성일</th>
							<th width="100px" class="postView border-top-0 titles" name="mobile-none">조회</th>
						</tr>
						
						<%
						if(dtoList.size() != 0){
							for (int i = 0; i < dtoList.size() ; i++) {
								DogFreePostResponseDTO dto = (DogFreePostResponseDTO) dtoList.get(i);
								categoryId = dto.getCategory_id();								
						%>
						<tr>
							
							<td class="postId"><%=dto.getId() %></td>	
							
							<td class="postId"><%=dto.getCategory_name() %></td>
														
							<td colspan="10">
								<a href="/dog/freeboard/<%=dto.getId()%>" class="title" id="title"><%=dto.getTitle() %></a>
								<a style="padding: 0.15rem"></a><span class="badge badge-secondary comment-count"><%=dto.getCommentCount() %></span>
							</td>
							
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
							<fmt:formatDate pattern="yyyy-MM-dd" value="<%=dto.getCreated_date() %>"/>
							</td>
							
							<td class="test view" name="mobile-none"><%=dto.getView_count() %></td>
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
							<i class="fa fa-angle-double-left"></i></a></li>
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
			<form id="searchForm" action="/dog/freeboard/" style="margin-right: 15px;">
				<div aria-label="Page navigation example" 
					class="d-flex justify-content-center">					
					<div class="col-md-2 col-lg-2">
						<div class="form-group">	           				
								<select id="state" name="type" class="form-control" style="height:3rem">
			           				<option value=""
		           					<c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>------</option>
		           					<option value="T"
		           					<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>	           				
		           					<option value="W"
		           					<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
		           					<option value="C"
		           					<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>		           							           				
	           					</select>
	           			</div>
	           		</div>
	    
	    			<div class="panel panel-default sidebar-menu">
	    				<div class="panel-body">
	           				<div class="input-group">
			           			<input type='text' name='keyword' id='searchInput' placeholder="Search" class="form-control" />
			           			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			           			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
			           			
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
	<form id='actionForm' action="/dog/freeboard" method='get'>
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
			 		DogFreePostResponseDTO dto = (DogFreePostResponseDTO) dtoList.get(i);					
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
	$(document).ready(function(){
		//로그인 확인
		   $('#writeBtn').on("click", function(e){
			   <% if(loginedUser == null){ %>
				   alert("로그인이 필요한 화면입니다. 로그인 후 이용해주세요.");
				   $('#login-modal').modal("show");

			   <%}else{%>
			   		window.location.href='/dog/freeboard/writeForm';
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
	
	<script src="/resources/js/freeboard/list.js"></script>

</body>
</html>