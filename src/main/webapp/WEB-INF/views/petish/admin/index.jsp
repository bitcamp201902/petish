<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%@ include file="/WEB-INF/views/petish/admin/commons/menu.jspf" %>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
          <p>통계페이지</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
              <h4>Users</h4>
              <p><b>${userCount }</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-thumbs-o-up fa-3x"></i>
            <div class="info">
              <h4>Likes</h4>
              <p><b>*</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
              <h4>Uploades</h4>
              <p id=newWritingsCnt></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
              <h4>Stars</h4>
              <p><b>*</b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">월별 방문자수</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">일별 게시판 업로드 분포</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="radarChartDemo"></canvas>
            </div>
          </div>
        </div>
        
      </div>
      <div class="row">
        
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">유저 관심사 분포</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="pieChartConcern"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">유저 성별 분포</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="pieChartGender"></canvas>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="/resources/js/admin/jquery-3.2.1.min.js"></script>
    <script src="/resources/js/admin/popper.min.js"></script>
    <script src="/resources/js/admin/bootstrap.min.js"></script>
    <script src="/resources/js/admin/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/resources/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="/resources/js/admin/plugins/chart.js"></script>
    <script type="text/javascript">
      var data = {
      	labels: ["January", "February", "March", "April", "May"],
      	datasets: [
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86]
      		}
      	]
      };
      var rdata = {
    	      	labels: ["강아지", "고양이", "고슴도치", "토끼", "이구아나"],
    	      	datasets: [
    	      		{
    	      			label: "My Second dataset",
    	      			fillColor: "rgba(151,187,205,0.2)",
    	      			strokeColor: "rgba(151,187,205,1)",
    	      			pointColor: "rgba(151,187,205,1)",
    	      			pointStrokeColor: "#fff",
    	      			pointHighlightFill: "#fff",
    	      			pointHighlightStroke: "rgba(151,187,205,1)",
    	      			data: [5, 5, 5, 5, 5]
    	      		}
    	      	]
    	      };
      var pdata = [
      	{
      		value: "${maleCount }",
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "남자"
      	},
      	{
      		value: "${femaleCount }",
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "여자"
      	}
      ]
      var pdata2 = [
        	{
        		value: "${concernCat }",
        		color: "#46BFBD",
        		highlight: "#5AD3D1",
        		label: "고양이"
        	},
        	{
        		value: "${concernDog }",
        		color:"#F7464A",
        		highlight: "#FF5A5E",
        		label: "강아지"
        	}
        ]
        
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartGender").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
      
      var ctxp2 = $("#pieChartConcern").get(0).getContext("2d");
      var pieChart2 = new Chart(ctxp2).Pie(pdata2);
      
     
    </script>
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
    </script>
    
    <script>
 
    
    $.ajax({
    	  type: 'get',
    	  url: '/admin/statistics/getAllNewWritingsCnt',
    	  dataType: 'json',
    	  success: function (html, status) {
    	    var newWritingsCnt = $("#newWritingsCnt");
    	    newWritingsCnt[0].innerText=html;
    	  },
    	  error: function (xhr, status, errormsg) {
    	    alert('Failed!' + errormsg);
    	  }
    	})
    	
    	
    $.ajax({
    	  type: 'get',
    	  url: '/admin/statistics/getDogNewWritingsCnt',
    	  dataType: 'json',
    	  success: function (html, status) {
    		  var array = rdata.datasets[0].data;
    		  array[0]=html;
    	      var ctx2 = $('#radarChartDemo').get(0).getContext("2d");
    	      var radarChart = new Chart(ctx2).Radar(rdata);
    	  },
    	  error: function (xhr, status, error) {
    	    alert('Failed!' + error);
    	  }
    	})
    

    </script>
  </body>
</html>