<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>

</head>
<body><br/>
<div class="form-group">
	<table align="center" width="80%;">
		<tr>
			<td>${ dto.sense_title }</td>
		</tr>
		<tr></tr>
		<tr>
			<td><textarea cols="20" rows="10" class="form-control" name="memo"><input type="text" name="memo"/>메모를 입력하세요.</textarea></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-info" value="스크랩" onclick="scrap(${dto.num})" style="float:right;"/></td>
		</tr>
	</table>
</div>
</body>
</html>