<!--

=========================================================
* Now UI Dashboard - v1.5.0
=========================================================

* Product Page: https://www.creative-tim.com/product/now-ui-dashboard
* Copyright 2019 Creative Tim (http://www.creative-tim.com)

* Designed by www.invisionapp.com Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/moneyWatch/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/moneyWatch/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Money Watch Administrator
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="/moneyWatch/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/moneyWatch/assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/moneyWatch/assets/demo/demo.css" rel="stylesheet" />
    
</head>

<!-- ####################################### 좌측 메뉴 ####################################################### -->
<body class="">
<input type="hidden" id='test' value='test01' />
  <div class="wrapper ">
    <div class="sidebar" data-color="orange">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
          MW
        </a>
        <a href="/moneyWatch/admin.mw" class="simple-text logo-normal">
          Money Watch
        </a>
      </div>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="./admin.mw">
              <i class="now-ui-icons design_app"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons education_atom"></i>
              <p>회원 관리</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons location_map-big"></i>
              <p>연령별 지출 관리</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons ui-1_bell-53"></i>
              <p>소비패턴 분석 관리</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons users_single-02"></i>
              <p>카드 목록 / 혜택 관리</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>챗봇 관리</p>
            </a>
          </li>
          <li>
            <a href="./#.mw">
              <i class="now-ui-icons text_caps-small"></i>
              <p>게시판 관리</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./#.mw">
              <i class="now-ui-icons arrows-1_cloud-download-93"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    
<!-- ####################################### 상단 메뉴(검색/아이콘) ####################################################### -->    
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">Visitor Graph</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons media-2_sound-wave"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="now-ui-icons location_world"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-lg">
        <canvas id="bigDashboardChart"></canvas>	<!-- Visitor Chart 출력 -->
      </div>
      <div class="content">
        <div class="row">
        <!-- ####################################### 탈퇴 회원 차트 ####################################################### -->
          <div class="col-lg-4">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">Members</h5>
                <h4 class="card-title">Leave Members</h4>
                <div class="dropdown">
                  <button type="button" class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret" data-toggle="dropdown">
                    <i class="now-ui-icons loader_gear"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <a class="dropdown-item text-danger" href="#">Remove Data</a>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="lineChartExample"></canvas>
                </div>
              </div>
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                </div>
              </div>
            </div>
          </div>
          <!-- ####################################### 등록 회원 차트 ####################################################### -->
          <div class="col-lg-4 col-md-6">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">Members</h5>
                <h4 class="card-title">Register Members</h4>
                <div class="dropdown">
                  <button type="button" class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret" data-toggle="dropdown">
                    <i class="now-ui-icons loader_gear"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <a class="dropdown-item text-danger" href="#">Remove Data</a>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="lineChartExampleWithNumbersAndGrid"></canvas>
                </div>
              </div>
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                </div>
              </div>
            </div>
          </div>
          <!-- ####################################### 내역 등록 차트 ####################################################### -->
          <div class="col-lg-4 col-md-6">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">Money In/Out List</h5>
                <h4 class="card-title">Insert Money historys</h4>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="barChartSimpleGradientsNumbers"></canvas>
                </div>
              </div>
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons ui-2_time-alarm"></i> Last 7 days
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
        <!-- ####################################### 최근 등록 FAQ 게시글 정보 (표)  ####################################################### -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-category">FAQ Board</h5>
                <h4 class="card-title"> Recent FAQ info </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        No.
                      </th>
                      <th>
                        Title
                      </th>
                      <th>
                        Writer
                      </th>
                      <th>
                        Date
                      </th>
                    </thead>
                    <tbody>
                    	<c:forEach var="faq" items="${faqList}">
                    		<tr>
                    			<td>
                    				${faq.faq_num}
                    			</td>
                    			<td>
                    				<a href="/moneyWatch/faqContent.mw?qnum=${faq.faq_num}">${faq.subject}</a>
                    			</td>
                    			<td>
                    				${faq.id}
                    			</td>
                    			<td>
                    				${faq.reg}
                    			</td>
                    		</tr>                    	
                    	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!-- ####################################### 금융지식 카테고리 별 스크랩 수 (표) ####################################################### -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-category">Financial knowledge</h5>
                <h4 class="card-title">Scrap by Sense Category</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        Category
                      </th>
                      <th>
                        Count
                      </th>
                      <th>
                        Category
                      </th>
                      <th>
                        Count
                      </th>
                    </thead>
                    <tbody>                    
                    	<c:forEach varStatus="idx" begin="0" end="3" step="1"> <!-- index 0~3번 / 4번 반복 -->
                    		<tr>            			
	                    		<c:forEach var="ss" items="${senseCount}" begin="${idx.index}" end="7" step="4"> <!-- index번호시작, +4 / 2번씩 반복 -->
	                    			<td>
	                    				${ss.sense_detail_category}
	                    			</td>
	                    			<td>
	                    				${ss.count} 개
	                    			</td>                    					
	                    		</c:forEach>                    		
                    		</tr>                    	
                    	</c:forEach>                    		
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      <div class="row">
         <!-- ####################################### 연령별 회원 수 (표)  ####################################################### -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-category">Members</h5>
                <h4 class="card-title"> Age Count </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        Age
                      </th>
                      <th>
                        Count
                      </th>
                    </thead>
                    <tbody>
                    	<c:forEach var="age" items="${memberAgeCount}" begin="1">
                    		<tr>
                    			<td>
                    				${age.age} 대
                    			</td>
                    			<td>
                    				${age.count} 명
                    			</td>
                    		</tr>                    	
                    	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div> 
          <!-- ####################################### 챗봇 (표)  ####################################################### -->
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-category">chat</h5>
                <h4 class="card-title"> Chat Messages </h4>
              </div>
              <div>
                
					 <div id="chatScroll" style="width:90%; height:90%; overflow:auto; border:1px solid; margin: 5%;" >
							<table id="msgs" width="100%" cellspacing="10" cellpadding="10"	></table>
					</div>
						
              </div>
            </div>
          </div> 
          
          
        </div>
      </div>
      <footer class="footer">
        <div class=" container-fluid ">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy; <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>
  
  
    
  <!--   Core JS Files   -->
  <script src="/moneyWatch/assets/js/core/jquery.min.js"></script>
  <script src="/moneyWatch/assets/js/core/popper.min.js"></script>
  <script src="/moneyWatch/assets/js/core/bootstrap.min.js"></script>
  <script src="/moneyWatch/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/moneyWatch/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/moneyWatch/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/moneyWatch/assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="/moneyWatch/assets/demo/demo.js?v=1.5.0" type="text/javascript"></script>
  <script src="/moneyWatch/js/jquery-1.10.2.min.js"></script>
  <script src="/moneyWatch/js/socket.io.js"></script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();
      
      // chat
      var socket = io.connect("http://192.168.44.1:12345");  //서버연결
		
		$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="width:95%">'
						+ '안녕하세요. 무엇을 도와드릴까요?'
						+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
		
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 
			
			//if('${sessionScope.memId}' == "admin" || '${sessionScope.memId}' == msg.id){ // 자기 자신이 쓴 글(+관리자)
				
				$('#msgs').append('<table width="100%"><tr><td style="width:5%"></td><td bgcolor="yellow" align="right" style="width:95%">' + msg.msg
								+ '</td></tr><tr><td style="width:5%"></td><td bgcolor="skyblue" align="right" style="width:95%; font-size:70%">'
								+ msg.id + ' :: ' + msg.nowTime
								+ '</td></tr><tr><td></td></tr></table>');
	
				$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="width:95%">' + msg.adminRe
						+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
	
				$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
				
			//}
      
		});
      

    });
    
    demo = {
    		  initPickColor: function() {
    		    $('.pick-class-label').click(function() {
    		      var new_class = $(this).attr('new-class');
    		      var old_class = $('#display-buttons').attr('data-class');
    		      var display_div = $('#display-buttons');
    		      if (display_div.length) {
    		        var display_buttons = display_div.find('.btn');
    		        display_buttons.removeClass(old_class);
    		        display_buttons.addClass(new_class);
    		        display_div.attr('data-class', new_class);
    		      }
    		    });
    		  },

    		  initDocChart: function() {
    		    chartColor = "#FFFFFF";

    		    // General configuration for the charts with Line gradientStroke
    		    gradientChartOptionsConfiguration = {
    		      maintainAspectRatio: false,
    		      legend: {
    		        display: false
    		      },
    		      tooltips: {
    		        bodySpacing: 4,
    		        mode: "nearest",
    		        intersect: 0,
    		        position: "nearest",
    		        xPadding: 10,
    		        yPadding: 10,
    		        caretPadding: 10
    		      },
    		      responsive: true,
    		      scales: {
    		        yAxes: [{
    		          display: 0,
    		          gridLines: 0,
    		          ticks: {
    		            display: false
    		          },
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawTicks: false,
    		            display: false,
    		            drawBorder: false
    		          }
    		        }],
    		        xAxes: [{
    		          display: 0,
    		          gridLines: 0,
    		          ticks: {
    		            display: false
    		          },
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawTicks: false,
    		            display: false,
    		            drawBorder: false
    		          }
    		        }]
    		      },
    		      layout: {
    		        padding: {
    		          left: 0,
    		          right: 0,
    		          top: 15,
    		          bottom: 15
    		        }
    		      }
    		    };

    		    ctx = document.getElementById('lineChartExample').getContext("2d");

    		    gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
    		    gradientStroke.addColorStop(0, '#80b6f4');
    		    gradientStroke.addColorStop(1, chartColor);

    		    gradientFill = ctx.createLinearGradient(0, 170, 0, 50);
    		    gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
    		    gradientFill.addColorStop(1, "rgba(249, 99, 59, 0.40)");

    		    myChart = new Chart(ctx, {
    		      type: 'line',
    		      responsive: true,
    		      data: {
    		        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    		        datasets: [{
    		          label: "Active Users",
    		          borderColor: "#f96332",
    		          pointBorderColor: "#FFF",
    		          pointBackgroundColor: "#f96332",
    		          pointBorderWidth: 2,
    		          pointHoverRadius: 4,
    		          pointHoverBorderWidth: 1,
    		          pointRadius: 4,
    		          fill: true,
    		          backgroundColor: gradientFill,
    		          borderWidth: 2,
    		          data: [542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 630]
    		        }]
    		      },
    		      options: gradientChartOptionsConfiguration
    		    });
    		  },

    			initDashboardPageCharts: function() {

    		    chartColor = "#FFFFFF";

    		    // General configuration for the charts with Line gradientStroke
    		    gradientChartOptionsConfiguration = {
    		      maintainAspectRatio: false,
    		      legend: {
    		        display: false
    		      },
    		      tooltips: {
    		        bodySpacing: 4,
    		        mode: "nearest",
    		        intersect: 0,
    		        position: "nearest",
    		        xPadding: 10,
    		        yPadding: 10,
    		        caretPadding: 10
    		      },
    		      responsive: 1,
    		      scales: {
    		        yAxes: [{
    		          display: 0,
    		          gridLines: 0,
    		          ticks: {
    		            display: false
    		          },
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawTicks: false,
    		            display: false,
    		            drawBorder: false
    		          }
    		        }],
    		        xAxes: [{
    		          display: 0,
    		          gridLines: 0,
    		          ticks: {
    		            display: false
    		          },
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawTicks: false,
    		            display: false,
    		            drawBorder: false
    		          }
    		        }]
    		      },
    		      layout: {
    		        padding: {
    		          left: 0,
    		          right: 0,
    		          top: 15,
    		          bottom: 15
    		        }
    		      }
    		    };

    		    gradientChartOptionsConfigurationWithNumbersAndGrid = {
    		      maintainAspectRatio: false,
    		      legend: {
    		        display: false
    		      },
    		      tooltips: {
    		        bodySpacing: 4,
    		        mode: "nearest",
    		        intersect: 0,
    		        position: "nearest",
    		        xPadding: 10,
    		        yPadding: 10,
    		        caretPadding: 10
    		      },
    		      responsive: true,
    		      scales: {
    		        yAxes: [{
    		          gridLines: 0,
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawBorder: false
    		          }
    		        }],
    		        xAxes: [{
    		          display: 0,
    		          gridLines: 0,
    		          ticks: {
    		            display: false
    		          },
    		          gridLines: {
    		            zeroLineColor: "transparent",
    		            drawTicks: false,
    		            display: false,
    		            drawBorder: false
    		          }
    		        }]
    		      },
    		      layout: {
    		        padding: {
    		          left: 0,
    		          right: 0,
    		          top: 15,
    		          bottom: 15
    		        }
    		      }
    		    };
    		    
 // Dashboard Graph (Visitor Count)
    var ctx = document.getElementById('bigDashboardChart').getContext("2d");
	chartColor = "#FFFFFF";	////
    var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
    gradientStroke.addColorStop(0, '#80b6f4');
    gradientStroke.addColorStop(1, chartColor);

    var gradientFill = ctx.createLinearGradient(0, 100, 0, 25);		//y축값표시
    gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
    gradientFill.addColorStop(1, "rgba(255, 255, 255, 0.24)");

    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['${days12}', '${days11}', '${days10}', '${days9}', '${days8}', '${days7}', '${days6}', 
        	'${days5}', '${days4}', '${days3}', '${days2}', '${days1}'],
        datasets: [{
          label: "Visitor",
          borderColor: chartColor,
          pointBorderColor: chartColor,
          pointBackgroundColor: "#1e3d60",
          pointHoverBackgroundColor: "#1e3d60",
          pointHoverBorderColor: chartColor,
          pointBorderWidth: 1,
          pointHoverRadius: 7,
          pointHoverBorderWidth: 2,
          pointRadius: 5,
          fill: true,
          backgroundColor: gradientFill,
          borderWidth: 2,
          data: ['${visitorCount11}', '${visitorCount10}', '${visitorCount9}', '${visitorCount8}', 
        	  '${visitorCount7}', '${visitorCount6}', '${visitorCount5}', '${visitorCount4}', 
        	  '${visitorCount3}', '${visitorCount2}', '${visitorCount1}', '${visitorCount0}']
        }]
      },
      options: {
        layout: {
          padding: {
            left: 20,
            right: 20,
            top: 0,
            bottom: 0
          }
        },
        maintainAspectRatio: false,
        tooltips: {
          backgroundColor: '#fff',
          titleFontColor: '#333',
          bodyFontColor: '#666',
          bodySpacing: 4,
          xPadding: 12,
          mode: "nearest",
          intersect: 0,
          position: "nearest"
        },
        legend: {
          position: "bottom",
          fillStyle: "#FFF",
          display: false
        },
        scales: {
          yAxes: [{
            ticks: {
              fontColor: "rgba(255,255,255,0.4)",
              fontStyle: "bold",
              beginAtZero: true,
              maxTicksLimit: 5,
              padding: 10
            },
            gridLines: {
              drawTicks: true,
              drawBorder: false,
              display: true,
              color: "rgba(255,255,255,0.1)",
              zeroLineColor: "transparent"
            }

          }],
          xAxes: [{
            gridLines: {
              zeroLineColor: "transparent",
              display: false,

            },
            ticks: {
              padding: 10,
              fontColor: "rgba(255,255,255,0.4)",
              fontStyle: "bold"
            }
          }]
        }
      }
    });
    
    // Leave Members
    var cardStatsMiniLineColor = "#fff",
    cardStatsMiniDotColor = "#fff";

  ctx = document.getElementById('lineChartExample').getContext("2d");

  gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
  gradientStroke.addColorStop(0, '#80b6f4');
  gradientStroke.addColorStop(1, chartColor);

  gradientFill = ctx.createLinearGradient(0, 170, 0, 50);
  gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
  gradientFill.addColorStop(1, "rgba(249, 99, 59, 0.40)");

  myChart = new Chart(ctx, {
      type: 'line',
      responsive: true,
      data: {
        labels: ['${days12}', '${days11}', '${days10}', '${days9}', '${days8}', '${days7}', '${days6}', 
        	'${days5}', '${days4}', '${days3}', '${days2}', '${days1}'],
        datasets: [{
          label: "Leave Users",
          borderColor: "#f96332",
          pointBorderColor: "#FFF",
          pointBackgroundColor: "#f96332",
          pointBorderWidth: 2,
          pointHoverRadius: 4,
          pointHoverBorderWidth: 1,
          pointRadius: 4,
          fill: true,
          backgroundColor: gradientFill,
          borderWidth: 2,
          data: ['${leaveCount11}', '${leaveCount10}', '${leaveCount9}', '${leaveCount8}', 
        	  '${leaveCount7}', '${leaveCount6}', '${leaveCount5}', '${leaveCount4}', 
        	  '${leaveCount3}', '${leaveCount2}', '${leaveCount1}', '${leaveCount0}']
        }]
    },
    options: gradientChartOptionsConfiguration
  });

	// Register Members
  ctx = document.getElementById('lineChartExampleWithNumbersAndGrid').getContext("2d");

  gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
  gradientStroke.addColorStop(0, '#18ce0f');
  gradientStroke.addColorStop(1, chartColor);

  gradientFill = ctx.createLinearGradient(0, 170, 0, 50);
  gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
  gradientFill.addColorStop(1, hexToRGB('#18ce0f', 0.4));

  myChart = new Chart(ctx, {
    type: 'line',
    responsive: true,
    data: {
      labels: ['${days12}', '${days11}', '${days10}', '${days9}', '${days8}', '${days7}', '${days6}', 
      	'${days5}', '${days4}', '${days3}', '${days2}', '${days1}'],
      datasets: [{
        label: "Register Users",
        borderColor: "#18ce0f",
        pointBorderColor: "#FFF",
        pointBackgroundColor: "#18ce0f",
        pointBorderWidth: 2,
        pointHoverRadius: 4,
        pointHoverBorderWidth: 1,
        pointRadius: 4,
        fill: true,
        backgroundColor: gradientFill,
        borderWidth: 2,
        data: ['${registerCount11}', '${registerCount10}', '${registerCount9}', '${registerCount8}', 
      	  '${registerCount7}', '${registerCount6}', '${registerCount5}', '${registerCount4}', 
    	  '${registerCount3}', '${registerCount2}', '${registerCount1}', '${registerCount0}']
      }]
    },
    options: gradientChartOptionsConfigurationWithNumbersAndGrid
  });

  var e = document.getElementById("barChartSimpleGradientsNumbers").getContext("2d");

  gradientFill = ctx.createLinearGradient(0, 170, 0, 50);
  gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
  gradientFill.addColorStop(1, hexToRGB('#2CA8FF', 0.6));

  var a = {
    type: "bar",
    data: {
      labels: ['${days12}', '${days11}', '${days10}', '${days9}', '${days8}', '${days7}', '${days6}', 
      	'${days5}', '${days4}', '${days3}', '${days2}', '${days1}'],
      datasets: [{
        label: "Insert Moneyio",
        backgroundColor: gradientFill,
        borderColor: "#2CA8FF",
        pointBorderColor: "#FFF",
        pointBackgroundColor: "#2CA8FF",
        pointBorderWidth: 2,
        pointHoverRadius: 4,
        pointHoverBorderWidth: 1,
        pointRadius: 4,
        fill: true,
        borderWidth: 1,
        data: ['${moneyioCount11}', '${moneyioCount10}', '${moneyioCount9}', '${moneyioCount8}', 
        	  '${moneyioCount7}', '${moneyioCount6}', '${moneyioCount5}', '${moneyioCount4}', 
        	  '${moneyioCount3}', '${moneyioCount2}', '${moneyioCount1}', '${moneyioCount0}']
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: false
      },
      tooltips: {
        bodySpacing: 4,
        mode: "nearest",
        intersect: 0,
        position: "nearest",
        xPadding: 10,
        yPadding: 10,
        caretPadding: 10
      },
      responsive: 1,
      scales: {
        yAxes: [{
          gridLines: 0,
          gridLines: {
            zeroLineColor: "transparent",
            drawBorder: false
          }
        }],
        xAxes: [{
          display: 0,
          gridLines: 0,
          ticks: {
            display: false
          },
          gridLines: {
            zeroLineColor: "transparent",
            drawTicks: false,
            display: false,
            drawBorder: false
          }
        }]
      },
      layout: {
        padding: {
          left: 0,
          right: 0,
          top: 15,
          bottom: 15
        }
      }
    }
  };

  var viewsChart = new Chart(e, a);
},

initGoogleMaps: function() {
  var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
  var mapOptions = {
    zoom: 13,
    center: myLatlng,
    scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
    styles: [{
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [{
        "color": "#e9e9e9"
      }, {
        "lightness": 17
      }]
    }, {
      "featureType": "landscape",
      "elementType": "geometry",
      "stylers": [{
        "color": "#f5f5f5"
      }, {
        "lightness": 20
      }]
    }, {
      "featureType": "road.highway",
      "elementType": "geometry.fill",
      "stylers": [{
        "color": "#ffffff"
      }, {
        "lightness": 17
      }]
    }, {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [{
        "color": "#ffffff"
      }, {
        "lightness": 29
      }, {
        "weight": 0.2
      }]
    }, {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [{
        "color": "#ffffff"
      }, {
        "lightness": 18
      }]
    }, {
      "featureType": "road.local",
      "elementType": "geometry",
      "stylers": [{
        "color": "#ffffff"
      }, {
        "lightness": 16
      }]
    }, {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [{
        "color": "#f5f5f5"
      }, {
        "lightness": 21
      }]
    }, {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [{
        "color": "#dedede"
      }, {
        "lightness": 21
      }]
    }, {
      "elementType": "labels.text.stroke",
      "stylers": [{
        "visibility": "on"
      }, {
        "color": "#ffffff"
      }, {
        "lightness": 16
      }]
    }, {
      "elementType": "labels.text.fill",
      "stylers": [{
        "saturation": 36
      }, {
        "color": "#333333"
      }, {
        "lightness": 40
      }]
    }, {
      "elementType": "labels.icon",
      "stylers": [{
        "visibility": "off"
      }]
    }, {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [{
        "color": "#f2f2f2"
      }, {
        "lightness": 19
      }]
    }, {
      "featureType": "administrative",
      "elementType": "geometry.fill",
      "stylers": [{
        "color": "#fefefe"
      }, {
        "lightness": 20
      }]
    }, {
      "featureType": "administrative",
      "elementType": "geometry.stroke",
      "stylers": [{
        "color": "#fefefe"
      }, {
        "lightness": 17
      }, {
        "weight": 1.2
      }]
    }]
  };

  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

  var marker = new google.maps.Marker({
    position: myLatlng,
    title: "Hello World!"
  });

  // To add the marker to the map, call setMap();
  marker.setMap(map);
}
};
    
    
  </script>
</body>