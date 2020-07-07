<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>   

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>	
<script language="javascript">

	function setSelectBox(){
		$.ajax({
			type: "POST",
			url: "benefit_select.mw", // 데이터를 넘겨줄 url
			data: {cardCompany:$("#company").val()}, // 설정한 url에 넘겨줄 데이터
			success: function(data){
				$("#select_card").html(data); // 다시 받아온 데이터를 넣어줄 곳
			}			
		});
	}
	
</script>

<br><br><br>
<div class="form-group" >
<center><h1>카드혜택</h1></center>
<table align="center" width="30%">
    <td>
    	<select class="custom-select" name="ca_company" id="company" onchange="setSelectBox()">
    		<option value="">카드사</option>
			<c:forEach var = "cdto" items="${card_company_list}" >
				<option value="${cdto.company}">${cdto.company}</option>
			</c:forEach>
    	</select>
    </td>
   
  	<div class="form-group">
		<table align="center" width="30%" id="select_card">

		</table>
	</div>
</table>
</div>
<br><br><br><br><br><br><br><br><br>
<%@ include file = "/WEB-INF/views/main/footer.jsp" %>