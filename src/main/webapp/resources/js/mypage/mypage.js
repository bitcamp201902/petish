$(document).ready(function() {


	$("#qnaList tr:odd").addClass("odd");
	$("#qnaList tr:not(.odd)").hide();
	$("#qnaList tr:first-child").show(); // 열머리글 보여주기

	$("#qnaList tr.odd").click(function() {
		$(this).next("tr").toggle();
		$(this).find(".arrow").toggleClass("up");

	});



//mypage_default
	var writing = $("#writing");
	var commented = $("#commented");
	var liked = $("#liked");
	var writingfooter = $(".writingfooter");
	var commentedfooter = $(".commentedfooter");
	var likedfooter = $(".likedfooter");
	//리스트 넣을 곳
	var listUL = $("#ajaxList");
	
	//내가 쓴 글 외 글리스트 관련 이벤트
	//1. 내가 쓴 글 
	writing.on("click", function(e){
		showWritingList();
		
	})
	
	//2. 내가 댓글 쓴 글
	commented.on("click", function(e){
		showCommentedList();	
		alert("하이");
	})
	
	//3. 내가 좋아요 한 글 
	liked.on("click", function(e){
		showLikedList();
		
	})


});	