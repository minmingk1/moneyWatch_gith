<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>
</head>
<body>
			<iframe width="850" height="478" src="https://www.youtube.com/embed/${dto.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
		<c:if test="${sessionScope.memId != 'admin' && sessionScope.memId != null}">			
			<br /><input id="memo" type="button" class="btn btn-danger" value="스크랩" onclick="scrapmemo(${video.num})" style="float:right;"/>
			<h5><a class="btn btn-info" href="myscrap.mw" style="float:left;">마이스크랩</a></h5>
		</c:if>
</body>
</html>