<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>   

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script language="javascript">

	function selectCard(){
		$.ajax({
			type : "POST",
			url : "card.mw",
			data : {card_num:$("input[name=ca_set]").val()},
			success : function(data){
				$("#select").html(data);
			}
		});
		
	}
	
	function selectBank(){
		$.ajax({
			type : "POST",
			url : "bank.mw",
			data : {bank_num:$("input[name=ca_set]").val()},
			success : function(data){
				$("#select").html(data);
				
			}
		});
		
	}
	
</script>

<br><br><br>
<div class="form-group" id="iframe">
<center><h1>카드/계좌 등록</h1></center>
<br>
<form name = "card_info" method="post" action="account_cardPro.mw">

	<input type="hidden" name="id" value="${memId}">
	<table align="center" width="50%" >

		<tr>
  			<td><legend>카드/계좌</legend></td>
  			<td>
    		<div class="custom-control custom-radio">
      			<input type="radio" name="ca_set" id = "customRadio1" class="custom-control-input" value="0" onclick="selectCard()">
      			<label class="custom-control-label" for="customRadio1">카드</label>
    		</div>
   			</td>
   			
   			<td>
    		<div class="custom-control custom-radio">
      			<input type="radio" name="ca_set" id = "customRadio2" class="custom-control-input" value="1" onclick="selectBank()" >
      			<label class="custom-control-label" for="customRadio2">계좌</label>
    		</div>
    		</td>			
  		</tr>	
		
		<div class="form-group">
			<table align="center" width="80%" id="select">

			</table>
		</div>
		
		<tr>
			<td colspan="4" align="center"><center><input type="submit" value="등록" class="btn btn-outline-primary"></center></td>
		</tr>
		
</div>
</table>
</form>
<br><br><br><br><br>
<%@ include file = "/WEB-INF/views/main/footer.jsp" %>