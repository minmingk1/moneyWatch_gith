<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<html>
<head>
<title>중복확인</title>


<script language="javascript">

function setId(reId){		
	window.opener.userinput.id.value=reId;
	self.close();
	
	}

</script>

<c:if test="${check == 1}">

	
	<p>[${id}]은(는) 이미 사용중인 아이디입니다</p>
	
	
	<form name="checkForm" method="post" action="/moneyWatch/confirmId.mw">
	<table width="270" border="0" cellspacing="0" cellpadding="5">

	<p>다른 아이디를 사용하세요 </p>
	<center>
	<input type="text"  class="form-control"  size="10" maxlength="20" name="id">
	<input type="submit"  class="btn btn-primary" value="ID중복확인" >
	</center>
	</table>
	</form>
</c:if>

</head>

<c:if test="${check != 1}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p>입력하신 [${id}]은(는) 사용하실 수 있는 ID입니다. </p>
        <input type="button"  class="btn btn-info" value="닫기" onclick="setId('${id}')" />
    </td>
  </tr>
</table>
</c:if>
</html>