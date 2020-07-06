<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<br><br>
<center><h3>20대 카드 순위</h3></center>
<br><br>

<c:set var="count" value="1"></c:set>
<table class="table table-hover" style="text-align:center; width:50%;"align="center">
	<tr class="table-primary"><th scope="row"></th><th scope="row">카드사</th><th scope="row">카드명</th></tr>
<c:forEach var="rankList_20" items="${rankList_20}">
		<tr>
			<td>${count}위</td>
			<td>${rankList_20.card_company}</td>
			<td>${rankList_20.card_name}</td>
		</tr>
<c:set var="count" value="${count+1}"></c:set>
</c:forEach>			
</table>

<br><br>
<center><h3>30대 카드 순위</h3></center>
<br><br>

<c:set var="count" value="1"></c:set>
<table class="table table-hover" style="text-align:center; width:50%;"align="center">
	<tr class="table-primary"><th scope="row"></th><th scope="row">카드사</th><th scope="row">카드명</th></tr>
<c:forEach var="rankList_30" items="${rankList_30}">
		<tr>
			<td>${count}위</td>
			<td>${rankList_30.card_company}</td>
			<td>${rankList_30.card_name}</td>
		</tr>
<c:set var="count" value="${count+1}"></c:set>
</c:forEach>			
</table>

<br><br>
<center><h3>40대 카드 순위</h3></center>
<br><br>

<c:set var="count" value="1"></c:set>
<table class="table table-hover" style="text-align:center; width:50%;"align="center">
	<tr class="table-primary"><th scope="row"></th><th scope="row">카드사</th><th scope="row">카드명</th></tr>
<c:forEach var="rankList_40" items="${rankList_40}">
		<tr>
			<td>${count}위</td>
			<td>${rankList_40.card_company}</td>
			<td>${rankList_40.card_name}</td>
		</tr>
<c:set var="count" value="${count+1}"></c:set>
</c:forEach>			
</table>
