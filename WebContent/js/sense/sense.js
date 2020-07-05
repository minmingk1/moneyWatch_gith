		
	//sense main에서 카테고리 클릭시 해당 카테고리 리스트 출력
	function categoryAdmin(num){
		
		$.ajax({
			
			type: "POST",
			url: "senseAdminList.mw",
			data : {num: num},
			success: function(data){
				$("#mainList").html(data);
				
			}		
		});
	}

	//sense main에서 카테고리 클릭시 해당 카테고리 리스트 출력
	function category(num){
		
		$.ajax({
			
			type: "POST",
			url: "senseSelect.mw",
			data : {num: num},
			success: function(data){
				$("#mainList").html(data);
				
			}		
		});
	}
	
	//sense main에서 리스트 클릭시 디테일 페이지 호출
	function detail(num){
		
		$.ajax({
			
			type: "POST",
			url: "senseDetailVideo.mw",
			data : {num: num},
			success: function(data){
				$("#video_url").html(data); //영상변경을 위한 url 호출
				
			}
		});
		
		$.ajax({
			
			type: "POST",
			url: "senseReadcount.mw",
			data: {num: num},
			success: function(data){
				$("#readcount").html(data); //조회수 변경
			}
			
		});
		
	}
	
	
	//sense detail에서 삭제 버튼 선택시 작동
	function senseDelete(num){
		
		var password = prompt("비밀번호를 입력하세요.","");
		
		$.ajax({
			
			type: "POST",
			url: "senseDeletePro.mw",
			data: password, num,
			success: function(data){
				html(data);
			}
		});
	}
	
	
	//senseMain에서 스크랩 버튼 작동	
	function scrap(num){
		$.ajax({
			type: "POST",
			url: "scrap.mw",
			data: {
					num: num,
					memo: $("input[name=memo]").val()
				  },
			success: function(){
				close();
				alert("저장 되었습니다. 마이스크랩에서 확인 가능합니다.");
			}
		});
	}
	
	
	//senseMain에서 스크랩+메모
	function scrapmemo(num){
		var url= "memo.mw?num="+num;
		var name = "memo";
		var option = "width=400, height=300, left=100, top=50";
		
		window.open(url, name, option);
	}
	
	
	//sense main에서 카테고리 클릭시 해당 카테고리 리스트 출력
	function myscrapCategory(num){
		
		$.ajax({
			
			type: "POST",
			url: "myscrapCategory.mw",
			data : {num: num},
			success: function(data){
				$("#myScrapList").html(data);
				
			}		
		});
	}
	
	
	
	//마이 스크랩 삭제
	function deletescrap(num){
		$.ajax({
			type: "POST",
			url: "scrapDelete.mw",
			data: {num: num},
			success: function(data){
				$("#myScrapList").html(data);
				alert("삭제되었습니다.");
			}
		});
	}
	
	//myscrap에서 리스트 클릭시 비디오 호출
	function mydetail(num){
		
		var detail = "#detail"+num;
		
		$.ajax({
			
			type: "POST",
			url: "senseDetail.mw",
			data : {num: num},
			success: function(data){
				$(detail).html(data); //리스트 변경			
				
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
	
	
	function click(num){
		alert(num);
		var detail = "#detail"+num;
		
		$(detail).click(function(){
			$(detail).hide();
			return false;
		})	

	}
	
