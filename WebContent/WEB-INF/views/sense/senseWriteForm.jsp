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
<title>senseWriteForm</title>

</head>
<body>
	<h1 align="center">당신의 sense를 입력하세요 관리자야^^</h1>
	
	<form action="senseWritePro.mw" method="post">
	<table align="center">
		<tr>
			<td>제목 : </td>
			<td>
				<input type="text" id="sense_title" name="sense_title"/>
			</td>
		</tr>
		<tr>
			<td>메인</td>
			<td>
				<input type="radio" id="main_set" name="main_set" value="1" />메인노출
				<input type="radio" id="main_set" name="main_set" value="0" checked/>메인안함
			</td>
		</tr>
		<tr>
			<td>카테고리 :</td>
			<td>  <!-- for문 돌려서 셀렉트 -->
				<select name="sense_category">
						<option>--카테고리--</option>
					<c:forEach var="list" items="${ list }">				
						<option>${ list.sense_detail_category }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>내용 : </td> 
			<td>	
				<input type="text" id="sense_content" name="sense_content"/>
			</td>
		</tr>
		<tr>
			<td>URL : </td>
			<td>
				<input type="text" id="sense_url" name="sense_url"/>
			</td>
		</tr>
		<tr>
			<td>THUMBNAIL : </td>
			<td>
				<input type="text" id="sense_thumbnail" name="sense_thumbnail"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="저장"/>
			</td> 
		</tr>
	</table>
	</form>
</body>
</html>