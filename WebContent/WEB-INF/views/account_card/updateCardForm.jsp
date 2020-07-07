<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	function selectAccountCompany(){
		$.ajax({
			type : "POST",
			url : "account_num.mw",
			data : {account_company:$("#bank").val()},
			success : function(data){
				$("#account_num").html(data);
			}
		});
		
	}
</script>
<br><br><br>
<center><h1>${reg_card.card_name}카드 수정</h1></center>
<br><br>
<div class="form-group">
<form method="post" action="updateCardPro.mw">
	<input type="hidden" name="num" value="${reg_card.num}">
	
	<table class="table table-hover" align="center">
		<tr>
			<td>카드사</td><td>${reg_card.card_company}</td>
		</tr>
		
		<tr>
			<td>카드명</td><td>${reg_card.card_name}</td>
		</tr>
		
		<tr>
			<td>카드별칭</td><td><input type="text" name="card_nickname" class="form-control" id="inputDefault" value="${reg_card.card_nickname}"></td>
		</tr>
		
		<tr>
			<td>은행사</td>
			<td>
				<select class="custom-select" name="account_company" id="bank" onchange="selectAccountCompany()">
					<option value=""></option>
				<c:forEach var="adto" items="${reg_account}">
					<option value="${adto.account_company}">${adto.account_company}</option>
				</c:forEach>
				</select>	
			</td>
		</tr>
		
			<tr>
				<td>계좌번호</td>
				<td id="account_num"></td>
			</tr>
		
	</table>
	<center><input type="submit" value="수정" class="btn btn-outline-primary"></center>
</form>
</div>