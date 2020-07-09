<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>일정수정</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
	<br><br>
	<center><h5>일정수정</h5></center> 
	<table width=100%>
	<form name = "scheduleDate" method="post" action="day_updatePro.mw">
		<input type="hidden" id="id" name="id" value="${sessionScope.memId}"/>
		<input type="hidden" id="num" name="num" value="${detail.num}">
		
		<tr><td>
		<div class="form-group" style="width:100%;">
	
		<label class="col-form-label col-form-label-sm" for="inputSmall">일정</label>
  		<input type="text" name="title" class="form-control form-control-sm" id="inputSmall" value="${detail.title}" required>
		
		</div>
		</td>
		
       <td>
       <div class="form-group" style="width:100%;">
		<label class="col-form-label col-form-label-sm" for="inputSmall">색상</label>
		<select class="custom-select" name="sc_color" id="sc_color">
			<!-- <select class="sc_color" name="sc_color" id="sc_color"> -->
			<c:if test="${detail.sc_color == '#FFEB5A' }">
				<option value="${detail.sc_color}">노랑색</option>
			</c:if>
			<c:if test="${detail.sc_color == '#C45FDD' }">
				<option value="${detail.sc_color}">보라색</option>
			</c:if>
			<c:if test="${detail.sc_color == '#5AD18F' }">
				<option value="${detail.sc_color}">초록색</option>
			</c:if>			
			<c:if test="${detail.sc_color == '#5CEEE6' }">
				<option value="${detail.sc_color}">민트색</option>
			</c:if>			
			<option value="#FFEB5A" style="color:#FFEB5A;"> 노랑색</option>
			<option value="#C45FDD" style="color:#C45FDD;"> 보라색</option>
			<option value="#5AD18F" style="color:#5AD18F;"> 초록색</option>
			<option value="#5CEEE6" style="color:#5CEEE6;"> 민트색</option>
		</select>
		</div>
		</td></tr>
		
		<tr><td>
		<div class="form-group" style="width:100%;">
		<label class="col-form-label col-form-label-sm" for="inputSmall">시작일</label>
  		<input type="date" name="start_time" class="form-control form-control-sm" id="inputSmall" value="${detail.start_time}" size="10">
  		</div>
  		</td>
  		<td>
  		<div class="form-group" style="width:100%;">
  		<label class="col-form-label col-form-label-sm" for="inputSmall">종료일</label>
  		<input type="date" name="end_time" class="form-control form-control-sm" id="inputSmall" value="${detail.end_time}" size="10">
  		</div>
  		</td></tr>
  		
  		<tr><td vlign="top">
  		<div class="form-group" style="width:100%;">
  		<label class="col-form-label col-form-label-sm" for="inputSmall">장소</label>
  		<input type="text" name="place" class="form-control form-control-sm" id="inputSmall" value="${detail.place}">
  		</div>
  		</td>
  		
  		<td>
  		<div class="form-group" style="width:100%;">
      	<label for="exampleTextarea">메모</label>
      	<textarea class="form-control" name="memo" id="exampleTextarea" rows="5" cols="20" value="${datail.memo}">${detail.memo}</textarea>
    	</div>
  		</td></tr>
  		
		<tr><td colspan=2>
		<center><input type="submit" class="btn btn-outline-primary" value="수정"></center>
		
		</td></tr>
		</form>	
	
	</table>
</body>

</html>