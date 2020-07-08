<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>  
<html>
<head>
<title>게시글 수정 FORM</title>

<script language="JavaScript">
function writeSave(){
	
	if(document.writeform.writer.value==""){
	  alert("작성자를 입력하세요");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하세요");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하세요");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" 비밀번호를 작성하세요");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    
</script>
<form method="post" name="writeform" action="/moneyWatch/faqUpdatePro.mw" onsubmit="return writeSave()">
<div class="form-group"> <br />
<h3 style="text-align:center;">글 수정하기</h3><br />
<table border="1" align="center" width="50%" style="text-align:center;">
  <tr>
    <td>이 름</td>
    <td>
       <input type="text" class="form-control" size="10" maxlength="10" name="id" value="${dto1.getId()}"></td>
	   <input type="hidden" name="faq_num" value="${dto1.getFaq_num()}" />
  </tr>
  <tr>
    <td>제 목</td>
    <td>
       <input type="text" class="form-control" size="40" maxlength="50" name="subject" value="${dto1.getSubject()}"></td>
  </tr>
  
  <tr>
    <td>내 용</td>
    <td>
     <textarea class="form-control" name="content" rows="13" cols="40">${dto1.getContent()}</textarea></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td>
     <input type="password" class="form-control" size="8" maxlength="12" name="pw">
     
	 </td>
  </tr>
 </table><br/>
 <div style="margin-left:45%;">
      <input type="submit" class="btn btn-info" value="글수정" >  
     <input type="reset" class="btn btn-info" value="다시작성" >
     <input type="button" class="btn btn-info" value="목록보기" onclick="window.location='moneyWatch/faqList.mw'" >
     </div>
 </div>
</form>
</body>
<%@ include file = "/WEB-INF/views/main/footer.jsp" %>
</html>      