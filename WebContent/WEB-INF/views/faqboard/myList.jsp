<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file = "/WEB-INF/views/main/top.jsp" %>
<html>
 <head>
  <title>나의 문의글</title>
  <link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
   </head>
    <body>
     
 
    <h5 style="text-align:center;">나의 글 [${count}]</h5>
      
         <c:if test="${sessionScope.memId != null}">
          <input type="button" class="btn btn-primary" value="글쓰기" onclick="window.location='/moneyWatch/faqWriteForm.mw'" style="float:right; margin-right:30%;" >
          <input type="button" class="btn btn-primary" value="로그아웃" onclick="window.location='/moneyWatch/logout.mw'" style="float:right; margin-right:1%;" >
         </c:if>
         
         <c:if test="${sessionScope.memId == null}">
		<a href="/moneyWatch/loginForm.mw">로그인</a>
		</c:if>
         <br />
         
         
         
         <c:if test="${count == 0}">
          <table style="width:30%;" border="1" cellpadding="0" cellspacing="0">
           <tr>
            <td align="center">
          	  게시판에 저장된 글이 없습니다.
            </td>
          </table>
         </c:if>
         
         <c:if test="${count != 0}">
          <table class="table table-hover" style="width:30%;" border="1" width="700" cellpadding="0" cellspacing="0" align="center">
          <tr class="table-active">
           	<td align="center" >   </td>
            <td align="center" >번 호</td>
            <td align="center" >제  목</td>
            <td align="center" >내용</td>
            <td align="center" >작성자</td>
            <td align="center" >작성일</td>
            <td align="center" >조 회</td>
           </tr> 
           
         <c:forEach var="article" items="${articleList}">   
         <tr scope="row">
           <td align="center">
           <c:if test="${article.readcount >=20}">  
              <img src="/moneyWatch/image/hot.gif" border="0" height="16"></td>
           </c:if>
            
	       <td align="center">${number}</td>
           <c:set var="number" value="${number-1}"/>
            
            
           <td align="center">
           		<a href="/moneyWatch/content.mw?faq_num=${article.faq_num}&pageNum=${currentPage}">
              ${article.subject}</a>
           </td>
             
           <td align="center" >${article.content}</td>
           
             
           <td align="center" >${article.id}</td>
           
           <td align="center" >${article.reg}</td>
           
           <td align="center" >${article.readcount}</td>
         </tr> 
         </c:forEach>
        </table>
        </c:if>
              <c:if test="${count > 0}">
              <c:if test="${startPage > 10}">
              <a href="/moneyWatch/myList.mw?pageNum=${startPage - 10}">[이전]</a>
              </c:if>
              
              <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
               <a href="/moneyWatch/myList.mw?pageNum=${i}">[${i}]</a>
              </c:forEach>
              
              <c:if test="${endPage < pageCount}">
               <a href="/moneyWatch/myList.mw?pageNum=${startPage + 10}">[다음]</a> 
              </c:if>
              </c:if>
           
 </body>
</html>

<%@ include file = "/WEB-INF/views/main/footer.jsp" %>