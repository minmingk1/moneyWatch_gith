<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기2</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>

table{
	border-collapse:separate;
	border-spacing: 0 10px;
}
td{
	text-align: center;
}
</style>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body><br/><br/><br/>
<div class="form-group row">

  <c:if test="${check==1}">
  	<table border="0" align="center" width="40%">
  			<tr><td colspan="2"><h5>${name}님의 아이디는</h5></td></tr>
  			<tr><td colspan="2"><h4>${id}</h4>입니다.</td>
  			</tr>
  			<tr>
  			<td><a href="/moneyWatch/member/pwFindForm.mw"><button class="btn btn-primary">비밀번호 찾기</button></a></td>
  			<td><a href="/moneyWatch/index.mw"><button class="btn btn-primary">로그인</button></a></td>
  			</tr>
  		</table>		
  </c:if>
	<c:if test="${check!=1}">
  		<table border="0" align="center" width="40%">
  			<tr><td>${name}님의</td></tr>
  			<tr><td>아이디가 존재하지 않습니다.</td></tr>
  		</table>
	</c:if>
</div>
</body>
</html>