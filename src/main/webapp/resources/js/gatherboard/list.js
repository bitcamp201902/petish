$(document).ready(function(){
	var region = document.getElementById('region-category');
	var size = document.getElementById('size-category');
	var keyword = document.getElementById('categoryKeyword');
	
//	region.value = keyword.value;
//	size.value = keyword.value;

});

var actionForm = $("#actionForm");

$(".page-item a").on("click", function(e) {
                            		
	e.preventDefault(); // 이동 방지 
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
                            		
});	

var categoryForm = $("#categoryForm");
var region = document.getElementById('region-category');
var size = document.getElementById('size-category');

function regionSearch() {
	if(!(region.value == "" || region.value == null)) {
		
		categoryForm.find("input[name='keyword']").val(region.value);
		categoryForm.submit();
	}
}

function sizeSearch() {
	if(!(size.value == "" || size.value == null)) {

		categoryForm.find("input[name='type']").val("S");
		categoryForm.find("input[name='keyword']").val(size.value);
		categoryForm.submit();
	}
}

function writeFormClick() {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard/writeForm";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})
}

function detailClick(boardID) {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard/"+boardID+"";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})
}