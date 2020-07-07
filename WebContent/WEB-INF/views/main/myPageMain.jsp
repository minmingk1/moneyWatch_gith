<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

	<title>My first chart using FusionCharts Suite XT</title>
	<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
	<script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
	<script type="text/javascript">
		FusionCharts.ready(function(){
			var chartObj = new FusionCharts({
    type: 'scrollColumn2d',
    renderAt: 'chart-container',
    width: '750',
    height: '550',
    dataFormat: 'json',
    dataSource: {
        "chart": {
            "theme": "fusion",
            "caption": "나의 통장",
            "subcaption": "통계 차트",
            "xaxisname": "카테고리",
            "yaxisname": "Won",
            "showvalues": "1",
            "numberprefix": "",
            "numVisiblePlot": "12",
            "scrollheight": "10",
            "flatScrollBars": "1",
            "scrollShowButtons": "0",
            "scrollColor": "#cccccc",
            "showHoverEffect": "1"
        },
        "categories": [{
            "category": [{
                "label": "지출"
            }, {
                "label": "수입"
            }, {
                "label": "전 재산"
            }]
        }],
        "dataset": [{
            "data": [{
                "value": "${thisOut}"
            }, {
                "value": "${thisIn}"
            }, {
                "value": "${all_balance}"
            }]
        }]
    }
});
			chartObj.render();
		});
	</script>
	</head>
	<body>
	  <h2>이번 달 나의 지출/수입</h2>
      <h5>${today}</h5><br /><br />
      <div class="fakeimg" style="height:60%;">
      <div id="chart-container">FusionCharts XT will load here!</div>
      </div>
	</body>
</html>

  	
     