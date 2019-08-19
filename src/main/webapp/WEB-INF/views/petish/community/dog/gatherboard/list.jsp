<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*, java.sql.*, java.text.*,com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO,com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO" %>
<!DOCTYPE html>
<html>
<head>
<title>강아지 정모게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link href="/resources/css/gatherboard/list.css" rel="stylesheet">       
</head>

<body>
	<div id="all">
		
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 정모게시판</h1>
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
						<button type="submit" class="btn btn-template-outlined write-button" onclick="writeFormClick();">
							<a>
							글쓰기
							</a>
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
										<td><button type="button" class="btn btn-sm btn-default">신청마감</button></td>
									</c:when>
									<c:otherwise>
										<td><button type="button" class="btn btn-sm btn-template-main">신청가능</button></td>
									</c:otherwise>
								</c:choose>	
									<td><c:out value="${board.REGION_NAME}" /></td>
									<td class=test><c:out value="${board.DOG_SIZE}" />형견</td>
									<td colspan="10">
										<a href="#" onclick="detailClick(${board.ID })">
										<!--  a onclick="detailClick("+${board.ID}+")">-->
										<c:out value="${board.TITLE}" /> <b>[<c:out value="${board.COMMENT_COUNT}" />]</b></a></td>
									<td>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown"><c:out value="${board.NICKNAME}" /></a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
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
                        <li class="page-item"><a href="${pageMaker.startPage-1 }" name="" 
                        	class="page-link"> <i class="fa fa-angle-double-legt"></i></a></li>
                     </c:if>

                     <c:forEach var="num" begin="${pageMaker.startPage }"
                        end="${pageMaker.endPage }">
                        <li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
                           <a href="${num}" class="page-link">${num}</a>
                        </li>
                     </c:forEach>

                     <c:if test="${pageMaker.next }">
                        <li class="page-item"><a href="${pageMaker.endPage+1 }"
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
										<input type='text' name='keyword' class="form-control" placeholder="검색어를 입력해주세요"/>
                                			<span class="input-group-btn">
                                		<button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
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
				                                
			</div>
		</div>
	
<%--		<%@ include file="/WEB-INF/views/commons/script.jspf" %>--%>
		<!-- include list.js -->
		<script src="/resources/js/gatherboard/list.js"></script>

</body>
</html>