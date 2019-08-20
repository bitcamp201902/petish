<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
<%@ include file="/WEB-INF/views/petish/admin/commons/menu.jspf" %>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-text"></i>Pages</h1>
          <p>강아지 게시판</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">강아지</li>
          <li class="breadcrumb-item active"><a href="/admin/dog/gatherboard">정모 게시판</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
           		<div id="postCount"></div>
	              <table class="table table-hover table-striped" id="sampleTable">
	                <thead class="text-center">
	                  <tr>
	                    <th>번호</th>
	                    <th>지역</th>
	                    <th>크기</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일자</th>
	                    <th>조회</th>
	                    <th>상태</th>
	                    <th>삭제</th>
	                  </tr>
	                </thead>
	                <tbody id="gatherboardList" class="text-center">
					        </tbody>
	              </table>
	              <div>
	                <div class="post-footer d-flex justify-content-center"></div>
	              </div>
	              <!-- page-form -->       
                <form id="page_form">
					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
				</form>	  
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <!-- script 파일 추가 -->
	<%@ include file="/WEB-INF/views/petish/admin/commons/script.jspf" %>
	<script src="/resources/js/admin/dog/gatherboard.js"></script>
  </body>
</html>