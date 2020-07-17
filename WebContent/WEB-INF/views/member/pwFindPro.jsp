<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<c:if test="${pw_check==1}" >
	<script>
		alert("임시 비밀번호를 전송하였습니다.");
		window.location = "./index.mw";
	</script>
</c:if>
<c:if test="${pw_check != 1 }">
	<script>
		alert("일치한 정보가 없습니다.");
		window.location = "./pwFindForm.mw";
	</script>
</c:if> 