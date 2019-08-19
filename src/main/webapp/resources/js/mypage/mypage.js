$(document).ready(function() {


	$("#qnaList tr:odd").addClass("odd");
	$("#qnaList tr:not(.odd)").hide();
	$("#qnaList tr:first-child").show(); // 열머리글 보여주기

	$("#qnaList tr.odd").click(function() {
		$(this).next("tr").toggle();
		$(this).find(".arrow").toggleClass("up");

	});


});	