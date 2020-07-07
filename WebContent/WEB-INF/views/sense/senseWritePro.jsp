<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>senseWritePro</title>
<!-- 입력확인 -->
<c:choose>
	<c:when test="${ check == 1 }">	
	<!-- 입력에 성공했을 경우ㅡ  -->
		<script>
			alert("이미 존재하는 URL입니다.");
			history.go(-1);
		</script>
	</c:when>
	
	<c:when test="${ check == 0 }">
	<!-- 입력에 실패했을 경우 -->
		<script>
			alert("정상적으로 입력되었습니다.");
			window.location='/moneyWatch/senseAdmin.mw';
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