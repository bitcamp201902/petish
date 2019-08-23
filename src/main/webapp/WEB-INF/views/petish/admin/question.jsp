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
          <p>문의게시판</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active"><a href="/admin/question">문의게시판</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-striped" id="sampleTable">
                <thead>
                  <tr>
                    <th>식별자</th>
                    <th>문의카테고리</th>
                    <th>제목</th>
                    <th>닉네임</th>
                    <th>문의날짜</th>
                    <th>답변상태</th>
                  </tr>
                </thead>
                <tbody id="userTable">
                 
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
    <div id="new-modal" tabindex="-1" role="dialog" aria-hidden="true"
		class="modal fade">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">문의내역</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>닉네임</label> <input class="form-control" id='nickname'
							readonly>
					</div>
					<input type="hidden" id="id">
					<div class="form-group">
						<label>문의카테고리</label> <input class="form-control" id='category' readonly>
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" id='title' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="content" rows="10" class="form-control"
							name='content'></textarea>
					</div>
					<div class="text-left">
						<input type="button" value="답 변" onclick="questionRes()">
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Essential javascripts for application to work-->
    <script src="/resources/js/admin/jquery-3.2.1.min.js"></script>
    <!-- Google analytics script-->
    <script type="text/javascript">
    	
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
     
      function questionRes(){
    	  var params ={
    			  'id' : $('#id').val(),
    	  		  'content' : $('#content').val()
    	  };
    	  $.ajax({
    		url:'/admin/question/response',
    		type:'PUT',
    		data:JSON.stringify(params),
    		contentType:'application/json; charset=utf-8',
 			dataType:'json',
 			success:function(retVal){
				if(retVal.res == "OK"){
					//데이타 성공일때 이벤트 작성
					$("#new-modal").modal("hide");
					getQuestionList();
				}
				else{
					alert("Modify Fail!!!");
				}
			},
			error:function(request,status,error){
				alert("ajax 통신 실패!!!");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
    	  });
      }
      function getQuestionList(){
    	  $('#userTable').empty();
    	  $.ajax({
    		 url:'/admin/question/list',
    		 type:'GET',
    		 dataType:'json',
    		 success:function(data){
    			 $.each(data.questionList, function(index, item){
    				var output='';
    				output += '<tr>';
    				output += '<td>'+item.id+'</td>';
    				output += '<td>'+item.category+'</td>';
    				output += '<td><a href=# id="quest'+item.id+'">'+item.title+'</a></td>';
    				//output += '<td>'+item.content+'</td>';
    				output += '<td>'+item.nickname+'</td>';
    				output += '<td>'+item.created_date+'</td>';
    				if(item.replied){
    					output += '<td>답변완료</td>';
    				}else{
    					output +='<td>답변대기</td>';
    				}
    				//output += '<td><button type="button" class="btn btn-template-outlined" style="margin-right:10px; margin-bottom:3px;">수 정</button><button type="button" id="deletebtn_'+item.id+'" class="btn btn-template-outlined" style="margin-bottom:3px;">탈 퇴</button></td>';
    				output += '</tr>';
	    			$('#userTable').append(output);
    				var questId = '#quest'+item.id;
    				$(questId).click(function(){
    					$('#new-modal').modal('show');
    					$('#id').val(item.id);
    					$('#category').val(item.category);
    					$('#title').val(item.title);
    					$('#nickname').val(item.nickname);
    					$('#content').val(item.content+"\n=========================================\n안녕하세요 운영자입니다.");
    				});
    			 });
    			$('#sampleTable').DataTable();
    		 },
    		 error:function(){
 				alert("ajax 통신 실패!!!");
 			 }
    	  });
      }
      $(document).ready(function(){
    	  getQuestionList();
      });
    </script>
    <script src="/resources/js/admin/popper.min.js"></script>
    <script src="/resources/js/admin/bootstrap.min.js"></script>
    <script src="/resources/js/admin/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/resources/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="/resources/js/admin/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/resources/js/admin/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript"></script>
  </body>
</html>