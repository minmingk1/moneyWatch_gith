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
		var socket = io.connect("http://192.168.0.76:12345");  //서버연결
			
		$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="color:black; width:95%; border-radius: 10px; ">'
						+ '안녕하세요. 무엇을 도와드릴까요?'
						+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
		
		$("#chat").focus();
			
			
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 
			
			if('${sessionScope.memId}' == "admin" || '${sessionScope.memId}' == msg.id){ // 자기 자신이 쓴 글(+관리자)
				
				$('#msgs').append('<table width="100%"><tr><td style="width:5%"></td><td bgcolor="yellow" align="right" style="color:black; width:95%; border-radius: 10px;">' + msg.msg
								+ '</td></tr><tr><td style="width:5%"></td><td bgcolor="skyblue" align="right" style="width:95%; font-size:70%; border-radius: 10px;">' + msg.nowTime
								+ '</td></tr><tr><td></td></tr></table>');
	
				$('#msgs').append('<table width="100%"><tr><td bgcolor="yellowgreen" align="left" style="color:black; width:95%; border-radius: 10px; ">' + msg.adminRe
						+ '</td><td style="width:5%"></td></tr><tr><td></td></tr></table>');
	
			
			
				$('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
				
			}

		});
		
		$("#sendBtn").bind("click", function() {
			var msg = $("#chat").val();
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
		<table id="msgs" width="100%" cellspacing="10" cellpadding="10"	></table>
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