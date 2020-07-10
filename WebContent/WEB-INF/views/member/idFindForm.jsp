<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
legend{
	text-align: center;
}
table{
	border-collapse:separate;
	border-spacing: 0 30px;
}
td{
	text-align: center;
}

</style>
</head>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
  <fieldset style="margin-top:10%;">
	<legend>아이디 찾기</legend>
    <form method="post" action="/mw_test/idFindPro.mw" >
    	<div class="form-group row">
    		<table border="0" align="center" width="60%" >
    			<tr>
    				<td><label for="Name">성명</label></td>
    				<td colspan="3"><input type="text" class="form-control" name="name" /></td>
    			</tr><br /><br />
    			<tr>
    				<td><label for="Email">이메일</label></td>
    				<td><input type="text" class="form-control" name="email1"/></td>
    				<td>@</td>
    				<td><select class="form-control" name="email2" >
    					<option value="none">--주소 선택--</option>
    					<option value="naver.com">naver.com</option>
    					<option value="gmail.com">gmail.com</option>
    					<option value="daum.com">daum.com</option>
    					<option value="nate.com">nate.com</option>
    				</select></td>
    				
    			</tr>
    			<tr>
    			<td></td>
    			<td colspan="3">
    			<center>
    				<input type="submit" value="Submit" class="btn btn-primary" />
    				<input type="button" value="로그인" class="btn btn-primary" onclick="javascript:window.location='loginForm.mw'"/>
    			</center>
    			</td>
    			</tr>
    		</table>
    	</div>
    </form>
</fieldset>
</body>
</html>