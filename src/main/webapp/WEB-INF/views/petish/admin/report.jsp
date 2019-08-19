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
          <p>신고게시판</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Pages</li>
          <li class="breadcrumb-item active"><a href="/admin/report">신고게시판</a></li>
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
                    <th>게시판명</th>
                    <th>게시글번호</th>
                    <th>신고카테고리</th>
                    <th>신고유저</th>
                    <th>신고날짜</th>
                   	<th>상태</th>
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
      
      function getReportList(){
    	  $('#userTable').empty();
    	  $.ajax({
    		 url:'/admin/report/list',
    		 type:'GET',
    		 dataType:'json',
    		 success:function(data){
    			 $.each(data.reportList, function(index, item){
    				var output='';
    				output += '<tr>';
    				output += '<td>'+item.id+'</td>';
    				output += '<td>'+item.board_table_name+'</td>';
    				output += '<td><a href="/admin/report'+item.board_table_address+''+item.board_id+'/'+item.post_id+'">'+item.post_id+'</a></td>';
    				output += '<td>'+item.category_name+'</td>';
    				output += '<td>'+item.nickname+'</td>';
    				output += '<td>'+item.created_date+'</td>';
    				console.log(item.deleted);
    				if(item.deleted){
    					output += '<td>삭제됨</td>';
    				}else{
    					output += '<td></td>';
    				}
    				output += '</tr>';
    				$('#userTable').append(output);
    			
    			 });
    			$('#sampleTable').DataTable(); 
    		 },
    		 error:function(){
 				alert("ajax 통신 실패!!!");
 			 }
    	  });
      }
      $(document).ready(function(){
    	  getReportList();
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