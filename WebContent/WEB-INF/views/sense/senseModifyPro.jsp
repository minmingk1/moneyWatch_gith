<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>senseModifyPro</title>

<!-- 수정확인 -->
<c:choose>
	<c:when test="${ check == 2 }">
	<!--수정에 성공했을 경우ㅡ  -->
		<script>
			alert("정상적으로 수정되었습니다.");
			window.location="/moneyWatch/senseAdmin.mw";	
		</script>
	</c:when>
	<c:when test="${ check == 0 }">
	<!-- 수정에 실패했을 경우 -->
		<script>
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>	
	</c:when>
	<c:otherwise>
		<script>
			alert("에러");
			history.go(-1);
		</script>	
	</c:otherwise>
</c:choose>
</head>
<body>

</body>
</html>