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

<title>My scrap page</title>

</head>
<body>
&nbsp
	<h1 align="center">My Scrap</h1> <!-- a태그넣기  -->
&nbsp
	<div align="center">
		<div class="left-box" style="float: left; margin-right:10px;">
&nbsp
			<div id="my_video">

			</div>
		</div>
		
			<!-- 카테고리 리스트 -->	
		<div class="right-box" style="float: left;">
			<div align=center>
				<table class="btn-group btn-group-toggle" data-toggle="buttons" >
					<tr>
						<c:forEach var="category" items="${ category }">
							<td class="btn btn-primary" align = center onclick="myscrapCategory(${ category.num })">
								${ category.sense_detail_category }
							</td>								
						</c:forEach>
					</tr>
				</table>
			</div>
			&nbsp
			<div>
				<div id="myScrapList" style="overflow:auto; width:800px; height:500px;"> <!-- 기본 메인에서 리스트를 가져오고/ 카테고리 선택 시 ajax를 통해 리스트를 가져옴 -->
					<c:forEach items="${ myscrap }" var="list">	
						<table class="list-group">
							<!-- 첫 페이지일 경우 : category=null -->
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>