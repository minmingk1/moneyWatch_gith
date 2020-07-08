<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>FAQ 수정 FORM</title>
</head>
<body>


<form method="post" action="/moneyWatch/faqMainUpdatePro.mw?qnum=${list.qnum}">
<tr>

	<td width="25%" align="center" >해당 글쓴이 ID
		<input type="text" name="qid" value="${list.getQ_id()}" readonly>
		<input type="hidden" value="${sessionScope.memId}">
	</td>
	
	<td width="25%" align="center" >글번호
		<input type="text" name="qunm" value="${list.qnum}" readonly></td>
	
	<td width="25%" align="center" >제목
		<input type="text" name="qsubject" value="${list.getQsubject()}"></td>
	
	<td width="25%" align="center" >글내용
		<input type="text" name="qcontent" value="${list.getQcontent()}"></td>

</tr>

	<input type="submit" value="글수정 완료">


</form>
</body>
</html>