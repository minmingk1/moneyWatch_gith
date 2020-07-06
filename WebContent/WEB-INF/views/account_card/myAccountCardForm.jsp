<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<br><br><br>
<div class="form-group">
<h1><center>등록된 나의 카드 및 계좌</center></h1>

	 <c:if test="${empty myCardList && empty myAccountList}">

		<table class="table table-hover">
			<tr>
				<td>등록된 카드 및 계좌가 없습니다.</td>
			</tr>
		</table>
		
	</c:if>

<c:if test="${!empty myCardList}">	
<h3>카드목록</h3>

<table class="table table-hover" border="1">
	 <tr class="table-primary">
      <th scope="row">카드사</th><th>카드명</th><th>카드별칭</th><th>연결된계좌</th><th>삭제</th>
     </tr>
	<c:forEach var="cdto" items="${myCardList}">
		<tr align="center">
			<td>${cdto.card_company}</td><td><a href="mycardBenefit.mw?card_name=${cdto.card_name}">${cdto.card_name}</a></td></form>
			<td>${cdto.card_nickname}</td><td>${cdto.account_num}</td><td><a href='myCardDel.mw?num=${cdto.num}'>삭제</a></td>
		</tr>	
	</c:forEach>
</table>
</c:if>

<c:if test="${!empty myAccountList}">	
<h3>계좌목록</h3>
<table class="table table-hover" border="1">
	<tr class="table-primary">
		<th scope="row">은행명</th><th scope="row">계좌번호</th><th scope="row">계좌잔고</th><th scope="row">삭제</th>
    </tr>
    
	<c:forEach var="adto" items="${myAccountList}">
		<tr align="center">
			<td>${adto.account_company}</td><td>${adto.account_num}</td><td><fmt:formatNumber value="${adto.balance}" pattern="#,###"/></td>
			<td><a href='myAccountDel.mw?num=${adto.num}'>삭제</a></td>
		</tr>	
	</c:forEach>
</table>
</c:if>
<br>

<div>
<center>
<button type="button" class="btn btn-outline-primary" onclick="window.location='/moneyWatch/account_cardForm.mw'">등록하기</button>
</center>

</div>