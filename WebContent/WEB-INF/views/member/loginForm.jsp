<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>로그인</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/moneyWatch/css/loginForm.css" rel="stylesheet" type="text/css" href="css/style.css">
<script src="/moneyWatch/js/loginForm.js"></script>

<!------ Include the above in your HEAD tag ---------->
    <html>
     <head><title>로그인</title>

      <script language="JavaScript">
      
      function begin(){
          document.myform.id.focus();
         }
      
      function checkIt(){
         if(!document.myform.id.value){
        	alert("아이디를 입력하지 않으셨습니다.");
          	document.myform.id.focus();
          	return false;
          	}
         if(!document.myform.pw.value){
          	alert("비밀번호를 입력하지 않으셨습니다.");
          	document.myform.pw.focus();
         	return false;
            }
       }
     </script>  
      

</head>

<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png" alt="IMG">
				</div>
				
				<body onload="begin()">
				<form class="login100-form validate-form" name="myform" action="/moneyWatch/loginPro.mw" method="post" onSubmit="return checkIt()">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="id" placeholder="id">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pw" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Login"/>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="/moneyWatch/idFindForm.mw">
							Username </a>/ <a class="txt2" href="/moneyWatch/pwFindForm.mw">Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/moneyWatch/registerForm.mw">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
				</body> 
			</div>
		</div>
	</div>
	

      
<!--      </head>
    <body onload="begin()">
     <form name="myform" action="/moneyWatch/loginPro.mw" method="post" onSubmit="return checkIt()">
      <table cellSpacing="1" cellPadding="1" width="250" border="1" align="center">  
      
       <tr height="30">
        <td colspan="2" align="middle"><strong>회원로그인</strong></td></tr>
       
       <tr height="30">
        <td width="110" align="center">아이디</td>
        <td width="150" align=center>
         <input type="text" name="id" size="15" maxlength="12"></td></tr>
       
       <tr height="30">
        <td width="110" align="center">비밀번호</td>
        <td width="150" align="center">
         <input type="password" name="pw" size="15" maxlength="12"></td></tr>
       
       <tr height="30">
        <td colspan="2" align="middle">
         <input type="submit" value="로그인">
         <input type="reset" value="다시입력">
         <input type="button" value="회윈가입" onclick="javascript:window.location='/moneyWatch/registerForm.mw'"></td></tr>             
      </table>
     </form>
    </body>  
   </html> -->