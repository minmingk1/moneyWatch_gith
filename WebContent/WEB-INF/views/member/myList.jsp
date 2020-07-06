<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
 <head>
  <title>나의 문의글</title>
   </head>
    <body>
     
     <center><b>나의 글 목록(전체 글:${count})</b>
      <table width="700">
       <tr>
        <td align="right">
         
         <c:if test="${sessionScope.memId != null}">
          <a href="/moneyWatch/faqWriteForm.mw">글쓰기</a>
          <a href="/moneyWatch/logout.mw">로그아웃</a>
         </c:if>
         
         <c:if test="${sessionScope.memId == null}">
          <a href="/moneyWatch/loginForm.mw">로그인</a>
         </c:if>
        
        </tr>         
      </table>
         
         <c:if test="${count == 0}">
          <table width="700" border="1" cellpadding="0" cellspacing="0">
           <tr>
            <td align="center">
            게시판에 저장된 글이 없습니다.
            </td>
          </table>
         </c:if>
         
         <c:if test="${count != 0}">
          <table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
           <tr height="30">
           	<td align="center" width="50">   </td>
            <td align="center" width="50">번 호</td>
            <td align="center" width="250">제  목</td>
            <td align="center" width="250">내용</td>
            <td align="center" width="100">작성자</td>
            <td align="center" width="150">작성일</td>
            <td align="center" width="50">조 회</td>
           </tr> 
           
         <c:forEach var="article" items="${articleList}">   
         <tr height="30">
           <td align="center" width="30" >
           <c:if test="${article.readcount >=20}">  
           <img src="/moneyWatch/image/hot.gif" border="0" height="16"></td>
           </c:if>
            
	       <td align="center"  width="50" >${number}</td>
           <c:set var="number" value="${number-1}"/>
            
            
           <td align="center" width="250">
           <a href="/moneyWatch/content.mw?faq_num=${article.faq_num}&pageNum=${currentPage}">
              ${article.subject}</a></td>
              
           <td align="center" width="250">${article.content}</td>
           
             
           <td align="center" width="100">${article.id}</td>
           
           <td align="center" width="150">${article.reg}</td>
           
           <td align="center" width="50">${article.readcount}</td>
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
              
     </center> 
 </body>
</html>