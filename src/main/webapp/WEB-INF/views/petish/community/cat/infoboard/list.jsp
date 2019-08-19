<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>고양이 건강게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57" href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
<link href="/resources/css/infoboard/list.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		
		history.replaceState({},null,null);
		
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='ID' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/cat/infoboard/detail");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='searchKeyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
		
		var result = "${msg}";
		
		if(result == "insertSuccess"){
			alert("게시글 등록이 완료되었습니다.");
		}
		else if(result == "modifySuccess"){
			alert("게시글 수정이 완료되었습니다.");
		}
		else if(result == "deleteSuccess"){
			alert("게시글 삭제가 완료되었습니다.");
		}
	});
</script>
</head>

<body class="bg-light">
	<div id="all">
		
<%@ include file="/WEB-INF/views/commons/cat_top.jspf" %>
<div class="container-fluid body-section">
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">고양이 건강게시판</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end"></ul>
				</div>
			</div>
		</div>
	</div>
		
		<div id="content">
			<div class="container">
				<button class="btn btn-template-outlined" id="WriteBtn" onclick="location.href='/cat/infoboard/writeForm'">글쓰기 </button>
					<div id="customer-order" class="col-lg-20">
						<table class="table">
							<tr>
								<th width="130px" class="MoblieViewNumber border-top-0">번호	</th>
								<th width="130px" class="test border-top-0">분류	</th>
								<th width="550px" class="border-top-0" colspan="10">제목 	</th>
								<th width="100px" class="border-top-0">작성자	</th>
								<th width="130px" class="test border-top-0">작성일자</th>								
								<th width="100px" class="test border-top-0">조회	</th>
								<th width="100px" class="test border-top-0">좋아요	</th>
							</tr>
							<c:forEach var="boardinfo" items="${list}">
								<tr>
									<td>${boardinfo.ID} </td>
									<td class=test> 
										<c:if test="${boardinfo.CATEGORY_ID == 1}">
											<c:out value="건강"/>
										</c:if>
										<c:if test="${boardinfo.CATEGORY_ID == 2}">
											<c:out value="행동패턴"/>
										</c:if>
									</td>
									<td colspan="10"><a class='move' href='<c:out value="${boardinfo.ID}"/>'>
									<c:out value="${boardinfo.TITLE}"/></a><span class="badge badge-secondary">18</span></td>
									<td>${boardinfo.USER_ID}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardinfo.CREATE_DATE}" /></td>
									<td class=test>${boardinfo.VIEW_COUNT}</td>
									<td class=test>11</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	<div aria-label="Page navigation example" class="d-flex justify-content-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
			<li class="page-item"><a href="${pageMaker.startPage - 1}" class="page-link"><i class="fa fa-angle-double-left"></i></a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active ':' '}"><a href="${num}" class="page-link">${num}</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
			</c:if>
		</ul>
	</div>
	
	<form id='actionForm' action="/cat/infoboard/list" method='get'>
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
	<input type='hidden' name='searchType' value = '<c:out value="${pageMaker.cri.searchType}"/>'>
	<input type='hidden' name='searchKeyword' value = '<c:out value="${pageMaker.cri.searchKeyword}"/>'>
	<input type='hidden' name='categoryId' value = '<c:out value="${pageMaker.cri.categoryId}"/>'>
	</form>
	
<form name="searchForm" id="searchForm" role="form" action="/cat/infoboard/list" method="GET">
	<div aria-label="Page navigation example" class="d-flex justify-content-center">
		<div class="teset col-md-2 col-lg-2">
			<div class="form-group">
				<select name='categoryId' id="categoryId" class="form-control">
					<option value="0"
					<c:out value=""/>>전체 카테고리</option>
					<option value="1"
					<c:out value="${pageMaket.cri.categoryId eq '1'?'selected':''}"/>>건강</option>
					<option value="2"
					<c:out value="${pageMaket.cri.categoryId eq '2'?'selected':''}"/>>행동패턴</option>
				</select>
			</div>
		</div>

		<div class="col-md-2 col-lg-2">
			<div class="form-group">
				<select name='searchType' id="searchType" class="form-control">
					<option value=""
					<c:out value="${pageMaker.cri.searchType == null?'selected':''}"/>>-</option>
					<option value="T"
					<c:out value="${pageMaket.cri.searchType eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
					<c:out value="${pageMaket.cri.searchType eq 'C'?'selected':''}"/>>내용</option>
					<option value="W"
					<c:out value="${pageMaket.cri.searchType eq 'W'?'selected':''}"/>>작성자</option>
				</select>
			</div>
		</div>

	<div class="panel panel-default sidebar-menu">
		<div class="panel-body">
				<div class="input-group">
					<input type="text" name='searchKeyword' value='<c:out value="${pageMaker.cri.searchKeyword}"/>' placeholder="Search" class="form-control"/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
						<input type='hidden' name='amount' value ='<c:out value="${pageMaker.cri.amount}"/>' />
						<span class="input-group-btn">
							<button class="btn btn-template-main">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
			</div>
		</div>
		</div>
</form>
</div>

	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script	src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>