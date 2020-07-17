<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
img{
	display:block;
	margin: auto;
}
h3{
	text-align:center;
}
input[type="button"]{
	margin-left: 47%;
}
</style>
</head>
<body><br/><br/>
<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
<img alt="404" src="/moneyWatch/image/image_error/404_error.png" />
<h3>요청하신 페이지를 찾을 수 없습니다.</h3><br/>
<c:if test="${sessionScope.memId == null}">
<input type="button" value="로그인하기" class="btn btn-primary" onclick="javascript:window.location='/moneyWatch/index.mw'" />
</c:if>
</c:if>
<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
<img alt="500" src="/moneyWatch/image/image_error/500_error.png" />
<h3>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</h3><br/>
<c:if test="${sessionScope.memId == null}">
<input type="button" value="로그인하기" class="btn btn-primary" onclick="javascript:window.location='/moneyWatch/index.mw'" />
</c:if>
</c:if>

</body>
</html>