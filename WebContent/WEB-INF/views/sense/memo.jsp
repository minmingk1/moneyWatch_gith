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
<body>
	<table>
		<tr>
			<td>${ dto.sense_title }</td>
		</tr>
		<tr>
			<td><input type="textbox" name="memo"/></td>
		</tr>
		<tr>
			<input type="button" value="스크랩" onclick="scrap(${dto.num})"/>
		</tr>
	</table>

</body>
</html>