<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	var old_detail;
	function detail(ioNum){
		var detail = "#detail"+ioNum;
		$.ajax({
			url : "ioListDetail.mw",
			data : {ioNum: ioNum},
			success : function(data){				
				$(old_detail).empty();				
				old_detail = detail;				
				$(detail).html(data);				
			}
		});
	}
</script>
	<!-- 내역 출력 -->
	 <div id="ioList">
		<c:forEach var="ioListval" items="${moneyioList}">
			<table  class="table table-hover" border = "1" style="width:40%; text-align:center;">
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
					<td width="100" onclick="detail(${ioListval.io_num})">					
						<fmt:formatNumber value="${ioListval.io_price}" pattern="#,###"/> 원
					</td>

				</tr>
				<tr>
					<table scope="row" width="500" border="1" colspan="5" id="detail${ioListval.io_num}">
					</table>
				</tr>
			</table>
		</c:forEach>		
	</div>