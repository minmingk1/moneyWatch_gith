<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file=""%> --%>

<html>
<head>

<title>회원가입</title>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script language="JavaScript">
	function checkIt(){ //ID 입력값확인하는 함수
		var userinput = eval("document.userinput");
		if(!userinput.id.value){
			alert("ID를 입력해 주세요");
			return false;	
		}
		if(userinput.pw.value==''){ //PW 입력값확인하는 함수
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		if(userinput.pw.value != userinput.pw2.value) //PW와 PW확인값 비교
		{ 
			alert("비밀번호가 같지 않습니다...");
			return false;
		}
		if(userinput.name.value==''){
			alert("이름을 입력해 주세요")
			return false;
		}
		if(userinput.birth_y.value==''){
			alert("생년을 선택해 주세요")
			return false;
		}
		if(userinput.birth_m.value==''){
			alert("생월을 선택해 주세요")
			return false;
		}
			if(userinput.birth_d.value==''){
				alert("생일을 선택해 주세요")
				return false;
		}
			if(userinput.tel.value=='none'){
				alert("통신사를 선택해 주세요")
				return false;
		}
			if(userinput.phone1.value==''){
				alert("휴대폰번호를 입력해 주세요")
				return false;
		}
			if(userinput.phone2.value==''){
				alert("휴대폰번호를 입력해 주세요")
				return false;
		}
			if(userinput.phone3.value==''){
				alert("휴대폰번호를 입력해 주세요")
				return false;
		}
	}
	
	function openConfirmId(userinput){ //ID
		if(userinput.id.value==""){
			alert("아이디를 입력하세요 ...");
			return;
		}
		url = "/moneyWatch/confirmId.mw?id="+userinput.id.value;
		
		open(url,"confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200")
	}
	
	
	function openZipSearch() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById("zon").value = data.zonecode;
					document.getElementById("street").value = data.address;
				}
			}).open();
		}
	
</script>
	<body>	
	<form method="post" action="/moneyWatch/registerPro.mw" name="userinput" onSubmit="return checkIt()">
	<div class="form-group">
	<h2 style="text-align:center;">회원가입</h2><br />
	<table border="1" cellspacing="1" cellpadding="3" style="text-align:center; margin:auto; width:40%;">
		<tr>
			<td bgcolor="">아이디 입력</td>
			<td colspan="2" >
				<input type="text" class="form-control" name="id" maxlength="12" size="10">
			<input type="button" class="btn btn-primary"  name="confirm_id" value="ID중복확인"
					Onclick="openConfirmId(this.form)"></td>

		</tr>
			<td>비밀번호</td>
			<td colspan="2">
				<input type="password" class="form-control" name="pw" size="15" maxlength="12">
			</td>
		<tr>

		</tr>
			<td>비밀번호 확인 </td>
			<td colspan="2">
				<input type="password" class="form-control" name="pw2" size="15" maxlength="12">
			</td>

		<tr>
			<th  colspan="3" bgcolor=""><h5>개인정보 입력</h5></th>

		</tr>
		<tr>
			<td>사용자 이름</td>
			<td>
				<input type="text" class="form-control" name="name" size="15" maxlength="10">
			</td>
		</tr>
		
		<tr>
			<td>성별</td>
			<td>
				<select class="form-control" name="gender">
				<option value="men">남 자</option>
				<option value="woman">여 자</option>
				</select>
		</td>
		</tr>
		
		
 		<tr>
 			<td>생년월일</td>
 			<td>
 			<script language="javascript">
				var today = new Date();
				var toyear = parseInt(today.getFullYear());
				var start = toyear;
				var end = toyear - 70;
				
				document.write("<font size=3><select name=birth_y>");
				document.write("<option value='' selected>");
				for (i=start;i>=end;i--) document.write("<option>"+i);
				document.write("</select>년  ");
				
				document.write("<select name=birth_m>");
				document.write("<option value='' selected>");
				for (i=1;i<=12;i++) document.write("<option>"+i);
				document.write("</select>월  ");
				
				document.write("<select name=birth_d>");
				document.write("<option value='' selected>");
				for (i=1;i<=31;i++) document.write("<option>"+i);
				document.write("</select>일  </font>");
			</script>
		</td>
		</tr>
		
		<tr>		
		<td> 휴대폰 번호 </td>
		<td>
				<select class="form-control" name="tel">
					<option value="none">-통신사-</option>
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LGU+</option>
					<option value="알뜰폰">알뜰폰</option>			
				</select>
				
				<select class="form-control" name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="019">019</option>
				</select>
				-<input type="text" class="form-control" name="phone2" size="10" maxlength="4">
				-<input type="text" class="form-control" name="phone3" size="10" maxlength="4">
		</td>
		</tr>
		
			
		<tr>
		<td>이메일 ID</td>
		<td>
				<input type="text" class="form-control" name="email1" size="10" maxlength="12">@
				<input type="text" class="form-control" name="email2" size="10" maxlength="12">
		
		</td>
		</tr>
		
		
		<tr>
			<td>주소</td>
			<td>
			<input type="text" class="form-control" id="zon" name="zon" SIZE="12" placeholder="우편번호" readonly />
			<input type="button" class="btn btn-primary" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="text" class="form-control" name="street" id="street" SIZE="40" placeholder="주소" readonly /> <br/>
			<input type="text" class="form-control" name="addr" id="addr" SIZE="40" placeholder="상세주소" />
			</td>
		</tr>
		
		
		</form>
		
		<tr>
		<td colspan="2" align="center">
		
			<input type="submit" class="btn btn-primary"  name="confirm" value="등록">
			<input type="reset" class="btn btn-primary"  name="reset" value="다시입력">
			<input type="button" class="btn btn-primary"  value="취소" onclick="window.location='loginForm.mw'">
			
		
		</td>
		</tr>	
	</table>
	
	</div>
	
	</body>
	
	</head>
</html>