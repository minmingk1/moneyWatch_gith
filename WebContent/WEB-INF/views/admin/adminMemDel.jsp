<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>MEMBER delete</title>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<script language="javaScript">
	function check(form){
		if(document.selCheck.reason.value=="0"){
		alert("사유를 선택해주세요");
		return false;
	}
	form.submit();
}


</script>

<body><br/>
<h2 style="text-align:center;">회원 삭제</h2><br />
<h2 style="text-align:center;">${id} 계정 삭제 진행</h2><br />

<table align="center" style="margin:auto; width:60%;">
<tr scope="col">
<form name="selCheck" method="post" action="adminMemDelPro.mw?">
<td>
<select class="form-control" name="reason">
<option value="0">선택</option>
<option value="부정적 언어사용">부정적 언어사용</option>
<option value="부정적인 서버접속">부정적인 서버접속</option>
</select></td></tr>

<td>
	<input type="hidden" name="id" value="${id}" >
	<input type="button" class="btn btn-primary" value="회원 삭제" onClick="check(form)">
	<input type="button" class="btn btn-primary" value="취 소 " onclick="window.location='main.mw'">
</td>
</form>
</table>
</body>
</html>