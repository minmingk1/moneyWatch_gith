<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원정보수정</title>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>
<script language="JavaScript">
    <!-- 
    function checkIt(){
    	var userinput = eval("document.userinput");
    	
    	if(!userinput.pw.value){
    		alert("비밀번호를 입력하세요");
    		return false;
     	}
    	if(!userinput.name.value){
    		alert("사용자 이름을 입력하세요");
    		return false;
    	}   		
    }   
    -->
</script>
<body><br />
<h3 style="text-align:center;"> 회원 정보 수정</h3><br/>
  <form method="post" action="/moneyWatch/modifyPro.mw" name="userinput" onsubmit="return checkIt()">
  <div class="form-group">
     <table border="1" align="center" width="50%">
    <tr>
     <td>사용자 ID</td>
     <td><input type="text" class="form-control"  name="id" value="${dto.getId()}" disabled /></td>
     <td>이름</td>
     <td>
      <input type="text" class="form-control" name="name" size="9" maxlength="9" value="${dto.getName()}"></td>
    </tr>
       
    <tr>
     <td>비밀번호</td>
     <td colspan="3">
      <input type="password" class="form-control" name="pw" size="9" maxlength="9" value="${dto.getPw()}"></td>
    </tr>
    
    <tr>		
		<td rowspan="2"> 휴대폰 번호 </td>
		<td colspan="3">
			<select class="form-control" name="tel" value="${dto.getTel()}">
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LGU+">LGU+</option>
				<option value="알뜰폰">알뜰폰</option>			
			</select>
		</td>
	</tr>
	<tr>
		<td>	
			<select class="form-control" name="phone1" value="${dto.getPhone1()}">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="019">019</option>
			</select>
		</td>
		<td>	
			<input type="text" class="form-control" name="phone2" size="10" maxlength="4" value="${dto.getPhone2()}">
		</td>
		<td>	
			<input type="text" class="form-control" name="phone3" size="10" maxlength="4" value="${dto.getPhone3()}">
		</td>
		</tr>

    <tr>
     <td>우편번호</td>
     <td colspan="3">
      <input type="text" class="form-control" name="zon" size="9" maxlength="9" value="${dto.getZon()}"></td>
    </tr>
    
    <tr>
     <td>주소</td>
     <td>
      <input type="text" class="form-control" name="street" size="30" maxlength="30" value="${dto.getStreet()}"></td>
     <td>상세주소</td>
     <td>
      <input type="text" class="form-control" name="addr" size="9" maxlength="9" value="${dto.getAddr()}"></td>
    </tr>

    <tr>
		<td>이메일 ID</td>
		<td>
			<input type="text" class="form-control" name="email1" size="10" maxlength="12" value="${dto.getEmail1()}"></td>
			<td>@</td>
			<td><input type="text" class="form-control" name="email2" size="10" maxlength="12" value="${dto.getEmail2()}">
		</td>
	</tr>
    
    <tr>
      <td colspan="5">
      <input type="submit" class="btn btn-danger" name="modify" value="수정" style="float:right;">
      <input type="button"  class="btn btn-info" value="취소" onclick="javascript:window.location='main.mw'"></td>
    </tr>
   </table>
  </div>

  </form> 
 </body>

</html>