<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>FAQ 게시판</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<center>
	
	<h3>*FAQ*</h3>
	<table class="table table-hover">
	 <tr>
	 	<td align="right">
		<c:if test="${sessionScope.memId =='aaa'}">
		<button class="btn btn-primary"><a href="/moneyWatch/faqQwriteForm.mw">글쓰기</a></button>
		</c:if>
	 	</td>
	 </tr>
	</table>
	
	<c:if test="${qcount>0}">
	<table style="width:40%;" border="1" cellpadding="0" cellspacing="0"  class="table table-hover">
	 <tr class="table-dark">
			<td align="center" >번호</td>
			<td align="center" >제목</td>
			<td align="center" >작성자 ID</td>
			<td align="center" >닉네임</td>
			<td align="center" >작성일</td>
			<td align="center" >조회</td>
	 </tr>
	 
	 <tr scope="row">
		<c:forEach var="qlist" items="${qList}" >
		  <tr>
		  	<td align="center">${qlist.qnum}</td>
		  	
			<td align="center">
			<a href = "/moneyWatch/faqContent.mw?qnum=${qlist.qnum}">${qlist.qsubject}</a></td>
			<td align="center">${qlist.q_id}</td>
			<td align="center" >${qlist.nickname}</td>
			<td align="center" >${qlist.reg}</td>
			<td align="center" >${qlist.qreadcount}</td>
		  </tr>
		</c:forEach>
	</c:if>
	</table>
	</center>
	<br />
<center><h5>전체글 [${count}]</h5>
<table style="width:40%;" border="1" cellpadding="0" cellspacing="0" align="center" >
	<tr>
		<td align="right">
		<c:if test="${sessionScope.memId != null}">
		<input type="button" class="btn btn-primary" value="내가 쓴 글" onclick="window.location='/moneyWatch/myList.mw'">
		<input type="button" class="btn btn-primary" value="글쓰기" onclick="window.location='/moneyWatch/faqWriteForm.mw'">
		</c:if>
		
		<c:if test="${sessionScope.memId == null}">
		<a href="/moneyWatch/loginForm.mw">로그인</a>
		</c:if>
		</td>
	</tr>
</table>

<c:if test="${count==0}">
<table style="width:40%;" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	게시판에 저장된 글이 없습니다.
	</td>
</tr>
</table>
</c:if>

<c:if test="${count != 0}">
	<table class="table table-hover" style="width:40%;" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr class="table-active">
			<td align="center">   </td>
			<td align="center" >번호</td>
			<td align="center">제목</td>
			<td align="center">작성자</td>
			<td align="center">작성일</td>
			<td align="center">조회</td>
		</tr>
		<c:forEach var="article" items="${articleList}">
	
			<tr scope="row">
				<td align="center">
					<c:if test="${article.readcount >= 20}">
						<img src="/moneyWatch/image/hot.gif" border="0" height="16" >
					</c:if>
				</td>
						
				<td align="center" >${number} 
					<c:set var="number" value="${number-1}" /></td>
					
				<td align="center">
					<a href="/moneyWatch/content.mw?faq_num=${article.faq_num}&pageNum=${currentPage}&number=${number}">
					${article.subject}</a>
				</td>
					
				<td align="center" >${article.id}</td>
	
				<td align="center">${article.reg}</td>
	
				<td align="center" >${article.readcount}</td>
			</tr>		
		</c:forEach>
	</table>
</c:if>


	<c:if test="${count > 0}">
	
		<c:if test="${startPage > 10}">
		<a href="/moneyWatch/faqList.mw?pageNum=${startPage - 10}">이전</a>
		</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="/moneyWatch/faqList.mw?pageNum=${i}" >-${i}-</a>
			</c:forEach>
		
		<c:if test="${endPage < pageCount}" >
			<a href="/moneyWatch/faqList.mw?pageNum=${startPage + 10}">다음</a>
		</c:if>
	</c:if>
</center>

</body>
</html>
























