<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<br>
<center><h1>${card_name}혜택</h1></center>
<br><br>

<center><img src="/moneyWatch/image/${card_img}"/></center>
<br><br>
<table class="table table-hover" style="width:80%; text-align:center;" align="center">
<c:forEach var="cdto" items="${myBenefit}">	
		<tr class="table-light">
			<th style="text-align:center;">${cdto.all_benefit_name}</th>
			<td>${cdto.benefit_text_all}</td>
		</tr>
	
</c:forEach>
</table>	
<center><input type="button" class="btn btn-outline-primary" value="목록으로" onclick="history.go(-1)"/></center>	
