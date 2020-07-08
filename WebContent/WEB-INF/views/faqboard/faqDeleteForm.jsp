<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<title>유저게시판 삭제 FORM</title>

<script language="javaScript">//글의 비밀번호입력값이 없는지 확인하는 함수
	function deleteCheck() {
		if (document.checkForm.pw.value == '') {
			alert("비밀번호를 입력해주세요");
			document.checkForm.pw.focus();
			return false;

		}
	}
</script>
</head>
<body style="text-align: center;">
	<form mathod="post" name="checkForm" action="/moneyWatch/faqDeletePro.mw" onSubmit="deleteCheck()">

		<table boarder="1" align="center">
			<tr height="30">
				<td align="center">
				    <input type="password" name="pw" size="8" maxlength="10" /> 
				    <input type="hidden" value="${pw}" /> 
				    <input type="hidden" name="faq_num" value="${faq_num}" /> 
				    <input type="hidden" name="pageNum" value="${pageNum}" />
				</td>
			</tr>


			<tr height="30">
				<td align="center">
					<input type="submit" class="btn btn-primary" value="글삭제" /> 
					<input type="button" class="btn btn-primary" value="글목록으로 돌아가기"
					onclick="document.location.href='/moneyWatch/faqList.mw?pageNum=${pageNum}'">
				</td>
			</tr>

		</table>

	</form>
</body>
</html>