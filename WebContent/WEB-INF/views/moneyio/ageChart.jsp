<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>

<html>
<head>
<title>연령대별 지출 chart</title>
<script type="text/javascript"
	src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
<script type="text/javascript"
	src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>


<script type="text/javascript">
	FusionCharts.ready(function() {

		var chartObj20 = new FusionCharts({
			type : 'radar',
			renderAt : 'chart-container20',
			width : '850',
			height : '550',
			dataFormat : 'json',
			dataSource : {
				"chart" : {
					"caption" : "20대 지출 랭킹 5 (단위:만)",
					"subCaption" : "Based on moneyWatch customer",
					"numberPreffix" : "$",
					"theme" : "fusion",
					"radarfillcolor" : "#BC71C7",
				},
				"categories" : [ {
					"category" : [ {

						"label" : "${chart_list20[0].io_category}"
					}, {
						"label" : "${chart_list20[1].io_category}"
					}, {
						"label" : "${chart_list20[2].io_category}"
					}, {
						"label" : "${chart_list20[3].io_category}"
					}, {
						"label" : "${chart_list20[4].io_category}"
					} ]
				} ],
				"dataset" : [ {
					"seriesname" : "20s' Expenditure",
					"data" : [ {
						"value" : '${chart_list20[0].io_price/10000}'
					}, {
						"value" : '${chart_list20[1].io_price/10000}'
					}, {
						"value" : '${chart_list20[2].io_price/10000}'
					}, {
						"value" : '${chart_list20[3].io_price/10000}'
					}, {
						"value" : '${chart_list20[4].io_price/10000}'
					} ]
				} ]
			}
		});
		chartObj20.render();
	});
	

	FusionCharts.ready(function() {
		var chartObj30 = new FusionCharts({
			type : 'radar',
			renderAt : 'chart-container30',
			width : '850',
			height : '550',
			dataFormat : 'json',
			dataSource : {
				"chart" : {
					"caption" : "30대 지출 랭킹 5 (단위:만)",
					"subCaption" : "Based on moneyWatch customer",
					"numberPreffix" : "$",
					"theme" : "fusion",
					"radarfillcolor" : "#6CBD87",
				},
				"categories" : [ {
					"category" : [ {
						"label" : "${chart_list30[0].io_category}"
					}, {
						"label" : "${chart_list30[1].io_category}"
					}, {
						"label" : "${chart_list30[2].io_category}"
					}, {
						"label" : "${chart_list30[3].io_category}"
					}, {
						"label" : "${chart_list30[4].io_category}"
					} ]
				} ],
				"dataset" : [ {
					"seriesname" : "30s' Expenditure",
					"data" : [ {
						"value" : "${chart_list30[0].io_price/10000}"
					}, {
						"value" : "${chart_list30[1].io_price/10000}"
					}, {
						"value" : "${chart_list30[2].io_price/10000}"
					}, {
						"value" : "${chart_list30[3].io_price/10000}"
					}, {
						"value" : "${chart_list30[4].io_price/10000}"
					} ]
				} ]
			}
		});
		chartObj30.render();
	});

	FusionCharts.ready(function() {
		var chartObj40 = new FusionCharts({
			type : 'radar',
			renderAt : 'chart-container40',
			width : '850',
			height : '550',
			dataFormat : 'json',
			dataSource : {
				"chart" : {
					"caption" : "40대 지출 랭킹 5 (단위:만)",
					"subCaption" : "Based on moneyWatch customer",
					"numberPreffix" : "$",
					"theme" : "fusion",
					"radarfillcolor" : "#C7C071",
				},
				"categories" : [ {
					"category" : [ {
						"label" : "${chart_list40[0].io_category}"
					}, {
						"label" : "${chart_list40[1].io_category}"
					}, {
						"label" : "${chart_list40[2].io_category}"
					}, {
						"label" : "${chart_list40[3].io_category}"
					}, {
						"label" : "${chart_list40[4].io_category}"
					} ]
				} ],
				"dataset" : [ {
					"seriesname" : "40s' Expenditure",
					"data" : [ {
						"value" : "${chart_list40[0].io_price/10000}"
					}, {
						"value" : "${chart_list40[1].io_price/10000}"
					}, {
						"value" : "${chart_list40[2].io_price/10000}"
					}, {
						"value" : "${chart_list40[3].io_price/10000}"
					}, {
						"value" : "${chart_list40[4].io_price/10000}"
					} ]
				} ]
			}
		});
		chartObj40.render();
	});
</script>

</head>
<body>
<br/>
	<table style="margin:auto;">
		<tr>
			<td><div id="chart-container20">FusionCharts XT will load
					here!</div></td>

			<td><div id="chart-container30">FusionCharts XT will load
					here!</div></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chart-container40" style="align:center; margin-left:25%;">FusionCharts XT will load
					here!</div></td>
			<td></td>
		</tr>
	</table>


</body>
</html>

<%@ include file = "/WEB-INF/views/main/footer.jsp" %>