<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
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



	<!-- 내역 출력 -->
	 <div id="ioList">
		<c:forEach var="ioListval" items="${moneyioList}">
			<table border = "1" width="500">
<%-- 
				<tr>
					<td colspan="5">Number : ${ioListval.io_num}</td>
				</tr>
--%>		
				
				<tr>
					<td align = center width="300" bgcolor="gray" onclick="detail(${ioListval.io_num})">
						${ioListval.io_reg_date}
					</td>
					<td align = right width="100" onclick="detail(${ioListval.io_num})">
						거래 금액
					</td>
					<td align = right width="100" onclick="detail(${ioListval.io_num})">					
						<fmt:formatNumber value="${ioListval.io_price}" pattern="#,###"/> 원
					</td>
				</tr>
				<tr>
					<td align = center width="300" onclick="detail(${ioListval.io_num})">
						${ioListval.io_detail}
					</td>
					<td align = right width="100" onclick="detail(${ioListval.io_num})">
						남은 잔액
					</td>
					<td align = right width="100" onclick="detail(${ioListval.io_num})">
						<fmt:formatNumber value="${ioListval.io_remain}" pattern="#,###"/> 원
					</td>
				</tr>
				<tr>
					<table width="500" border="1" colspan="5" id="detail${ioListval.io_num}">
					</table>
				</tr>
			</table>
		</c:forEach>		
	</div>