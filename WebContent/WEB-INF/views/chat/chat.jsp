<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file = "/WEB-INF/views/main/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chatting</title>
<script src="/moneyWatch/js/jquery-1.10.2.min.js"></script>
<script src="/moneyWatch/js/socket.io.js"></script>
<script>
	$(document).ready(function() { // 계속 실행
		var socket = io.connect("http://172.30.1.16:12345");  //서버연결
			
		$('#msgs0').html('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="color:black; width:95%; border-radius: 10px; ">'
						+ '&nbsp; 안녕하세요. 무엇을 도와드릴까요?'
						+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
		$('#msgs00').html('<table width="100%"><tr>'
				+ '<td bgcolor="yellow" align="center" style="width:16%; border-radius: 10px; ">'
				+ '<a href="./card_benefit.mw" target="_blank" style="color:black;">'
				+ '카드혜택정보</a></td>'
				+ '<td bgcolor="yellow" align="center" style="width:16%; border-radius: 10px; ">'
				+ '<a href="./sense.mw" target="_blank" style="color:black;">'
				+ '금융지식</a></td>'
				+ '<td bgcolor="yellow" align="center" style="width:16%; border-radius: 10px; ">'
				+ '<a href="./Calendar_sub.mw" target="_blank" style="color:black;">'
				+ '오늘 일정</a></td>'
				+ '<td bgcolor="yellow" align="center" style="width:16%; border-radius: 10px; ">'
				+ '<a href="./myList.mw" target="_blank" style="color:black;">'
				+ '내 질문 확인</a></td>'
				+ '<td bgcolor="yellow" align="center" style="width:16%; border-radius: 10px; ">'
				+ '<a href="./faqList.mw" target="_blank" style="color:black;">'
				+ 'FAQ 게시판</a></td>'
				+ '<td bgcolor="yellow" id="chatClick_etc" align="center" style="width:16%; border-radius: 10px; ">'
				+ '기타</td>'				
				+ '</table>');
		
		$("#chat").focus();
			
			
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 
			
			if('${sessionScope.memId}' == 'admin' || '${sessionScope.memId}' == msg.id){ // 자기 자신이 쓴 글(+관리자)
				
				if(msg.adminRe == 'userClickEvent'){
					$('#msgs2').html('<table width="100%">'
							+ '<tr><td bgcolor="#ffbf00" id="chatClick_mybenefit" align="left" style="width:95%; border-radius: 10px; ">'
							+ '내 카드혜택 정보</a></td></tr>'
							+ '<tr><td bgcolor="#ffbf00" id="chatClick_ageCardRank" align="left" style="width:95%; border-radius: 10px; ">'
							+ '카드 추천</a></td></tr>'
							+ '<tr><td bgcolor="#ffbf00" id="chatClick_todayOutSch" align="left" style="width:95%; border-radius: 10px; ">'
							+ '오늘 지출 및 일정</a></td></tr>'
							+ '<tr><td bgcolor="#ffbf00" id="chatClick_keyword" align="left" style="width:95%; border-radius: 10px; ">'
							+ '키워드 안내</a></td></tr>'
							+ '</table>');
				}else if(msg.msg == '내 카드 혜택' || msg.msg == '카드 추천' || msg.msg == '내 카드 혜택' || msg.msg == '오늘 지출액 및 일정' || msg.msg == '키워드 안내'){
					$('#msgs3').html('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="color:black; width:95%; border-radius: 10px; ">' + msg.adminE
							+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
				}else{
				
					$('#msgs').append('<table width="100%"><tr><td style="width:5%"></td><td bgcolor="yellow" align="right" style="color:black; width:95%; border-radius: 10px;">' + msg.msg
									+ '</td></tr><tr><td style="width:5%"></td><td bgcolor="skyblue" align="right" style="width:95%; font-size:70%; border-radius: 10px;">' + msg.nowTime
									+ '</td></tr><tr><td></td></tr></table>');
		
					$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="color:black; width:95%; border-radius: 10px; ">' + msg.adminRe
							+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
					
				}
				$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
			}

		
			$("#chatClick_mybenefit").bind("click", function() {
				var msg = "내 카드 혜택"
				console.log(msg);
				socket.emit('msg', {msg:msg, id:'${id}'});
				
				$("#chat").focus();
				$("#chat").val('');
			});
			
			$("#chatClick_ageCardRank").bind("click", function() {
				var msg = "카드 추천"
				socket.emit('msg', {msg:msg, id:'${id}'});

				$("#chat").focus();
				$("#chat").val('');
			});
			
			$("#chatClick_todayOutSch").bind("click", function() {
				var msg = "오늘 지출액 및 일정"
				socket.emit('msg', {msg:msg, id:'${id}'});

				$("#chat").focus();
				$("#chat").val('');
			});
						
			$("#chatClick_keyword").bind("click", function() {
				var msg = "키워드 안내"
				socket.emit('msg', {msg:msg, id:'${id}'});

				$("#chat").focus();
				$("#chat").val('');
			});
		
		
		});				
		
		$("#sendBtn").bind("click", function() {
			var msg = $("#chat").val();
			socket.emit('msg', {msg:msg, id:'${id}'});

			$("#chat").focus();
			$("#chat").val('');
		});
						
		$("#chatClick_etc").bind("click", function() {
			var msg = "기타"
			socket.emit('msg', {msg:msg, id:'${id}'});

			$("#chat").focus();
			$("#chat").val('');
		});
		
		
			
	});
	
	

</script>
</head>
<body align="center"><br/>
	
	<h3 style="text-align:center;">Chatting Room</h3>
	<input type="button"  class="btn btn-secondary" value="메인으로" onclick="window.location='/moneyWatch/main.mw'" style="margin-left:30%;"/>

	<br /><hr /><br />
	
	
	<!-- 채팅박스 -->
		
	<div id="chatScroll" style="width:40%; height:600px; overflow:auto; border:1px solid; margin: 0 30% 0 30%; border-radius: 10px;" >
		<table id="msgs0" width="100%" cellspacing="10" cellpadding="10"></table>
		<table id="msgs00" width="100%" cellspacing="10" cellpadding="10"></table>
		<table id="msgs2" width="100%" cellspacing="10" cellpadding="10"></table>
		<table id="msgs3" width="100%" cellspacing="10" cellpadding="10"></table>		
		<table id="msgs" width="100%" cellspacing="10" cellpadding="10"></table>
	</div>
	
	<!-- <div style="width:100%; margin: 0 0 0 5%"> -->
	<br />
<table style="width:30%;" border="0" align="center">
<tr>
	<td><input type="text" class="form-control" id="chat" size="40" tabindex="2 placeholder="채팅내용 작성 (Tab키 입력)" /></td>	
	<td><input type="button" class="btn btn-primary" value="send" id="sendBtn" tabindex="3" /></td><br />
</tr>
</table>
<!-- 	</div> -->
	
</body>
<%@ include file = "/WEB-INF/views/main/footer.jsp" %>
</html>