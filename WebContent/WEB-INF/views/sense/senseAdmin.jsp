<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>

<title>Sense 관리</title>

</head>
<body>
&nbsp
	<h1 align="center">Sense관리</h1> <!-- a태그넣기  -->
&nbsp
	<div align="center">
		<div class="left-box" style="float: left; margin-right:10px;">
			<h2 align="center" >오늘의 영상</h2>
&nbsp
			<div id="video_url">
				<iframe width="850" height="478" src="https://www.youtube.com/embed/${video.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
			</div>
		</div>
		
			<!-- 카테고리 리스트 -->	
		<div class="right-box" style="float: left;">
			<div align=center>
				<table class="btn-group btn-group-toggle" data-toggle="buttons" >
					<tr>
						<c:forEach var="category" items="${ category }">
							<td class="btn btn-primary" align = center onclick="categoryAdmin(${ category.num })">
								${ category.sense_detail_category }
							</td>								
						</c:forEach>
					</tr>
				</table>
			</div>
			&nbsp
			<div>
				<div id="mainList" style="overflow:auto; width:800px; height:500px;"> <!-- 기본 메인에서 리스트를 가져오고/ 카테고리 선택 시 ajax를 통해 리스트를 가져옴 -->
					<c:forEach items="${ list }" var="list">	
						<table class="list-group">
							<!-- 첫 페이지일 경우 : category=null -->
							<tr class="list-group-item d-flex justify-content-between align-items-center">
							<!-- 썸네일이미지> --> 
								<td onclick="detail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_thumbnail }/default.jpg" alt="Page Not Found"/></td>
								<td onclick="detail(${ list.num })">${ list.sense_title }</td>
								<td class="badge badge-primary badge-pill" id="readcount"> ${ list.readcount } </td>
							</tr>
							<tr>	
								<td>
									<input type="button" value="수정" class="btn-group btn-group-toggle" data-toggle="buttons" onclick="location.href='/moneyWatch/senseModify.mw?num=${list.num}'"/>
								</td>	
								<td>
									<input type="button" value="삭제" class="btn-group btn-group-toggle" data-toggle="buttons" onclick="senseDelete(${list.num})">      
								</td>
							</tr>
						</table>
					</c:forEach>	
				</div>
			</div>		
		</div>
	</div>
</body>
</html>