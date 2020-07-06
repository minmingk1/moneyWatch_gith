<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>	
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script language="javascript">


	function setSelectBox(){
		$.ajax({
			type: "POST",
			url: "select_card.mw", // 데이터를 넘겨줄 url
			data: {cardCompany:$("#company").val()}, // 설정한 url에 넘겨줄 데이터
			success: function(data){
				$("#select_card").html(data); // 다시 받아온 데이터를 넣어줄 곳
			}			
		});
	}
	
</script>
		<br>
		<div class="form-group">
		<td>
	    <select class="custom-select" name="card_company" id="company" onchange="setSelectBox()">
	      <option selected="">카드사</option>
	      <c:forEach var = "cdto" items="${card_company_list}">
	     	<option value="${cdto.company}">${cdto.company}</option>
	      </c:forEach>
	    </select>
	  </div>
		</td>
		
		<td><label id="select_card" ></label></td>
		
		<div class="form-group">
			<td><label class="col-form-label" for="inputDefault">카드별칭</label></td>
	  		<td><input type="text" name="card_nickname" class="form-control"id="inputDefault"></td>
  		</div> 
  		
	    <div class="form-group">
	    <td>
	    <select class="custom-select" name="account_company" id="bank">
				<option value="은행명">은행명</option>
				<option value="우리은행">우리은행</option>
				<option value="기업은행">기업은행</option>
				<option value="신한은행">신한은행</option>
				<option value="농협은행">농협은행</option>
				<option value="하나은행">하나은행</option>
				<option value="국민은행">국민은행</option>
				<option value="수협">수협</option>
	    </select>
	    </td>
		  <td><label class="col-form-label" for="inputDefault">연결된 계좌번호</label></td>
		  <td><input type="text" name="account_num" class="form-control" id="inputDefault"></td>
	  </div>		
		
		
	<div class="form-group">
		  <td><label class="col-form-label" for="inputDefault">잔고</label></td>
		  <td><input type="text"  name="balance" class="form-control" id="inputDefault"></td>
		</div>