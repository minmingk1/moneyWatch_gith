<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<head>
  <title>moneyWatch main page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link href="/moneyWatch/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
</style>

</head>
<body>
<%@ include file = "/WEB-INF/views/main/top.jsp" %>
<div class="container" style="margin-top:30px;">
  <div class="row">
<<<<<<< HEAD
    <div class="col-sm-4" style="margin-left:-10%;">
          <h3>마이페이지</h3><br/>
      	<h5>${memId}님 Hi~~!</h5><br/>
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
		<iframe name="mypage" src="myPageMain.mw" width="800" height="800"
		 marginwidth="0" marginheight="0" frameborder="0"></iframe>
	</div>    
=======
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
  <a href="#" target="mypage" class="list-group-item list-group-item-action">내가 쓴 글 목록</a>
  <a href="myscrap.mw" target="mypage" class="list-group-item list-group-item-action">나의 스크랩</a>
  

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
  
>>>>>>> branch 'master' of https://github.com/minmingk1/moneyWatch_gith.git
  </div>
</div> 

<div class="jumbotron text-center" style="margin-bottom:0;">
  <p>Footer</p>
</div>

</body>
</html>