<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/main/top.jsp"%>
<html>
<head>
<title>유저 게시판 CONTENT</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<style>
table {
	margin: auto;
}
</style>
</head>
<body style="text-align: center;">
	<div class="form-group">
		<br />
		<br />
		<h3>게시판 글 보기</h3>
		<br />
		<table style="width: 50%; text-align: center;" border="1"
			cellspacing="0" cellpadding="0">
			<tr>
				<td>글번호</td>
				<td class="form-control">${number+1}<input type="hidden"
					value="${article.faq_num}" />
				</td>
				<td>조회수</td>
				<td class="form-control">${article.readcount}</td>
			</tr>

			<tr>
				<td>제 목</td>
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

		</table>
		<br />
		<br />
		<!-- 페이지 num url과 함께 보냄 -->
		<input type="button" class="btn btn-primary" value="글수정"
			onclick="document.location.href='/moneyWatch/faqUpdateForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
		<!-- 페이지 num url과 함께 보냄 -->
		<input type="button" class="btn btn-primary" value="글삭제"
			onclick="document.location.href='/moneyWatch/faqDeleteForm.mw?faq_num=${faq_num}&pageNum=${pageNum}'" />
		<!-- 페이지 num url과 함께 보냄 -->
		<input type="button" class="btn btn-primary" value="목록보기"
			onclick="document.location.href='/moneyWatch/faqList.mw?pageNum=${pageNum}'" />

	</div>

</body>
<div class="jumbotron text-center"
	style="margin-bottom: 0; margin-top: 10%;">
	<p>
		mw 주식회사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 전화번호 02) 1111-1111
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="siteMap.mw">사이트맵</a>
	</p>
</div>
</html>