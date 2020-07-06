<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>유저 게시판 Content</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
table{
	margin: auto;
}
</style>
</head>
<body style=" text-align:center;">
<div class="form-group"><br />
<h3>게시판 글 보기</h3><br />
	<table style="width:50%; text-align:center;" border="1" cellspacing="0" cellpadding="0">
		<tr >
			<td>글번호</td>
			<td class="form-control">${number+1}
			<input type="hidden" value="${article.faq_num}"/> </td>
			<td>조회수</td>
			<td class="form-control">${article.readcount}</td>
		</tr>	
			
		<tr>	
			<td >제 목</td>
			<td colspan="3"><div class="form-control">${article.subject}</div></td>
		</tr>
		
		<tr>	
			<td>작성자</td>
			<td class="form-control">${article.id}</td>
			<td>작성일</td>
			<td class="form-control">${article.reg}</td>
		</tr>
		
		<tr>	
			<td colspan="4">글내용</td>
		</tr>
		<tr>
			<td colspan="4">${article.content}</td>
		</tr>
		
	
		<tr>
			<td colspan="4" align="right">
			
			<input type="button" class="btn btn-primary" value="글수정" onclick="document.location.href='/moneyWatch/faqUpdateForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
			
			<input type="button" class="btn btn-primary" value="글삭제" onclick="document.location.href='/moneyWatch/faqDeleteForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
			
			<%-- <input type="button" value="답글쓰기" onclick="document.location.href='/moneyWatch/faqWriteForm.mw?faq_num=${faq_num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'" />
			 --%>
			<input type="button" class="btn btn-primary" value="목록보기" onclick="document.location.href='/moneyWatch/faqList.mw?pageNum=${pageNum}'" />
			</td>
		</tr>
		
	</table>
</div>

</body>
</html>