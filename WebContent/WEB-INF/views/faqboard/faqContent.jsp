<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>FAQ 게시글 내용</title>
</head>
<body>

<table width="30%" cellspacing="0" cellpadding="0" border="1">
<tr heigth="700">
	<td align="center" width="300">글번호</td>
	<td align="center" width="300">${qlist.qnum}
	<input type="hidden" value="${qlist.qnum}"></td>

	<td align="center" width="300">제목</td>
	<td align="center" width="300">${qlist.qsubject}</td>

	<td align="center" width="300">조회수</td>
	<td align="center" width="300">${qlist.qreadcount}</td>

	
</tr>

<tr heigth="30%">
	<td align="center" width="300">작성자</td>
	<td align="center" width="300">${qlist.nickname}</td>
	
	
	<td align="center" width="300">작성일</td>
	<td align="center" width="300">${qlist.reg}</td>
</tr>
 </table>
 
 <br />
 <table width="40%" cellspacing="0" cellpadding="0" border="1">
 <tr heigth="700">
 	<td align="center" width="300">내용</td>
 	<td align="center" width="800">${qlist.qcontent}</td>
 </tr>
		
		<td colspan="4" align="right">
		<c:if test="${sessionScope.memId =='aaa'}">
		<input type="button" value="글수정" onclick="document.location.href='/moneyWatch/faqMainUpdateForm.mw?qnum=${qlist.qnum}'" />
		</c:if>
		<input type="button" value="글삭제" onclick="document.location.href='/moneyWatch/faqMainDelete.mw?qnum=${qlist.qnum}&q_id=${qlist.q_id}'" />
		<input type="button" value="목록보기" onclick="document.location.href='/moneyWatch/faqList.mw'" />
		
		</td>
	</tr>
</table>
</body>
</html>