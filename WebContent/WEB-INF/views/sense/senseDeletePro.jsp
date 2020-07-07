<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>senseDeletePro</title>

<!-- 삭제확인 -->
<c:choose>
	<c:when test="${ check == 1 }">
	<!-- 삭제에 성공했을 경우ㅡ  -->
		<script>
			alert("정상적으로 삭제되었습니다.");
			window.location="/moneyWatch/sense.mw";	
		</script>
	</c:when>
	
	<c:when test="${ check == -1 }">
	<!-- pw confirm 후 삭제에 실패했을 경우 -->
		<script>
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>	
	</c:when>
	<c:when test="${ check == 0 }">
	<!-- pw 오류로에 실패했을 경우 -->
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>	
	</c:when>
	<c:when test="${ check == 2 }">
	<!-- pw 오류로에 실패했을 경우 -->
		<script>
			alert("권한이 없습니다.");
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