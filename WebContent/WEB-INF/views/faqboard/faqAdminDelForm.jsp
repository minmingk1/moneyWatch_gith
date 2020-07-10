<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제 FORM</title>
</head>
<body>
<center><a>삭제할 게시글 데이터 번호: ${faq_num}</a></center>
<br />
<c:if test="${sessionScope.memId == 'admin'}">
<center><input type="button" value="삭제진행" class="btn btn-primary" onclick="window.location='faqAdminDel.mw?faq_num=${faq_num}'">
</c:if></center>
 
</body>
</html>