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
	<!-- sense 메인 페이지에서 카테고리 선택시 ajax로 list를 불러옴  -->
			<c:forEach items="${ list }" var="list">
			<table class="list-group" >
				<tr class="list-group-item d-flex justify-content-between align-items-center">
					<!-- 썸네일이미지> --> 
					<td onclick="detail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_thumbnail }/default.jpg" alt="Page Not Found"/></td>
					<td onclick="detail(${ list.num })">${ list.sense_title }</td>
					<td class="badge badge-primary badge-pill" id="readcount"> ${ list.readcount } </td>
				</tr>
				<tr>	
					<td>
						<input type="button" value="수정" class="btn btn-info" onclick="location.href='/moneyWatch/senseModify.mw?num=${list.num}'"/>
					</td>	
					<td>
						<input type="button" value="삭제" class="btn btn-info" onclick="senseDelete(${list.num})">      
					</td>
				</tr>
			</table>
			</c:forEach>		
</body>
</html>