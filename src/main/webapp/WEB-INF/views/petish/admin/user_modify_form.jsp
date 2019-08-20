<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i>
        	<span class="app-menu__label">게시판 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="/admin/dog/gatherboard"><i class="icon fa fa-circle-o"></i> 강아지</a></li>
            <li><a class="treeview-item" href="#"><i class="icon fa fa-circle-o"></i> 고양이</a></li>
            
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
            <h3 class="tile-title">유저 정보 수정</h3>
            <div class="tile-body">
              <form id="user_modify_form" action="/admin/user/modifyForm">
             	<div class="col-md-2 form-group" style="display:inline-block;">
                  <label class="control-label">식별자</label>
                  <input class="form-control" name="id" value="${modifyUser.id }"type="text" readonly>
                </div>
                <div class="col-md-4 form-group" style="display:inline-block;">
                  <label class="control-label">아이디</label>
                  <input class="form-control" name="username" value="${modifyUser.username }"type="text" readonly>
                </div>
                <div class="col-md-6 form-group" style="display:inline-block;">
                  <label class="control-label">닉네임</label>
                  <input class="form-control" id="nickname" name="nickname" value="${modifyUser.nickname }" type="text" >
                </div>
                <input type="button" value="중복확인" onclick="isDuplicate()">
                <div class="col-md-6 form-group" style="display:inline-block;">
                  <label class="control-label">주소</label>
                  <input class="form-control" name="address" value="${modifyUser.address }" type="text" id="userAddress">
                </div>
                <input type="button" value="검색" onclick="openZipcode()">
                <div class="col-md-6 form-group" >
                  <label class="control-label">성별</label>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="form-check-input" type="radio" name="gender" value="남자">남자
                    </label>
                  </div>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="form-check-input" type="radio" name="gender" value="여자">여자
                    </label>
                  </div>
                </div>
                 <div class="col-md-6 form-group">
                  <label class="control-label">관심사</label>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="form-check-input" type="radio" name="concern_id" value="1">강아지
                    </label>
                  </div>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="form-check-input" type="radio" name="concern_id" value="2">고양이
                    </label>
                  </div>
                    <div class="form-check">
                    <label class="form-check-label">
                      <input class="form-check-input" type="radio" name="concern_id" value="3">기타
                    </label>
                  </div>
                </div>
              </form>
            </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="button" onclick="modify()"><i class="fa fa-fw fa-lg fa-check-circle"></i>수 정</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" onclick="javascript:history.go(-1);"><i class="fa fa-fw fa-lg fa-times-circle"></i>취 소</a>
            </div>
          </div>
        </div>
   
       </div>
      
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="/resources/js/admin/jquery-3.2.1.min.js"></script>
    <!-- Google analytics script-->
    <script type="text/javascript">
    var pass =0;
    function modify(){
    	if(pass == 0){
    		alert('nickname 중복 확인을 해주세요.');
    	}
    	else{
    		$('#user_modify_form').submit();
    	}
    }
    function isDuplicate(){
    	var nickname = $('#nickname').val();
    	
    	if(nickname == '' || nickname == null) {
    		alert("nickname을 입력하세요.");
    		$('#nickname').focus();
    		return;
    	}

    	var nicknameData = { "nickname" : nickname };

    	$.ajax({
    		type: "GET",
    		url: "/api/users/duplicate/nickname",
    		data: nicknameData,
    		success: function(data) {
    			if (data === true) {
    				alert("현재 사용중인 nickname입니다.");
    				
    			} else {
    				alert("사용하실 수 있는 nickname입니다.");
    				pass=1;
    			}
    		}
    	});
    }
    function openZipcode(){			
        var url="/resources/api/searchMap.jsp"
        open(url, "confirm", "toolbar=no,location=no,"
                  +"status=no,menubar=no,"
                  +"scrollbars=yes,resizable=no,"
                  +"width=700,height=500");
      }
      $(document).ready(function(){
    	  $('input:radio[name="gender"]:input[value="${modifyUser.gender }"]').prop("checked", true);
    	  $('input:radio[name="concern_id"]:input[value="${modifyUser.concern_id }"]').prop("checked", true);
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