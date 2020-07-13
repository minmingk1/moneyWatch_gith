<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>유저 게시판 CONTENT</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>	
<script src="js/faqreply/faqreply.js"></script>
<style>
table {
	margin: auto;

}
.box{
 	/* margin: 30px; */
    border: 30px solid #6c32ad;
    padding: 30px; 
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
			<tr style="height:120px;">
				<td colspan="4">${article.content}</td>
			</tr>

		</table>
	<br/><br/><br/>
		<!-- 댓글 입력 -->
		<table id="insertReply" style="width: 50%; text-align: center;"  cellspacing="0" cellpadding="0">

			<c:if test="${sessionScope.memId != null}">	
			<div>
				<tr>
					<td class="box">댓글</td>
					<td colspan="2"><textarea cols="100" rows="5" name="content" placeholder="댓글을 입력하세요."></textarea></td>
					<td><input id="num"  type="button"  class="btn btn-secondary" style="width:120%;" value="입력" onclick="insertReply(${article.faq_num})"></td>				
				</tr>	
			</div>
			</c:if>
			
		</table>
		<br/><br/><br/>	
		<!-- 댓글 리스트 -->				
		<table id="replyList" style="width:50%; text-align: center;"  border="1"cellspacing="0" cellpadding="10">
				<c:forEach items="${ reply }" var="reply">
				<tr>
					<td rowspan="2">${ reply.id }</td><!-- 작성자 -->
					<td >${ reply.reg }</td> <!-- 작성일 -->
					<c:if test="${sessionScope.memId == reply.id }">				
						<td rowspan="2"><input type="button" class="btn btn-danger" value="삭제" onclick="deleteReply(${ reply.num }, ${reply.faq_num })"></td>
					</c:if>
					<c:if test="${sessionScope.memId != reply.id }">	
					<td  rowspan="2"></td>
					</c:if>
				</tr>
				<tr>
					<td>${ reply.content }</td><!-- 댓글내용 -->
				</tr>
				
				</c:forEach>
				
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
		<!-- 관리자 삭제 -->
		<c:if test="${sessionScope.memId=='admin'}">
		<input type="button" class="btn btn-primary" value="게시글 삭제"
			onclick="document.location.href='/moneyWatch/faqAdminDelForm.mw?faq_num=${faq_num}'" />
		</c:if>
	</div>

</body>

</html>