<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>수입/지출 리스트</title>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function filter(){
		$.ajax({
			url : "ioList.mw",
			data : {filter: $("#filter").val()},
			success : function(data){
				$("#ioList").html(data);
			}
		});
	}
	
	function detail(ioNum){
		var detail = "#detail"+ioNum;
		$.ajax({
			url : "ioListDetail.mw",
			data : {ioNum: ioNum},
			success : function(data){
				$(detail).html(data);
			}
		});
	}
</script>

<br/><br/>
<center>
<div class="form-group">
	<!-- 종합 -->
		<table class="table table-hover" border = "1" style="width:30%">
			<tr>
				<td colspan="2">
					<select class="form-control" id="filter" name="filter" onchange="filter()">
						<option value="all" selected>전체</option>
						<option value="inMoney">수입</option>
						<option value="outMoney">지출</option>					
					</select>			
				</td>
						
			</tr>
			<tr>
				<td scope="row" >
					마지막 업데이트 : ${nowDate}
				</td>	
				<td>			
					전체 남은 잔액 : <fmt:formatNumber value="${moneyioList[0].io_remain}" pattern="#,###"/> 원
				</td>
			</tr>
		</table>
	<br />
	
	
	
	<!-- 내역 출력 -->
	 <div id="ioList">
		<c:forEach var="ioListval" items="${moneyioList}">
			<table class="table table-hover" border = "1" style="width:40%; text-align:center;" >
<%-- 
				<tr>
					<td colspan="5">Number : ${ioListval.io_num}</td>
				</tr>
--%>		
				<tr class="table-info">
					<td width="300" onclick="detail(${ioListval.io_num})">
						${ioListval.io_reg_date}
					</td>
					<td width="300" onclick="detail(${ioListval.io_num})">
						${ioListval.io_detail}
					</td>

				</tr>
				<tr>

					<td width="100" onclick="detail(${ioListval.io_num})">
						거래 금액
					</td>
					<td width="100"  onclick="detail(${ioListval.io_num})">
						<fmt:setLocale value="ko"/>
				    	<fmt:formatNumber type="text" value="${ioListval.io_price}" pattern="#,###" var="price"/>
				      	${price}				
					</td>
				</tr>
				<tr>
				
					<table scope="row" width="500" border="1" colspan="5" id="detail${ioListval.io_num}">
					</table>
				</tr>
			</table>
		</c:forEach>		
	</div>
</div>
</center>

<%@ include file = "/WEB-INF/views/main/footer.jsp" %>

<!-- 
1) 팝업창으로 Detail 출력
2) 스크롤 내려서 출력 
-->


<%-- 
<table id="spreadsheet">
<c:forEach var="ioList" items="${moneyioList}"  varStatus="varStatus">
<tr>
<td>${ioList.io_num}</td>
<td>${ioList.io_category}</td>
<td>${ioList.io_detail}</td>
<td>${ioList.io_reg_date}</td>
<td>${ioList.io_price}</td>
<td>${ioList.io_remain}</td>
<td>${ioList.io_bank}</td>
<td>${ioList.io_account}</td>
<td>${ioList.id}</td>
<td>${ioList.io_n_div}</td>
<td>${ioList.io_set}</td>	
</tr>

</c:forEach>
</table> --%>

<!-- 
	1) 먼저 날짜를 출력(tr,td)
	2) 다른 날짜로 넘어갈 때까지 이전 인덱스의 날짜값과 현재 인덱스의 날짜값 if비교하여
		같은 날짜일 경우에는 1)의 날짜(tr,td)를 출력시키지 않도록 한다.
		(날짜가 다를 경우에만 출력)
	    -->

