<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script language="javaScript">
function writeSave(){
	
	if(document.writeform.writer.value==""){
		alert("이름을 작성해주세요.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.subject.value==""){
		alert("글의 제목을 작성해주세요.");
		document.writeform.subject.focus();
		return false;
	}
	
	if(document.writeform.content.value==""){
		alert("내용을 작성해주세요.");
		document.writeform.content.focus();
		return false;
	}
	if(document.writeform.pw.value==""){
		alert("비밀번호를 10자이내로 작성해주세요.");
		document.writeform.pw.focus();
		return false;
	}
}
</script>
</head>
<body>
<div class="form-group">
<center><h3>글쓰기</h3></center>
<br>								
	<form method="post" name="writeform" action="faqWritePro.mw" onsubmit="return writeSave()">
	
		<input type="hidden" name="faq_num" value="${faq_num}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="readcount" value="${readcount}">
		
		<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td align="right" colspan="2"></td>	
			</tr>
			
			<tr>
	     		<td width="70" align="center">작성자</td>
	     		<td width="330">
	     		<input type="text" class="form-control" name="id" value="${sessionScope.memId}" disabled/></td>
	    	</tr>
			
			</tr>
			
			<tr>
		    	<td  width="70"  bgcolor="${value_c}" align="center" >제 목</td>
		    	<td  width="330">
	     		<input type="text" class="form-control" size="40" maxlength="50" name="subject"></td>
	  		</tr>
			
			
			<tr>
				<td width="70" align="center">내용</td>
				<td width="330">
				<textarea  class="form-control" name="content" rows="13" cols="50"></textarea></td>
			</tr>
			
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td width="330">
				<input type="password" class="form-control" size="8" maxlength="10" name="pw"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit"  class="btn btn-primary" value="글쓰기">
					<input type="reset" class="btn btn-primary" value="새로작성">
					<input type="button" class="btn btn-primary" value="목록보기" onclick="window.location='/moneyWatch/faqList.mw'">
				</td>
			</tr>
	
		</table>	
</form>
	</div>
</body>


</html>