<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>
 
</head>
<body>
<!-- 센스 디테일 페이지 / 리스트 클릭 시 작동-->
	<table>
		<tr>
			<td onclick="click(${detail.num })">${ detail.memo }</td>
		</tr>
	</table>
</body>
</html>