<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Petish Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/css/admin/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">Petish</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
       
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
    
      <ul class="app-menu">
        <li><a class="app-menu__item" href="/admin"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li><a class="app-menu__item active" href="/admin/user"><i class="app-menu__icon fa fa-user-circle"></i><span class="app-menu__label">User</span></a></li>
        
                
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Pages</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/admin/report"><i class="icon fa fa-circle-o"></i> 신고페이지</a></li>
            <li><a class="treeview-item" href="/admin/question"><i class="icon fa fa-circle-o"></i> 문의페이지</a></li>
            
          </ul>
        </li>
      </ul>
    </aside>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-user-circle"></i>User</h1>
          <p>유저관리</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="/admin/user">User</a></li>
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
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>주소</th>
                    <th>성별</th>
                    <th>가입일</th>
                    <th>버튼</th>
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
      function deleteUser(id){
    	  /* $.ajax({
  			url:'/admin/user/delete/'+id,
  			type:'DELETE',
  			success:function(data){
  				if(data==true){
  					getUserList();
  				}
  				else{
  					alert("탈퇴실패!");
  				}
  			},
  			error:function(request,status,error){
  				alert("ajax 통신 실패!!!");
  				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

  			}
  		  }); */
  		  alert(id);
      }
      function modifyUser(id){
    	  window.location.href="/admin/user/modify/"+id;
      }
      function getUserList(){
    	  $('#userTable').empty();
    	  $.ajax({
    		 url:'/api/users',
    		 type:'GET',
    		 dataType:'json',
    		 success:function(data){
    			 $.each(data.users, function(index, item){
    				var output='';
    				output += '<tr>';
    				output += '<td>'+item.id+'</td>';
    				output += '<td>'+item.username+'</td>';
    				output += '<td>'+item.nickname+'</td>';
    				output += '<td>'+item.address+'</td>';
    				output += '<td>'+item.gender+'</td>';
    				output += '<td>'+item.join_date+'</td>';
    				output += '<td><button type="button" class="btn btn-template-outlined" id="modifybtn_'+item.id+'" style="margin-right:10px; margin-bottom:3px;">수 정</button><button type="button" id="deletebtn_'+item.id+'" class="btn btn-template-outlined" style="margin-bottom:3px;">탈 퇴</button></td>';
    				console.log(item.join_date);
    				output += '</tr>';
    				$('#userTable').append(output);
    				$('#deletebtn_'+item.id+'').click(function(event){
    					deleteUser(item.id);
    				});
    				$('#modifybtn_'+item.id+'').click(function(event){
    					modifyUser(item.id);
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
    	  getUserList();
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