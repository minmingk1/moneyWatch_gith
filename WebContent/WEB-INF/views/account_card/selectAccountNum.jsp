<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<div class="form-group">

<td>
	<select class="custom-select" name="account_num" id="bank_num">
	<c:forEach var="adto" items="${getAccount_num}">
		<option value="${adto.account_num}">${adto.account_num}</option>
	</c:forEach>
	</select>
</td>
</div>