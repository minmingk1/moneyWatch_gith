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
<c:forEach var="rankList" items="${rankList}">
		<tr>
			<td>${count}위</td>
			<td>${rankList.card_company}</td>
			<td>${rankList.card_name}</td>
		</tr>
<c:set var="count" value="${count+1}"></c:set>
</c:forEach>			
</table>