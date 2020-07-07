<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>FAQ 삭제 FORM</title>
</head>
<a>삭제 요청 ID :${sessionScope.memId}</a>
<a>현제 게시글 번호:${qnum}</a>

<body>
<form mothod="post" action="faqMainDeletePro.mw" >


<input type="hidden" name="q_id" value="${q_id}"> 
<input type="hidden" name="qnum" value="${qnum}"> 

<input type="submit" value="삭제 진행하기">
<input type="button" value="취소" onclick="document.location.href='/moneyWatch/faqList.mw'">
</form>
</body>
</html>