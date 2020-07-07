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

<title>금융 SenseUp Page</title>
<style>
.left{
	float:left;
	margin-left: 5%;
}
.right{
	float:right;
	margin-right: 5%;
}
</style>
</head>
<br /><br/>
<body>
	<h1 align="center">금융 SenseUp!!</h1> <!-- a태그넣기  -->
<br/>
<%-- 	<c:if test="${sessionScope.memId != null}">
		<h5><a class="btn btn-info" href="myscrap.mw">마이스크랩</a></h5>
	</c:if> --%>
	
	<div class="left">

			<h2 align="center" >오늘의 영상</h2>
&nbsp;
			<div id="video_url">
				<iframe width="850" height="478" src="https://www.youtube.com/embed/${video.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
					<c:if test="${sessionScope.memId != null}">
						<br /><input id="memo" type="button" class="btn btn-danger" value="스크랩" onclick="scrapmemo(${video.num})" style="float:right;"/>
						<h5><a class="btn btn-info" href="myscrap.mw" style="float:left;">마이스크랩</a></h5>
					</c:if>
			</div>

	</div>
	<div class="right">	
			<!-- 카테고리 리스트 -->	

				<table style="margin:0 auto;">
					<tr>
						<c:forEach var="category" items="${ category }">
							<td>
								<input type="button" class="btn btn-outline-primary" onclick="category(${ category.num })" value="${ category.sense_detail_category }"/>&nbsp;		
							</td>								
						</c:forEach>
					</tr>
				</table>
			<br/>
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
						</table>
					</c:forEach>	
				</div>
				</div>
	



</body>
</html>
<div class="jumbotron text-center" style="margin-bottom:0; margin-top:40%;">
  <p>Footer</p>
</div>