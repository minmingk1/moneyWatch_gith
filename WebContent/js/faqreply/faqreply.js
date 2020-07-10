function insertReply(faq_num, content){
	
	var reply = "#reply"+num;
	
	$.ajax({
		
		type: "POST",
		url: "contentReply.mw",
		data : {faq_num: faq_num,
			content: content},
		success: function(data){
			$(reply).html(data); //리스트 변경			
			
		}
	});
	
	
	
	
	$.ajax({
		
		type: "POST",
		url: "myVideo.mw",
		data : {num: num},
		success: function(data){
			$("#my_video").html(data); //영상변경을 위한 url 호출
		}
	});		
}