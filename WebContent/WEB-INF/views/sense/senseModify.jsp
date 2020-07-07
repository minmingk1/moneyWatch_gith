<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>senseModify page</title>
</head>
<body>
<form action="senseModifyPro.mw" method="post">
	<table align=center border="1">
		<div>
			<tr>
				<!-- 썸네일이미지> --> 
				<td colspan=6><img src="https://img.youtube.com/vi/${ modify.sense_thumbnail }/sddefault.jpg" alt="Page Not Found"/></td>
			</tr>
		</div>
		<div>
			<tr>
				<td>번호</td>
				<td>${ modify.num }</td>
					<input type="hidden" id="num" name="num" value="${ modify.num }"/>
				<td>카테고리</td>
				<td><input type="text" id="sense_category" name="sense_category" value="${ modify.sense_category }"/></td>
				<td>메인</td>
				<td colspan=2>
					<c:if test="${ modify.main_set == 0 }">
						<input type="radio" id="main_set" name="main_set" value="1"/>메인노출
						<input type="radio" id="main_set" name="main_set" value="0" checked/>메인안함
					</c:if>
					<c:if test="${ modify.main_set == 1 }">
						<input type="radio" id="main_set" name="main_set" value="1" checked/>메인노출
						<input type="radio" id="main_set" name="main_set" value="0" />메인안함
					</c:if>
				</td>
			</tr>
			<tr>
				<tr>
					<td>제목</td>
					<td colspan=5><input type="text" id="sense_title" name="sense_title" value="${ modify.sense_title }"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan=5><textarea cols=80 rows=10 id="sense_content" name="sense_content" value="${ modify.sense_content }"/></textarea></td>
				</tr>
			</tr>
			<tr>
				<td>URL</td>
				<td colspan=2><input type="text" id="sense_url" name="sense_url" value="${ modify.sense_url }"/></td>
				<td>Thumbnail</td>
				<td colspan=2><input type="text" id="sense_thumbnail" name="sense_thumbnail" value="${ modify.sense_thumbnail }"/></td>
			</tr>
			<tr>
				<td colspan=6 align=center>
					<input type="submit" value="수정"/>
					<input type="button" value="취소" onclick="location.href='/moneyWatch/sense.mw'"/>
				</td>
			</tr>
		</div>
	</table>
</form>
</body>
</html>