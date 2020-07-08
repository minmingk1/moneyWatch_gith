<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<html>
<head>
<title>회원탈퇴 페이지</title>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>  
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

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
	<h3 style="text-align: center;">회원 탈퇴</h3><br />
	<table border="1" align="center" width="40%" style="text-align:center;">
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
		<tr>
		  <td colspan="2">
		  <input type="submit" class="btn btn-danger" value="회원 탈퇴" style="float:right;">
		  <input type="button"  class="btn btn-primary" value="취 소" onclick="javascript:window.location='/moneyWatch/main.mw'" style="float:left;">
		  </td>
		</tr>
	</table>
</div>
</form>
</head>
</body>
<div class="jumbotron text-center" style="margin-bottom:0; margin-top:16%;">
   <p>mw 주식회사  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   전화번호 02) 1111-1111 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="siteMap.mw">사이트맵</a></p>
</div>
</html>
