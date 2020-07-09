<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<html>
<head>
<title>MEMBER LIST</title>
</head>

<script language="javaScript">
function Search(){ 
		
	if(document.SearchForm.keyField.value=="0")
		alert("검색옵션을 선택해주세요");
		return false;
	}
	
function searchCheck(form){
	if(form.keyWord.value==""){ //검색창의 입력값 없을시에 나오는 출력문
		alert("검색 단어를 입력하세요");
		form.keyWord.focus(); // focus로 마지막 입력했던 텍스트로 커서 이동
		return;
	}
	form.submit();
}
</script>
<body><br/>

<h2 style="text-align:center;">회원 LIST</h2><br />

<table  align="center" style="margin:auto; width:60%;">

<tr scope="col">
<form name="SearchForm" method="post" onSubmit="memList.mw" >
<td>
<select class="form-control" name="keyField">
<option value="0">선택 </option>
<option value="name">이름</option>
<option value="id">아이디</option>
</select>
</td>
<td>
<input type="text" class="form-control" name="keyWord"></td>


<td>
<c:if test="${sessionScope.memId=='admin'}">
<input type="button" class="btn btn-primary" value="확인" onclick="searchCheck(form)">
</c:if>
</td>
<td align="right">
<input type="button" class="btn btn-primary" value="관리자 메인" onclick="window.location='admin.mw'">
</td>


</form>
</tr>
</table>
<br/>


<table border="1" cellpadding="0" cellspacing="0" class="table table-hover" style="margin:auto; width:60%;">
<tr class="table-dark">
	<td align="center">ID</td>
	<td align="center" >이름</td>
	<td align="center">성별</td>
	<td align="center">생년월일</td>	
	<td align="center">휴대폰번호</td>
	
</tr>



<c:forEach var="search" items="${search}">
<tr height="30" align="center" scope="row">
	<td align="center">${search.id}</td>
	<td align="center">${search.name}</td>
	<td align="center">${search.gender}</td>
	<td align="center">${search.birth_y}-${search.birth_m}-${search.birth_d}</td>
	<td align="center">${search.phone1}-${search.phone2}-${search.phone3}
	<input type="button" value="삭제" onClick="location.href='adminMemDel.mw?id=${search.id}'" /></td>
</tr>
</c:forEach>
</table>
<br/>

<table border="1" cellpadding="0" cellspacing="0" align="center" class="table table-hover" style="margin:auto; width:60%;">
<tr class="table-info">
	<td align="center">ID</td>
	<td align="center">이름</td>
	<td align="center">성별</td>
	<td align="center">생년월일</td>	
	<td align="center">휴대폰번호</td>
</tr>


<c:forEach var="list" items="${list}">
<tr height="30" align="center" class="table-light">
	<td align="center">${list.id}</td>
	<td align="center">${list.name}</td>
	<td align="center">${list.gender}</td>
	<td align="center">${list.birth_y}-${list.birth_m}-${list.birth_d}</td>
	<td align="center">${list.phone1}-${list.phone2}-${list.phone3}</td>
</tr>
</c:forEach>
</table>

</body>
</html>