<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${set == 0}">
<script>
	alert("일정이 삭제되었습니다.");
	window.location="Calendar.mw";

</script>
</c:if>

<c:if test="${set == 1}">
<script>
	alert("일정이 삭제되었습니다.");
	window.location="Calendar_sub.mw";
</script>
</c:if>