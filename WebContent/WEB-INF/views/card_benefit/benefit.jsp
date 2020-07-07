<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<br><br>

<img src="/moneyWatch/image/${cardImg}"/>
<br><br>
<table class="table table-hover" width="50%" align="center">
<c:forEach var="cdto" items="${benefitList}">
	<tr class="table-light"><th scope="row">${cdto.all_benefit_name}</th>
	<td>${cdto.benefit_text_all}</td>
	</tr>
</c:forEach>
</table>
