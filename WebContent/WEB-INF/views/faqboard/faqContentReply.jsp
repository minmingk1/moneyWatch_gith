<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqContentReply</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>	
<script src="js/faqreply/faqreply.js"></script>
</head>
<body>
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
		
			
</body>
</html>