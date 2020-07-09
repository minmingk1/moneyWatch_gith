<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="image/clock.jpg" alt="IMG">
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
						<a class="txt2" href="idFindForm.mw">Username</a> / <a class="txt2" href="pwFindForm.mw">Password?</a>
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