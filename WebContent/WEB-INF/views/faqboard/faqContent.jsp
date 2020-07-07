<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>FAQ 게시글 내용</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
table{
	margin: auto;
}
</style>
</head>
<body>
<div class="form-group">
	<table style="width:50%; text-align:center;" cellspacing="0" cellpadding="0" border="1">
		<tr heigth="700">
			<td>글번호</td>
			<td class="form-control">${qlist.qnum}
				<input type="hidden" value="${qlist.qnum}"></td>
			<td>제목</td>
			<td class="form-control">${qlist.qsubject}</td>
			<td>조회수</td>
			<td class="form-control">${qlist.qreadcount}</td>	
		</tr>
		
		<tr>
			<td >작성자</td>
			<td colspan="2"><div class="form-control">${qlist.nickname}</div></td>
			<td>작성일</td>
			<td colspan="2"><div class="form-control">${qlist.reg}</div></td>
		</tr>
		 <tr>
		 	<td colspan="6">내용</td>
		 </tr>
		 <tr>
		 	<td colspan="6"><div class="form-control">${qlist.qcontent}</div></td>
		 </tr>
		 <tr>	
			<td colspan="6" align="right">
			<c:if test="${sessionScope.memId =='aaa'}">
			<input type="button" class="btn btn-primary" value="글수정" onclick="document.location.href='/moneyWatch/faqMainUpdateForm.mw?qnum=${qlist.qnum}'" />
			<input type="button" class="btn btn-primary" value="글삭제" onclick="document.location.href='/moneyWatch/faqMainDelete.mw?qnum=${qlist.qnum}&q_id=${qlist.q_id}'" />
			</c:if>
			<input type="button" class="btn btn-primary" value="목록보기" onclick="document.location.href='/moneyWatch/faqList.mw'" />
			
			</td>
		</tr>
	</table>
</div>
</body>
</html>