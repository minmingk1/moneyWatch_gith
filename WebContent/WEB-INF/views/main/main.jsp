<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<head>
  <title>moneyWatch main page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
  
  <link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  
  <style>
  .fakeimg {
    height: 200px;
    background:  rgba(250, 235, 215,0.5);
    
  }
  </style>
</head>
<body>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>

<div class="container" style="margin-top:30px">
  <div class="row">
   
  <div class="col-sm-8">
      <h2>Calendar</h2>
      <h5>Today, ${today}</h5>
      <div class="fakeimg" style="height:90%;">
      	<iframe src="Calendar.mw" width="100%" height="106%"></iframe>

      </div>
      <p>캘린더를 클릭해 일정을 등록해보세요!</p>
      <p> ....</p>
      <br>
      
    </div>
   <div class="col-sm-4">
      <h2>About Me</h2><br/>
      <h5>${sessionScope.memId}님 환영합니다 :^)</h5><br/>
      <div class="fakeimg" style="background-color:#fff;">
      <input type="button" class="btn btn-primary" value="마이페이지" onclick="document.location.href='/moneyWatch/myPage.mw'"  style="float:middle;"/>
       <input type="button" class="btn btn-primary" value="로그아웃" onclick="document.location.href='/moneyWatch/logout.mw'"  style="float:middle;"/>
      </div>
      
      <h3>오늘의 금융상식</h3>
      <br />
      <ul class="nav nav-pills flex-column">
        
	<iframe width="360" height="210" src="https://www.youtube.com/embed/${video.sense_url}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><br/>
		
      </ul>
      <br />
      <button style="text-align:right;" onclick="location.href='sense.mw'">금융상식 더 보러 가기 >></button>
      <hr class="d-sm-none">
    </div>
    
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0; margin-top:7%;">
  <p>Footer</p>
</div>

</body>
</html>
        