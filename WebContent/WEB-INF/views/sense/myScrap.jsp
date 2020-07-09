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

<title>My scrap page</title>
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
<body>
<br/>
	<h1 align="center">My Scrap</h1>
<br/>

	<div align="center">
		<div class="left">
			<div id="my_video">
				<!-- 리스트 클릭시 영상 ajax로 호출 -->
			</div>
		</div>
		
			<!-- 카테고리 리스트 -->	
		<div class="right">
			<div align=center>
				<table style="margin:0 auto;">
					<tr>
						<c:forEach var="category" items="${ category }">
							<td>
								<input type="button" class="btn btn-outline-info" class="btn btn-primary"  value="${ category.sense_detail_category }" onclick="myscrapCategory(${ category.num })">&nbsp;		
							</td>								
						</c:forEach>
					</tr>
				</table>
			</div>
			<br />

				<div id="myScrapList" style="overflow:auto; width:800px; height:500px;"> <!-- 기본 메인에서 리스트를 가져오고/ 카테고리 선택 시 ajax를 통해 리스트를 가져옴 -->
					<c:forEach items="${ myscrap }" var="list">	
						<table class="list-group">
							<!-- 첫 페이지일 경우 : category=null -->
							<tr class="list-group-item d-flex justify-content-between align-items-center">
								<td onclick="mydetail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_url }/default.jpg" alt="Page Not Found"/></td>
								<td onclick="mydetail(${ list.num })">${ list.sense_title }</td>
								<td><input type="button" class="btn btn-danger" value="삭제" onclick="deletescrap(${list.num})"/></td>
							</tr>
							<tr>
								<table id="detail${list.num }" onclick="click(${list.num })">
								</table>
							</tr>
						</table>
					</c:forEach>	
				</div>
			</div>
		</div>

</body>
<div class="jumbotron text-center" style="margin-bottom:0; margin-top:30%;">
   <p>mw 주식회사  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   전화번호 02) 1111-1111 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    || &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="siteMap.mw">사이트맵</a></p>
</div>
</html>