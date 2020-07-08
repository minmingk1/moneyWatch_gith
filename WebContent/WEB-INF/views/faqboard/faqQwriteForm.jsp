<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>FAQ 글쓰기 FORM</title>
</head>
<script language="javaScript">
function check(){
	
	if(document.writeForm.nickname.value==""){
		alert("닉네임을 작성해주세요.");
		document.writeForm.nickname.focus();
		return false;
	}
	if(document.writeForm.qsubject.value==""){
		alert("글의 제목을 작성해주세요.");
		document.writeForm.qsubject.focus();
		return false;
	}
	if(document.writeForm.qcontent.value==""){
		alert("내용을 작성해주세요.");
		document.writeForm.qcontent.focus();
		return false;
	}
}
</script>
<body>
	<form mothod="post" name="writeForm" action="faqQwritePro.mw" onsubmit="return check()" >
		<input type="hidden" name="qnum" value="${qnum}">
		<input type="hidden" name="qreadcount" value="${qreadcount}">
	
	
	
	<table width="20%" border="1" cellspacing="0" cellpadding="0" align="center" >
		<tr>
			<td align="right" colspan="2">
			</td>
		</tr>
	
		<tr>
			<td width="30%" align="center">운영자 ID</td>	
			<td width="30%">${sessionScope.memId}
			<input type="hidden" name="q_id" value="${sessionScope.memId}"></td>
		</tr>
	
		<tr>
			<td width="30%" align="center">닉네임</td>
			<td width="30">
			<input type="text" name="nickname" size="20" maxlength="10"></td>
		</tr>
		
		<tr>
			<td width="30%" align="center">제 목</td>
			<td width="30">
			<input type="text" name="qsubject" size="30" maxlength="50"></td>
		</tr>
	
		<tr>
			<td width="30%" align="center">글내용</td>
			<td width="30">
			<textarea name="qcontent" rows="15" cols="50" maxlength="300"></textarea></td>
		</tr>
	
		<tr>
			<input type="submit" value="글작성">
		</tr>
	
	</table>
	</form>
</body>
</html>