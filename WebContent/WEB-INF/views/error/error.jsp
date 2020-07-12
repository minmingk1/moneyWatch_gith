<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
404 error
<p>요청하신 페이지를 찾을 수 없습니다.</p>
<input type="button" value="로그인하기" class="btn btn-primary" onclick="javascript:window.location='index.mw'" />
</c:if>
<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
500 error
<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
<input type="button" value="로그인하기" class="btn btn-primary" onclick="javascript:window.location='index.mw'" />
</c:if>

</body>
</html>