<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<html>
<head>
<title>회원탈퇴 페이지</title>


<script language="javaScript">
	function begin(){
		document.myform.pw.focus();
	}
	
	function checkIt(){
		if(!document.myform.pw.value){
			alert("비밀번호를 입력해주세요");
			document.myform.pw.focus();
			return false;	
			}
		}
</script>
<body onload="begin()" ><br/><br />

<form name="myform" action="/moneyWatch/memOutPro.mw" method="post" onSubmit="return checkIt()">
<div class="form-group">
	<h3 style="margin-left:34%;">회원 탈퇴</h3><br /><br />
	<table border="1" align="center" width="40%" style="text-align:center; margin-left:20%;">
		<tr>
			<td>탈퇴사유</td>
			<td>
			  <select class="form-control" name="reason">
				  <option value="none">--이유선택--</option>
				  <option value="사용불편">사용 불편</option>
				  <option value="접근성 떨어짐</">접근성 떨어짐</option>
			  </select>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
		  	<td>
		  	<input type="password" class="form-control" name="pw" size="15" maxlength="12">
		  	</td>
		</tr>
	</table><br/>
	<input type="submit" class="btn btn-danger" value="회원 탈퇴" style="float:right; margin-right:40%;" >
	<input type="button"  class="btn btn-primary" value="취 소" onclick="javascript:window.location='/moneyWatch/main.mw'" style="float:right; margin-right:2%;">
</div>
</form>
</head>
</body>