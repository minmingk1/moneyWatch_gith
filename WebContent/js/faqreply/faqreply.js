
//댓글 입력
function insertReply(faq_num){
	
	$.ajax({
		
		type: "POST",
		url: "contentReply.mw",
		data : {
				faq_num: faq_num,
				content: $("textarea[name=content]").val()
		       },
		success: function(data){
			$("#replyList").html(data); //리스트 변경	
		}
			
	});
	
	$('textarea').val('');
	
}

//댓글 삭제
function deleteReply(num, faq_num){
	
	$.ajax({
		
		type: "POST",
		url: "contentReplyDelete.mw",
		data : {num: num,
				faq_num: faq_num
				},
		success: function(data){
			alert("삭제 되었습니다.");
			$("#replyList").html(data); //리스트 변경			
		}
		
	});
	
}