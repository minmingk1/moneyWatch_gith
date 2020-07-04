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
	<c:forEach items="${ myscraplist }" var="list">	
		<table class="list-group">
			<tr class="list-group-item d-flex justify-content-between align-items-center">
				<td onclick="mydetail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_url }/default.jpg" alt="Page Not Found"/></td>
				<td onclick="mydetail(${ list.num })">${ list.sense_title }</td>
				<td><input type="button" value="삭제" onclick="deletescrap(${list.num})"/></td>
			</tr>
			<tr>
				<table id="detail${list.num }">
				</table>
			</tr>
		</table>
	</c:forEach>	
</body>
</html>