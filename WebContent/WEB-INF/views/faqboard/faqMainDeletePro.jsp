<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>FAQ 삭제 PRO</title>
</head>
<body>
	<c:if test="${check == 1}">
		<script langauge="javaScript">
			alert("삭제 완료");
			window.location = "faqList.mw";
		</script>
	</c:if>


	<c:if test="${check == 0}">
		<script langauge="javaScript">
			alert("계정이 맞지않습니다");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>