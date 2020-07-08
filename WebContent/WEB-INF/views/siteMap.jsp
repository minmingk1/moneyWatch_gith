<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Money Watch SiteMap</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
 a:link { color: balck; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: balck; text-decoration: none;}
</style>
<body>
	<div class="jumbotron text-center">
		<h1>사이트맵</h1>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h3>고객</h3>
				<br />
				<c:if test="${sessionScope.memId == null}">
				<li><a href="registerForm.mw">회원가입</a></li> <br />
				<li><a href="loginForm.mw">로그인</a></li> <br />
				</c:if>
				<li><a href="myPage.mw">마이페이지</a></li> <br />
				<li><a href="memOutForm.mw">회원탈퇴</a></li> <br />
				<li><a href="logout.mw">로그아웃</a></li> <br />
			</div>
			<div class="col-sm-4">
				<h3>서비스</h3>
				<br />
				<li><a href="chat.mw">챗봇</a></li> <br />
				<li><a href="Calendar_sub.mw">캘린더</a></li> <br />
				<li><a href="moneyioForm.mw">지출/수입 등록</a></li> <br />
				<li><a href="moneyioList.mw">지출/수입 목록</a></li> <br />
				<li><a href="ptEstimate.mw">나의 소비 목록 보기</a> </li> <br />
				<li><a href="ageChart.mw">연령별 지출 비교</a></li> <br />
			</div>
			<div class="col-sm-4">
				<h3>카드/계좌 </h3>
				<br />
				<li><a href="account_cardForm_main.mw">등록</a></li> <br />
				<li><a href="card_benefit.mw">목록 및 혜택보기</a></li> <br />
				<li><a href="card_rank.mw">연령별 카드 순위 보기</a></li> <br />
			</div>

		</div>
	</div>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h3>게시판</h3>
				<br />
				<li><a href="sense.mw">금융지식 게시판</a></li> <br />
				<li><a href="faqList.mw">FAQ 및 질문 게시판</a></li> <br />
				<li><a href="myList.mw">내가 쓴 게시물</a></li> <br />
			</div>
			<div class="col-sm-4"></div>
			<c:if test="${sessionScope.memId == 'admin'}">
			<div class="col-sm-4">
				<h3>관리자</h3>
				<br />
				<li><a href="memList.mw">고객 관리</a></li> <br />
				<li><a href="">DB 카드/계좌 목록 및 혜택 관리</a></li> <br />
				<li><a href="">연령별 지출 관리</a></li> <br />
				<li><a href="">소비패턴 분석 관리</a></li> <br />
				<li><a href="faqList.mw">게시판 관리</a></li> <br />
				<li><a href="senseAdmin.mw">지식관리</a></li><br/>
				<li><a href="">DB 챗봇 관리</a></li> <br />
				
			</div>
			</c:if>
		</div>
	</div>
	<br />
	<br />
	<br />
</body>
</html>