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
		<c:if test="${sessionScope.memId != null}">			
			<input id="memo" type="button" value="메모하기" onclick="scrapmemo(${dto.num})"/>
		</c:if>
</body>
</html>