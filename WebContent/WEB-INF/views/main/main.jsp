<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title>moneyWatch main page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background:  rgba(250, 235, 215,0.5);
    
  }
  </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0; background-color:#dfe9eb;">
  <h1>moneyWatch</h1>
  <p>통장이 텅장이 되지 말자!</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark"">
<div class="container">	
  <a class="navbar-brand" href="#"><i class="fas fa-bars"></i></a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
        <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Member</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">회원정보 수정</a>
      <a class="dropdown-item" href="#">마이페이지</a>
      <a class="dropdown-item" href="#">회원 탈퇴</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Service</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">챗봇</a>
      <a class="dropdown-item" href="Calendar.mw">캘린더</a>
      <a class="dropdown-item" href="#">지출/수입 등록</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">나의 소비패턴 보기</a>
      <a class="dropdown-item" href="#">연령별 지출 비교</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">카드/계좌</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="account_cardForm.mw">등록</a>
      <a class="dropdown-item" href="card_benefit.mw">목록 및 혜택 보기</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
     <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="faqList.mw">FAQ</a>
     </div>
     </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="sense.mw">금융 상식</a>
      <a class="dropdown-item" href="#">챌린지</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">회원 관리</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">연령별 지출 관리</a>
      <a class="dropdown-item" href="#">소비패턴 분석 관리</a>
      <a class="dropdown-item" href="#">카드 목록/혜택 관리</a>
      <a class="dropdown-item" href="#">챗봇 관리</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="sense.mw">게시판 관리</a>
    </div>
    </li>

    </ul>
  </div> 
  </div> 
</nav>

<div class="container" style="margin-top:30px">
  <div class="row">
   
  <div class="col-sm-8">
      <h2>Calendar</h2>
      <h5>Today, Dec 7, 2017</h5>
      <div class="fakeimg" style="height:90%;">
      	<iframe src="Calendar.mw" width="100%" height="106%"></iframe>

      </div>
      <p>캘린더를 클릭해 일정을 등록해보세요!</p>
      <p> ....</p>
      <br>
      
    </div>
   <div class="col-sm-4">
      <h2>About Me</h2>
      <h5>OOO님 환영합니다 :^)</h5>
      <div class="fakeimg" style="background-color:#dba4d7;"></div>
      <p>개인정보 보호를 위해 주기적으로 비밀번호를 변경해주세요!</p>
      <h3>오늘의 금융상식</h3>
      <br />
      <ul class="nav nav-pills flex-column">
     <!--
       <li class="nav-item">
         <a class="nav-link active" href="#">Active</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" href="#">Link</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" href="#">Link</a>
       </li>
       <li class="nav-item">
         <a class="nav-link disabled" href="#">Disabled</a>
       </li>
       -->
        
	<iframe width="360" height="210" src="https://www.youtube.com/embed/${video.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
		
      </ul>
      <br />
      <p style="text-align:right;" onclick="location.href='sense.mw'">금융상식 더 보러 가기 ></p>
      <hr class="d-sm-none">
    </div>
    
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>

</body>
</html>
        