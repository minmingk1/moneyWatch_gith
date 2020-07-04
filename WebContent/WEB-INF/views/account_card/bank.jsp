<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

		<div class="form-group">
		<td></td>
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
	   
	    <tr>
		<td><label class="col-form-label" for="inputDefault">계좌번호</label></td>
		<td><input type="text" name="account_num" class="form-control" id="inputDefault"></td>
	  	</tr>
	  		
	  	<tr>
		<td><label class="col-form-label" for="inputDefault">잔고</label></td>
		<td><input type="text"  name="balance" class="form-control" id="inputDefault"></td>
		</tr>
		</div>