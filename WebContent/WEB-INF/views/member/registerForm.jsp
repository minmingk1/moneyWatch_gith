<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file=""%> --%>

<html>
<head>

<title>회원가입</title>
<link href="" rel="" type="text/css">

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
			if(userinput.tel.value==''){
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

	<body bgcolor="">
	
	<form method="post" action="/moneyWatch/registerPro.mw" name="userinput" onSubmit="return checkIt()">
	<table width="700" border="2" cellspacing="1" cellpadding="3" align="center">
		<tr>
		<td colspan="3" height="40" align="center" bgcolor="">
			<font size="+1" ><b>회원가입</b></font></td>
		</tr>
		<tr>
			<td width="300" bgcolor=""><b>아이디 입력</b></td>
			<td width="300" bgcolor="">&nbsp;</td>	
		</tr>
		
		<tr>
			<td width="300"> ID </td>
			<td width="300">
				<input type="text" name="id" size="10" maxlength="12">
			    <input type="button" name="confirm_id" value="ID중복확인"
					Onclick="openConfirmId(this.form)">
			</td>
		
		
		
		</tr>
			<td width="300"> PW </td>
			<td width="300">
				<input type="password" name="pw" size="15" maxlength="12">
			</td>
		<tr>
		
		
		
		
		</tr>
			<td width="300"> PW 확인 </td>
			<td width="300">
				<input type="password" name="pw2" size="15" maxlength="12">
			</td>
		<tr>
			<td width="300" bgcolor=""><b>개인정보 입력</b></td>
			<td width="300" bgcolor="">&nbsp;</td>
		</tr>
		<tr>
			<td width="300">사용자 이름</td>
			<td width="300">
				<input type="text" name="name" size="15" maxlength="10">
			</td>
		</tr>
		
		<tr>
			<td width="300" >성별</td>
			<td width="300">
				<select name="gender">
				<option value="men">남 자</option>
				<option value="woman">여 자</option>
				</select>
		</td>
		</tr>
		
		
 		<tr>
 			<td width="300">생년월일</td>
 			<td width="300">
 			<script language="javascript">
				var today = new Date();
				var toyear = parseInt(today.getFullYear());
				var start = toyear;
				var end = toyear - 70;
				
				document.write("<font size=2><select name=birth_y>");
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
		<td width="300"> 휴대폰 번호 </td>
		<td width="300">
				<select name="tel">
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LGU+">LGU+</option>
				<option value="알뜰폰">알뜰폰</option>			
				</select>
				
				<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="019">019</option>
				</select>
				
				
				<input type="text" name="phone2" size="10" maxlength="4">
				<input type="text" name="phone3" size="10" maxlength="4">
		</td>
		</tr>
		
			
		<tr>
		<td width="300">이메일 ID</td>
		<td width="300">
				<input type="text" name="email1" size="10" maxlength="12"><a>@</a>
				<input type="text" name="email2" size="10" maxlength="12">
		
		</td>
		</tr>
		
		
		<tr>
			<td height="30">주소</td>
			<td>
			<input type="text" id="zon" name="zon" SIZE="12" placeholder="우편번호" readonly />
			<input type="button" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="text" name="street" id="street" SIZE="40" placeholder="주소" readonly /> <br/>
			<input type="text" name="addr" id="addr" SIZE="40" placeholder="상세주소" />
			</td>
		</tr>
		
		
		</form>
		
		<tr>
		<td colspan="2" align="center">
		
			<input type="submit" name="confirm" value="등록">
			<input type="reset" name="reset" value="다시입력">
		
		</td>
		</tr>	
	</table>
	</body>
	
	</head>
</html>