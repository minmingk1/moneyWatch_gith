<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>My Monthly Consumption</title>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
<script type="text/javascript">
	FusionCharts.ready(function(){
			var chartObj = new FusionCharts({
    type: 'line',
    renderAt: 'chart-container',
    width: '720',
    height: '520',
    dataFormat: 'json',
    dataSource: {
        "chart": {
            "theme": "fusion",
            "caption": "+다음 달 예상 지출액 : ${estimate}원",
            "subCaption": "단위 (만)",
            "xAxisName": "Month",
            "yAxisName": "Won",
            "lineThickness": "5"
        },
        "data": [{
                "label": "5",
                "value": '${sum1}'
            },
            {
                "label": "6",
                "value": '${sum2}'
            },
            {
                "label": "7",
                "value": '${sum3}'
            },
            {
                "label": "8",
                "value": "${estimate}"
            }
        ]
        
    }
});
			chartObj.render();
		});
	</script>

<style>
table{
	text-align: center;
}
</style>
</head>

<body>

<div class="container mt-3" style="float: left; width: 30%; margin-left:15%; margin-right:5%;">
  <h5>${memId}님의 </h5><br />
  <h2>3개월 지출 내역 리스트</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">5월</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">6월</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">7월</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br> 
		<div class="card border-danger mb-3" style="max-width: 20rem;">
			<table class="table table-hover">
				<tr class="table-secondary">
	      			<td>카테고리</td>
					<td>금액</td>
    			</tr>
    			<c:forEach items="${list1}" var="list">
    			<tr>
					<td>${list.io_category}</td>
					<td><fmt:formatNumber value="${list.io_price}" pattern="#,###" /></td>
				</tr>
				</c:forEach>
				<tr class="table-secondary">
					<td>총 지출금액</td>
					<td><fmt:formatNumber value="${sum1}" pattern="#,###" /></td>
				</tr>
			</table>
		</div>
	</div>	
    <div id="menu1" class="container tab-pane fade"><br>
    	<div class="card border-primary mb-3" style="max-width: 20rem;">
			<table class="table table-hover">
				<tr class="table-info">
					<td>카테고리</td>
					<td>금액</td>
				</tr>
				<c:forEach items="${list2}" var="list">
					<tr>
						<td>${list.io_category}</td>
						<td><fmt:formatNumber value="${list.io_price}" pattern="#,###" /></td>
					</tr>
				</c:forEach>
				<tr class="table-info">
					<td>총 지출금액</td>
					<td><fmt:formatNumber value="${sum2}" pattern="#,###" /></td>
				</tr>
			</table>
		</div>
	</div>

    <div id="menu2" class="container tab-pane fade"><br>
    	<div class="card border-danger mb-3" style="max-width: 20rem;">
			<table class="table table-hover">
				<tr class="table-danger">
					<td>카테고리</td>
					<td>금액</td>
				</tr>
				<c:forEach items="${list3}" var="list">
					<tr>
						<td>${list.io_category}</td>
						<td><fmt:formatNumber value="${list.io_price}" pattern="#,###" /></td>
					</tr>
				</c:forEach>
				<tr class="table-danger">
					<td>총 지출금액</td>
					<td><fmt:formatNumber value="${sum3}" pattern="#,###" /></td>
				</tr>
			</table>
		</div>
	</div>
    </div>
  </div>
   
   <h5> </h5><br /><br /><br />
  <h2>3개월 지출 차트</h2>
  <div style="float: left; width: 50%; margin-top:5%;">
  	<div id="chart-container">FusionCharts XT will load here!</div>
  </div>


</body>
</html>

<div class="jumbotron text-center" style="margin-bottom:0; margin-top:45%;">
  <p>mw 주식회사  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   전화번호 02) 1111-1111 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="siteMap.mw">사이트맵</a></p>
</div>
