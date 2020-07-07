<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>senseDeletePro</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/sense/sense.js"></script>



</head>
<body>
<!-- 삭제확인 -->
<c:choose>
	<c:when test="${ check == 1 }">
	<!-- 삭제에 성공했을 경우ㅡ  -->
		<script>
			alert("정상적으로 삭제되었습니다.");
		</script>
	</c:when>
	<c:when test="${ check == -1 }">
	<!-- pw confirm 후 삭제에 실패했을 경우 -->
		<script>
			alert("삭제에 실패하였습니다.");
		</script>	
	</c:when>
	<c:when test="${ check == 0 }">
	<!-- pw 오류로에 실패했을 경우 -->
		<script>
			alert("비밀번호가 맞지 않습니다.");
		</script>	
	</c:when>
	<c:when test="${ check == 2 }">
	<!-- pw 오류로에 실패했을 경우 -->
		<script>
			alert("권한이 없습니다.");
		</script>	
	</c:when>
	<c:otherwise>
		<script>
			alert("에러");
		</script>	
	</c:otherwise>
</c:choose>

			<c:forEach items="${ list }" var="list">
			<table class="list-group" >
				<tr class="list-group-item d-flex justify-content-between align-items-center">
					<!-- 썸네일이미지> --> 
					<td onclick="detail(${ list.num })"><img src="https://img.youtube.com/vi/${ list.sense_thumbnail }/default.jpg" alt="Page Not Found"/></td>
					<td onclick="detail(${ list.num })">${ list.sense_title }</td>
					<td class="badge badge-primary badge-pill" id="readcount"> ${ list.readcount } </td>
				</tr>
				<tr>	
					<td>
						<input type="button" value="수정" class="btn-group btn-group-toggle" data-toggle="buttons" onclick="location.href='/moneyWatch/senseModify.mw?num=${list.num}'"/>
					</td>	
					<td>
						<input type="button" value="삭제" class="btn-group btn-group-toggle" data-toggle="buttons" onclick="senseDelete(${list.num})"> 
					</td>
				</tr>
			</table>
			</c:forEach>


</body>

</html>