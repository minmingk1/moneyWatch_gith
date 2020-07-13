<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> --> 
</head>
<div class="jumbotron text-center" style="margin-bottom:0; background-color:#dfe9eb;">
  <a href="main.mw"><h1>moneyWatch</h1></a>
  <p>통장이 텅장이 되지 말자!</p> 
</div>
<nav style="background-color:#343a40;" class="navbar navbar-expand-sm navbar-dark" >
  <div class="container">	<!-- "navbar-brand" -->
  
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="nav nav-pills"> 
    	<li class="nav-item dropdown">
    	  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bars"></i></a>
		 <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="modifyForm.mw">회원정보 수정</a>
	      <a class="dropdown-item" href="myPage.mw">마이페이지</a>
	      <a class="dropdown-item" href="memOutForm.mw">회원 탈퇴</a>
		  <div class="dropdown-divider"></div>

	      <a class="dropdown-item" href="chat.mw">챗봇</a>
	      <a class="dropdown-item" href="Calendar_sub.mw">캘린더</a>
	      <a class="dropdown-item" href="moneyioForm.mw">지출/수입 등록</a>
	      <a class="dropdown-item" href="moneyioList.mw">지출/수입 목록 </a>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="ptEstimate.mw">나의 소비 목록 보기</a>
	      <a class="dropdown-item" href="ageChart.mw">연령별 지출 비교</a>
		  <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="account_cardForm_main.mw">카드/계좌 등록</a>
	      <a class="dropdown-item" href="card_benefit.mw">카드 목록 및 혜택 보기</a>
	      <a class="dropdown-item" href="card_rank.mw">연령별 카드 순위 보기</a>
		  <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="faqList.mw">FAQ</a>
	      <a class="dropdown-item" href="sense.mw">금융 상식</a>
		  <div class="dropdown-divider"></div>
	    
	    <c:if test="${sessionScope.memId == 'admin'}">

	      <a class="dropdown-item" href="memList.mw">회원 관리</a>
	      <a class="dropdown-item" href="faqList.mw">게시판 관리</a>
	      <a class="dropdown-item" href="senseAdmin.mw">지식 관리</a>
	    </c:if>
	    
	    </div>
	    </li>
		
 	</ul>
 	
 	<ul class="navbar-nav">
	    <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Member</a>
	    <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="modifyForm.mw">회원정보 수정</a>
	      <a class="dropdown-item" href="myPage.mw">마이페이지</a>
	      <a class="dropdown-item" href="memOutForm.mw">회원 탈퇴</a>
	    </div>
	    </li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    
	    <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Service</a>
	    <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="chat.mw">챗봇</a>
	      <a class="dropdown-item" href="Calendar_sub.mw">캘린더</a>
	      <a class="dropdown-item" href="moneyioForm.mw">지출/수입 등록</a>
	      <a class="dropdown-item" href="moneyioList.mw">지출/수입 목록 </a>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="ptEstimate.mw">나의 소비 목록 보기</a>
	      <a class="dropdown-item" href="ageChart.mw">연령별 지출 비교</a>
	    </div>
	    </li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">카드/계좌</a>
	    <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="account_cardForm_main.mw">등록</a>
	      <a class="dropdown-item" href="card_benefit.mw">목록 및 혜택 보기</a>
	      <a class="dropdown-item" href="card_rank.mw">연령별 카드 순위 보기</a>
	    </div>
	    </li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">게시판</a>
	     <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="faqList.mw">FAQ</a>
	      <a class="dropdown-item" href="sense.mw">금융 상식</a>
	    </div>
	    </li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <c:if test="${sessionScope.memId == 'admin'}">
	            <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="admin.mw" role="button" aria-haspopup="true" aria-expanded="false">관리자</a>
	    <div class="dropdown-menu" style="">
	      <a class="dropdown-item" href="memList.mw">회원 관리</a>    
	      <a class="dropdown-item" href="faqList.mw">게시판 관리</a>
	      <a class="dropdown-item" href="senseAdmin.mw">지식 관리</a>
	    </div>
	    </li>
		</c:if>
	    </ul>
	   
	  </div> 
	  
	   <input type="button"  class="btn btn-info" value="로그아웃" onclick="window.location='/moneyWatch/logout.mw'" style="float:right;"  />
	  </div> 
</nav>