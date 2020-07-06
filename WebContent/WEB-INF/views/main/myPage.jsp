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
    background: #aaa;
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
      <a class="dropdown-item" href="myPage.mw">마이페이지</a>
      <a class="dropdown-item" href="#">회원정보 수정</a>
      <a class="dropdown-item" href="#">회원 탈퇴</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Service</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">챗봇</a>
      <a class="dropdown-item" href="#">캘린더</a>
      <a class="dropdown-item" href="moneyioForm.mw">지출/수입 등록</a>
      <a class="dropdown-item" href="moneyioList">지출/수입 목록</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="ptEstimate.mw">나의 소비목록 보기</a>
      <a class="dropdown-item" href="ageChart.mw">연령별 지출 비교</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">카드/계좌</a>
    <div class="dropdown-menu" style="">
      <a class="dropdown-item" href="#">등록</a>
      <a class="dropdown-item" href="#">목록 및 혜택 보기</a>
    </div>
    </li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
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
      <a class="dropdown-item" href="#">카드 목록/혜택 관리</a>
      <a class="dropdown-item" href="#">챗봇 관리</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">게시판 관리</a>
      <a class="dropdown-item" href="#">지식관리</a> 
    </div>
    </li>

    </ul>
  </div> 
  </div> 
</nav>
<div class="container" style="margin-top:30px;">
  <div class="row">
    <div class="col-sm-4" style="padding: 0px 5px;">
          <h3>마이페이지</h3>
      <p>OOO님 Hi~~!</p>
    <div class="list-group" style="margin-right:45%;">
  <h7 class="list-group-item list-group-item-action active">개인 정보</h7>
  <a href="#" target="mypage" class="list-group-item list-group-item-action">프로필</a>
  <a href="#" target="mypage" class="list-group-item list-group-item-action">프로필 수정</a>
  <a href="#" target="mypage" class="list-group-item list-group-item-action">회원 탈퇴</a>
  
  <h7 class="list-group-item list-group-item-action active">My 카드/계좌</h7>
  <a href="account_cardForm.mw" target="mypage" class="list-group-item list-group-item-action">카드/계좌 등록</a>
  <a href="myCard.mw" target="mypage" class="list-group-item list-group-item-action">카드/계좌 리스트</a>
  <a href="mycardList.mw" target="mypage" class="list-group-item list-group-item-action">나의 혜택 보기</a>
  
  <h7 class="list-group-item list-group-item-action active">게시판</h7>
  <a href="#" target="mapage" class="list-group-item list-group-item-action">내가 쓴 글 목록</a>
  <a href="myscrap.mw" target="mapage" class="list-group-item list-group-item-action">나의 스크랩</a>
  

</div>

    </div>
    
<div class="col-sm-8">
<!--     
      <h2>이번 달 나의 지출/수입</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class="fakeimg" style="height:60%;">Fake Image</div>
      <p>Some text..</p>
      <h7>잔액</h7>
      <br>
     -->
	<iframe name="mypage" src="myPageMain.mw" width="800" height="800"
	 marginwidth="0" marginheight="0" frameborder="0"></iframe>
	 </div>    
  
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0; margin-top:8%;">
  <p>Footer</p>
</div>

</body>
</html>