<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script>
	function update(){
		var url = "day_updateForm.mw?title="+"<c:out value="${detail.title}"/>"+"&start_time="+"<c:out value="${detail.start_time}"/>";
		var name = "day_update";
		var style = "width = 500 height = 500, top = 100, left = 200, location = no"
		
		window.open(url,name,style);
	}
</script>

<center><h3>세부일정</h3></center>
<br>
	<table style="width:80%; text-align:center;" align="center">
		<tr>
			<td>일정</td><td>${detail.title}</td>
		</tr>
		
		<tr>
			<td>메모</td><td>${detail.memo}</td>
		</tr>
		
		<tr>
			<td>장소</td><td>${detail.place}</td>
		</tr>

	</table>
	<br>
<center><button id="delete" type="button" class="btn btn-outline-primary" onclick="window.location='day_delete.mw?title=${detail.title}&start_time=${detail.start_time}'">일정삭제</button>
<button id="update" type="button" class="btn btn-outline-primary" onclick="update();">일정수정</button></center>
<%-- onclick="window.location='day_updateForm.mw?title=${detail.title}&start_time=${detail.start_time}'" --%>
