<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check == 0 && set == 'main'}">    
<script>
	alert("등록이 완료되었습니다.");
	window.location="account_cardForm_main.mw";
</script>
</c:if>

<c:if test="${check == 1 && set == 'main'}">
<script>
	alert("이미 존재합니다.");
	window.location="account_cardForm_main.mw";
</script>	
</c:if>

<c:if test="${check == 0 && set == 'sub'}">    
<script>
	alert("등록이 완료되었습니다.");
	window.location="account_cardForm.mw";
</script>
</c:if>

<c:if test="${check == 1 && set == 'sub'}">
<script>
	alert("이미 존재합니다.");
	window.location="account_cardForm.mw";
</script>	
</c:if>
